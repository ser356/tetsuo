$ErrorActionPreference = "Stop"
Set-Location (Resolve-Path "$PSScriptRoot/../..")

$build = "build/windows-native"
New-Item -ItemType Directory -Force $build | Out-Null
Write-Host "Platform: $([System.Environment]::OSVersion); architecture: $env:PROCESSOR_ARCHITECTURE"

function Build-TetsuoExe($compiler, $output) {
    $compilerPath = (Resolve-Path $compiler).Path
    $assembly = "$output.s"
    $object = "$output.obj"
    Write-Host "Compiling $output with $compilerPath"
    & $compilerPath --target=windows-x64 tests/fixpoint_entry.tt -o $assembly
    if ($LASTEXITCODE -ne 0) { throw "$compiler failed with exit code $LASTEXITCODE" }
    Write-Host "Assembling $assembly"
    clang --target=x86_64-windows-msvc -c $assembly -o $object
    if ($LASTEXITCODE -ne 0) { throw "clang failed" }
    Write-Host "Linking $output.exe"
    python tools/link_pe_x64.py $object "$output.exe"
    if ($LASTEXITCODE -ne 0) { throw "PE linker failed" }
    Get-Item "$output.exe" | Format-List FullName,Length
}

Write-Host "[1/4] Building stage1 and stage2"
Build-TetsuoExe "bootstrap/tetsuoc-x64.exe" "$build/stage1"
Build-TetsuoExe "$build/stage1.exe" "$build/stage2"

Write-Host "[2/4] Comparing fixpoint hashes"
$stage1Hash = (Get-FileHash "$build/stage1.exe" -Algorithm SHA256).Hash
$stage2Hash = (Get-FileHash "$build/stage2.exe" -Algorithm SHA256).Hash
Write-Host "stage1: $stage1Hash"
Write-Host "stage2: $stage2Hash"
if ($stage1Hash -ne $stage2Hash) { throw "Windows x64 fixpoint failed: stage1 != stage2" }

Write-Host "[3/4] Building smoke executable"
$smokeSource = "$build/smoke.tt"
Set-Content -Path $smokeSource -Value "fun main() -> u64 { return 42 }" -NoNewline
$stage2Path = (Resolve-Path "$build/stage2.exe").Path
& $stage2Path --target=windows-x64 $smokeSource -o "$build/smoke.s"
if ($LASTEXITCODE -ne 0) { throw "stage2 failed to compile smoke" }
clang --target=x86_64-windows-msvc -c "$build/smoke.s" -o "$build/smoke.obj"
if ($LASTEXITCODE -ne 0) { throw "clang failed to assemble smoke" }
python tools/link_pe_x64.py "$build/smoke.obj" "$build/smoke.exe"
if ($LASTEXITCODE -ne 0) { throw "PE linker failed for smoke" }
Write-Host "[4/4] Running smoke executable; expected exit=42"
$smokePath = (Resolve-Path "$build/smoke.exe").Path
& $smokePath
Write-Host "Smoke exit: $LASTEXITCODE"
if ($LASTEXITCODE -ne 42) { throw "smoke returned $LASTEXITCODE, expected 42" }

Write-Host "VERIFY WINDOWS X64 OK"
