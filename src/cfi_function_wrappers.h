// Copyright (c), The Regents of the University of California
// Terms of use are as specified in LICENSE.txt
#ifndef __CFI_FUNCTION_WRAPPERS_H__
#define __CFI_FUNCTION_WRAPPERS_H__

#include <stdlib.h>
#include <ISO_Fortran_binding.h>

void *cfi_address_(const CFI_cdesc_t *dv, const CFI_index_t subscripts[]);

int cfi_allocate_(CFI_cdesc_t *dv, const CFI_index_t lower_bounds[],
                 const CFI_index_t upper_bounds[], size_t elem_len);

int cfi_deallocate_(CFI_cdesc_t *dv);

int cfi_establish_(CFI_cdesc_t *dv, void *base_addr, CFI_attribute_t attribute,
                  CFI_type_t type, size_t elem_len, CFI_rank_t rank,
                  const CFI_index_t extents[]);

int cfi_is_contiguous_(const CFI_cdesc_t * dv);

int cfi_section_(CFI_cdesc_t *result, const CFI_cdesc_t *source,
                const CFI_index_t lower_bounds[], const CFI_index_t upper_bounds[],
                const CFI_index_t strides[]);

int cfi_select_part_(CFI_cdesc_t *result, const CFI_cdesc_t *source, size_t displacement,
                    size_t elem_len);

int cfi_setpointer_(CFI_cdesc_t *result, CFI_cdesc_t *source,
                   const CFI_index_t lower_bounds[]);
#endif // __CFI_FUNCTION_WRAPPERS_H__
