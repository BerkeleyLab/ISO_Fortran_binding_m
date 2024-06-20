ISO_Fortran_binding_m
=====================

Fortran interface to the Fortran standard C header file "ISO_Fortran_binding.h."

Downloading and Testing
------------------------
```
git clone https://github.com/BerkeleyLab/ISO_fortran_binding_m
cd ISO_fortran_binding_m
```

### GCC
With the GCC 13 C compiler (`gcc`) installed and at the front of your `PATH`, execute
```
FPM_CC=gcc fpm test
```

#### macOS with Homebrew-installed GCC
```
FPM_CC=gcc-13 fpm test
```
which will ensure the use of the GNU `gcc` rather than Apple `clang`, which is aliased to `gcc` on most macOS systems.
If the Apple Clang `gcc` is accidentally used, an error will likely occur around not being able to find `ISO_Fortran_binding.h`.

### NAG
```
fpm build --compiler nagfor --flag -fpp
```
