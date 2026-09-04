# Microbenchmarks

Tres kernels comparan el backend tetsuo con Clang `-O0` y `-O2`: recorrido de bytes, aritmética en bucle y llamadas encadenadas.

Ejecutar `bash bench/run.sh`. Cada binario valida el mismo checksum. Los tiempos son segundos de pared y deben compararse dentro de una misma ejecución; no forman parte de `bootstrap/verify.sh`.

El script también mide `tests/fixpoint_macho_build.sh`. Ejecutar varias veces y comparar medianas; cerrar otras cargas antes de tomar una línea base.
