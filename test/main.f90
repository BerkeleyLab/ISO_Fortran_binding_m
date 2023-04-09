program main
  use cfi_sizeof_test_m, only : cfi_sizeof_test_t  
  implicit none

  type(cfi_sizeof_test_t) cfi_sizeof_test

  integer :: passes=0, tests=0

  call cfi_sizeof_test%report(passes, tests)

  print *
  print *,"_________ In total, ",passes," of ",tests, " tests pass. _________"
end program
