ISO_Fortran_binding_m
=====================

Fortran interface to the Fortran standard C header file "ISO_Fortran_binding.h."

Downloading and Building
------------------------
```
git clone https://github.com/BerkeleyLab/ISO_fortran_binding_m
cd ISO_fortran_binding_m
```

### GCC
Version: Tested for GCC Version 13

```
FPM_CC=gcc fpm test
```

Note: Apple users may need to fix their path to ensure that the `gcc` that is used is the GNU `gcc`. The following command also works and avoids the name clash between the Apple Clang `gcc` and the GNU `gcc`. If the Apple Clang `gcc` is accidentally used, an error will likely occur around not being able to find `ISO_Fortran_binding.h`

```
FPM_CC=gfortran fpm test
```

### NAG
```
fpm build --compiler nagfor --flag "-fpp -f2018"
```
