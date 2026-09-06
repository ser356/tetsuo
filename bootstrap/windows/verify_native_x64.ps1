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

Write-Host "[1/5] Building stage1 and stage2"
Build-TetsuoExe "bootstrap/tetsuoc-x64.exe" "$build/stage1"
Build-TetsuoExe "$build/stage1.exe" "$build/stage2"

Write-Host "[2/5] Comparing fixpoint hashes"
$stage1Hash = (Get-FileHash "$build/stage1.exe" -Algorithm SHA256).Hash
$stage2Hash = (Get-FileHash "$build/stage2.exe" -Algorithm SHA256).Hash
Write-Host "stage1: $stage1Hash"
Write-Host "stage2: $stage2Hash"
if ($stage1Hash -ne $stage2Hash) { throw "Windows x64 fixpoint failed: stage1 != stage2" }

Write-Host "[3/5] Building smoke executable"
$smokeSource = "$build/smoke.tt"
Set-Content -Path $smokeSource -Value "fun main() -> u64 { return 42 }" -NoNewline
$stage2Path = (Resolve-Path "$build/stage2.exe").Path
& $stage2Path --target=windows-x64 $smokeSource -o "$build/smoke.s"
if ($LASTEXITCODE -ne 0) { throw "stage2 failed to compile smoke" }
clang --target=x86_64-windows-msvc -c "$build/smoke.s" -o "$build/smoke.obj"
if ($LASTEXITCODE -ne 0) { throw "clang failed to assemble smoke" }
python tools/link_pe_x64.py "$build/smoke.obj" "$build/smoke.exe"
if ($LASTEXITCODE -ne 0) { throw "PE linker failed for smoke" }
Write-Host "[4/5] Running smoke executable; expected exit=42"
$smokePath = (Resolve-Path "$build/smoke.exe").Path
& $smokePath
$smokeExit = $LASTEXITCODE
Write-Host "Smoke exit: $smokeExit"
if ($smokeExit -ne 42) { throw "smoke returned $smokeExit, expected 42" }

Write-Host "[5/5] Building and running component object"
$componentSource = "$build/component.tt"
$componentAssembly = "$build/component.s"
$componentObject = "$build/component.obj"
$componentC = "$build/component.c"
$componentExe = "$build/component.exe"
Set-Content -Path $componentSource -Value "fun tt_component_add(a: u64, b: u64) -> u64 { return a + b }" -NoNewline
& $stage2Path --emit=obj --target=windows-x64 $componentSource -o $componentAssembly
if ($LASTEXITCODE -ne 0) { throw "stage2 failed to compile component" }
$assemblyText = Get-Content $componentAssembly -Raw
if ($assemblyText -match "tt_start|__getmainargs|call\s+main|call\s+exit") { throw "component contains startup" }
clang --target=x86_64-windows-msvc -c $componentAssembly -o $componentObject
if ($LASTEXITCODE -ne 0) { throw "clang failed to assemble component" }
Set-Content -Path $componentC -Value "#include <stdint.h>`nextern uint64_t tt_component_add(uint64_t, uint64_t);`nint main(void) { return tt_component_add(19, 23) == 42 ? 0 : 1; }" -NoNewline
clang $componentC $componentObject -o $componentExe
if ($LASTEXITCODE -ne 0) { throw "clang failed to link component" }
& (Resolve-Path $componentExe).Path
if ($LASTEXITCODE -ne 0) { throw "component smoke returned $LASTEXITCODE" }

Write-Host "VERIFY WINDOWS X64 OK"
exit 0
