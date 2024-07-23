! Copyright (c), The Regents of the University of California
! Terms of use are as specified in LICENSE.txt
program main
  use iso_c_binding, only : c_size_t, c_ptr, c_sizeof, c_f_pointer, c_int, c_null_ptr
  use iso_fortran_binding_m, only : CFI_attribute_t, CFI_type_t, CFI_rank_t, CFI_index_t, CFI_establish_, cfi_sizeof
  implicit none

  interface

    function c_allocate(nbytes) result(memory) bind(C)
      import c_size_t, c_ptr
      implicit none
      integer(c_size_t), value :: nbytes
      type(c_ptr) memory
    end function

  end interface

  type stuff_t
     integer i
  end type

  type(stuff_t) stuff
  type(c_ptr), pointer :: c_base_addr
  integer(c_int) ierr
  integer(CFI_attribute_t) :: attribute_ = 0
  integer(CFI_type_t) :: type_ = 1025
  integer(CFI_index_t) :: elem_len_ = 1
  integer(CFI_rank_t) :: rank_ = 0
  
  c_base_addr = unlim_poly_alloc(stuff)
  ierr = CFI_establish_(stuff, c_base_addr, attribute_, type_, elem_len_, rank_, [integer(CFI_index_t) :: ])

  block 
    type(stuff_t), pointer :: f_base_addr
    call c_f_pointer(c_base_addr, f_base_addr )  ! just a demo -- probably not needed anymore
  end block

contains

  function unlim_poly_alloc(mold) result(c_allocated)
    type(*), intent(inout) :: mold(..)
    type(c_ptr) c_allocated
    c_allocated = c_allocate(cfi_sizeof(mold)) ! mimic c_sizeof because gfortran doesn't yet support type(*) argument
  end function

end program
