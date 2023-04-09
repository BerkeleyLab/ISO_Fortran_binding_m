#ifndef __C_ALLOCATE__
#define __C_ALLOCATE__

#include "c_allocate.h"

void *c_allocate(size_t nbytes)
{
 return malloc (nbytes);
}
#endif // __C_ALLOCATE__
