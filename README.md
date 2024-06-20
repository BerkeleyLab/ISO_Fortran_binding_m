ISO_Fortran_binding_m
=====================

This repository provides an interface to the `ISO_Fortran_binding.h` C header file defined in the Fortran standard.
The interface is defined in the repository's [`iso_fortran_binding_m`] module and includes definitions of 

* Kind parameters: `CFI_index_t`, `CFI_rank_t`, `CFI_attribute_t`, and `CFI_type_t`;
* C-interoperable dervied types: `CFI_dim_t` and `CFI_cdesc_t`; and
* Wrappers for standard functions: `cfi_address_`, `cfi_allocate_`, `cfi_deallocate_`, `cfi_establish_`, `cfi_establish`, `cfi_is_contiguous`, `cfi_section_`, `cfi_select_part_`, and `cfi_setpointer_`; and
* Utility functions: `base_addr`, `elem_len`, `version`, `rank`, `type`, `attribute`, and `lower_bound`, `extent`, `sm`, and `cfi_sizeof`

with the wrapper function names contain trailing underscores appended to the function names of each wrapped standard function.
  
Downloading and Building
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

macOS users may need to fix their path to ensure that the `gcc` that is used is the GNU `gcc`. You can also use the command

```
FPM_CC=gfortran fpm test
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

[`ISO_Fortran_binding_m`]: https://github.com/BerkeleyLab/ISO_Fortran_binding_m/blob/main/src/iso_fortran_binding_m.F90
