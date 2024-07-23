// Copyright (c), The Regents of the University of California
// Terms of use are as specified in LICENSE.txt
#ifndef __C_ALLOCATE__
#define __C_ALLOCATE__

#include "c_allocate.h"

void *c_allocate(size_t nbytes)
{
 return malloc (nbytes);
}
#endif // __C_ALLOCATE__
