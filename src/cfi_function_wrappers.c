#include "cfi_function_wrappers.h"

void *cfi_address_(const CFI_cdesc_t *dv, const CFI_index_t subscripts[]){
  return CFI_address(&dv, &subscripts);
};

int cfi_allocate_(CFI_cdesc_t *dv, const CFI_index_t lower_bounds[],
                 const CFI_index_t upper_bounds[], size_t elem_len){
  return CFI_allocate(&dv, &lower_bounds, &upper_bounds, elem_len);
};

int cfi_deallocate_(CFI_cdesc_t *dv){
  return CFI_deallocate(&dv);
};

int cfi_establish_(CFI_cdesc_t *dv, void *base_addr, CFI_attribute_t attribute, CFI_type_t type, size_t elem_len, CFI_rank_t rank, const CFI_index_t extents[]){
   return CFI_establish(&dv, &base_addr, attribute, type, elem_len, rank, &extents);
};

int cfi_is_contiguous_(const CFI_cdesc_t * dv){
  return CFI_is_contiguous(&dv);
};

int cfi_section_(CFI_cdesc_t *result, const CFI_cdesc_t *source,
                const CFI_index_t lower_bounds[], const CFI_index_t upper_bounds[],
                const CFI_index_t strides[]){
  return CFI_section(&result, &source, &lower_bounds, &upper_bounds, &strides);
};

int cfi_select_part_(CFI_cdesc_t *result, const CFI_cdesc_t *source, size_t displacement,
                    size_t elem_len){
  return CFI_select_part(&result, &source, displacement, elem_len);
};

int cfi_setpointer_(CFI_cdesc_t *result, CFI_cdesc_t *source,
                   const CFI_index_t lower_bounds[]){
  return CFI_setpointer(&result, &source, &lower_bounds);
};
