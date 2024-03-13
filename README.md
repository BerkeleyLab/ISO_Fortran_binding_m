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
```
FPM_CC=gfortran fpm test
```

### NAG
```
fpm build --compiler nagfor --flag "-fpp -f2018"
```
