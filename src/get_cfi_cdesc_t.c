#include <stdio.h>
#include "get_cfi_cdesc_t.h"

CFI_cdesc_t* get_cfi_cdesc_t(CFI_cdesc_t* CFI_cdesc){
#ifdef VERBOSE
    printf("\n");
    printf("___ In C _______________\n");
    printf("base_addr %d\n", CFI_cdesc->base_addr);
    printf("elem_len  %d\n", CFI_cdesc->elem_len);
    printf("version  %d\n",  CFI_cdesc->version);
    printf("rank  %d\n",     CFI_cdesc->rank);
    printf("type  %d\n",     CFI_cdesc->type);
    printf("attribute %d\n", CFI_cdesc->attribute);
    for(int i=0; i<CFI_cdesc->rank; i++){
      printf("dim %d: %d %d %d\n", i, CFI_cdesc->dim[i].lower_bound, CFI_cdesc->dim[i].extent, CFI_cdesc->dim[i].sm);
    }
#endif // VERBOSE
  return CFI_cdesc;
};
