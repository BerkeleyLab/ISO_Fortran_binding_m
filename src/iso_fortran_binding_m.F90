module iso_fortran_binding_m
  use iso_c_binding, only : c_ptr, c_size_t, c_int, c_int8_t, c_int16_t, c_f_pointer, c_ptrdiff_t
#ifdef NAGFOR
  use iso_c_binding, only : c_ptr, c_size_t, c_int, c_int8_t, c_int16_t, c_f_pointer, c_long
#endif
  use get_cfi_cdesc_t_h_m, only : get_cfi_cdesc_t
  implicit none

  integer, parameter :: CFI_index_t = c_ptrdiff_t 
  integer, parameter :: CFI_rank_t = c_int8_t
  integer, parameter :: CFI_attribute_t = c_int8_t
  integer, parameter :: CFI_type_t = c_int16_t

#ifdef NAGFOR
  integer, parameter :: CFI_index_t = c_long
  integer, parameter :: CFI_rank_t = c_int8_t
  integer, parameter :: CFI_attribute_t = c_int8_t
  integer, parameter :: CFI_type_t = c_int16_t
#endif

  type, bind(C) :: CFI_dim_t
    integer(CFI_index_t) lower_bound 
    integer(CFI_index_t) extent
    integer(CFI_index_t) sm
  end type

  type, bind(C) :: CFI_cdesc_t
    type(c_ptr) base_addr
    integer(c_size_t) elem_len
    integer(c_int) version
    integer(CFI_rank_t) rank
    integer(CFI_attribute_t) attribute
    integer(CFI_type_t) type
    type(CFI_dim_t), dimension(15) :: dim
  end type
  
  interface CFI_cdesc_t
    procedure get_cfi_cdesc_t
  end interface

  interface

    function cfi_address_(dv, subscripts) result(c_address) bind(C)
      import CFI_index_t, c_ptr
      type(*), intent(in) :: dv(..)
      integer(CFI_index_t), intent(in) :: subscripts(*)
      type(c_ptr) c_address
    end function
     
    function cfi_allocate_(dv, lower_bounds, upper_bounds, elem_len) result(ierr) bind(C)
      import CFI_index_t, c_size_t, c_int
      implicit none
      integer(CFI_index_t) lower_bounds(*), upper_bounds(*)
      integer(c_size_t), value :: elem_len
      type(*), intent(inout) :: dv(..)
      integer(c_int) ierr
    end function

    function cfi_deallocate_(dv) result(ierr) bind(C)
      import c_int
      implicit none
      type(*), intent(inout) :: dv(..)
      integer(c_int) ierr
    end function

    function cfi_establish_(dv, base_addr, attribute, type, elem_len, rank, extents) result(ierr) bind(C)
      import c_ptr, c_size_t, CFI_attribute_t, CFI_type_t, CFI_rank_t, CFI_index_t, c_int
      implicit none
      type(*), intent(inout) :: dv(..)
      type(c_ptr), intent(inout) :: base_addr
      integer(CFI_attribute_t), value :: attribute
      integer(CFI_type_t), value :: type
      integer(c_size_t), value :: elem_len
      integer(CFI_rank_t), value :: rank
      integer(CFI_index_t), intent(in) :: extents(*)
      integer(c_int) ierr
    end function

    function cfi_is_contiguous_(dv) result(ierr) bind(C)
      import c_int
      implicit none
      type(*), intent(in) :: dv(..)
      integer(c_int) ierr
    end function

    function cfi_section_(result, source, lower_bounds, upper_bounds, strides) result(ierr) bind(C)
      import c_ptr, CFI_index_t, c_int
      implicit none
      type(c_ptr) result
      type(*), intent(in) :: source(..)
      integer(CFI_index_t), intent(in) :: lower_bounds(*), upper_bounds(*), strides(*)
      integer(c_int) ierr
    end function

    function cfi_select_part_(result, source, displacement, elem_len) result(ierr) bind(C)
      import c_ptr, c_size_t, c_int
      implicit none
      type(c_ptr), intent(inout) :: result
      type(*), intent(in) :: source(..)
      integer(c_size_t), value :: displacement, elem_len
      integer(c_int) ierr
    end function

    function cfi_setpointer_(result, source, lower_bounds) result(ierr) bind(C)
      import c_ptr, c_int, CFI_index_t
      implicit none 
      type(c_ptr), intent(inout) :: result
      type(*), intent(in) :: source(..)
      integer(CFI_index_t), intent(in) :: lower_bounds(*)
      integer(c_int) ierr
    end function

  end interface

contains

  function base_addr(CFI_cdesc)
    type(*), dimension(..), intent(in) :: CFI_cdesc
    type(CFI_cdesc_t), pointer :: ptr
    type(c_ptr)  base_addr
    call c_f_pointer(CFI_cdesc_t(CFI_cdesc), ptr)
    base_addr  = ptr%base_addr
  end function

  function elem_len(CFI_cdesc)
    type(*), dimension(..), intent(in) :: CFI_cdesc
    type(CFI_cdesc_t), pointer :: ptr
    integer(c_size_t) elem_len
    call c_f_pointer(CFI_cdesc_t(CFI_cdesc), ptr)
    elem_len = ptr%elem_len 
  end function

  function version(CFI_cdesc)
    type(*), dimension(..), intent(in) :: CFI_cdesc
    type(CFI_cdesc_t), pointer :: ptr
    integer(c_int) version
    call c_f_pointer(CFI_cdesc_t(CFI_cdesc), ptr)
    version = ptr%version
  end function

  function rank(CFI_cdesc)
    type(*), dimension(..), intent(in) :: CFI_cdesc
    type(CFI_cdesc_t), pointer :: ptr
    integer(CFI_rank_t) rank
    call c_f_pointer(CFI_cdesc_t(CFI_cdesc), ptr)
    rank = ptr%rank
  end function

  function type(CFI_cdesc)
    type(*), dimension(..), intent(in) :: CFI_cdesc
    type(CFI_cdesc_t), pointer :: ptr
    integer(CFI_type_t) type
    call c_f_pointer(CFI_cdesc_t(CFI_cdesc), ptr)
    type = ptr%type
  end function

  function attribute(CFI_cdesc)
    type(*), dimension(..), intent(in) :: CFI_cdesc
    type(CFI_cdesc_t), pointer :: ptr
    integer(CFI_attribute_t) attribute
    call c_f_pointer(CFI_cdesc_t(CFI_cdesc), ptr)
    attribute = ptr%attribute
  end function

  function lower_bound(CFI_cdesc)
    type(*), dimension(..), intent(in) :: CFI_cdesc
    type(CFI_cdesc_t), pointer :: ptr
    integer(CFI_index_t), allocatable :: lower_bound(:)
    call c_f_pointer(CFI_cdesc_t(CFI_cdesc), ptr)
    lower_bound = ptr%dim(:)%lower_bound
  end function

  function extent(CFI_cdesc)
    type(*), dimension(..), intent(in) :: CFI_cdesc
    type(CFI_cdesc_t), pointer :: ptr
    integer(CFI_index_t), allocatable :: extent(:)
    call c_f_pointer(CFI_cdesc_t(CFI_cdesc), ptr)
    extent = ptr%dim(:)%extent
  end function

  function sm(CFI_cdesc)
    type(*), dimension(..), intent(in) :: CFI_cdesc
    type(CFI_cdesc_t), pointer :: ptr
    integer(CFI_index_t), allocatable :: sm(:)
    call c_f_pointer(CFI_cdesc_t(CFI_cdesc), ptr)
    sm = ptr%dim(:)%sm
  end function

  function cfi_sizeof(CFI_cdesc)
    type(*), dimension(..), intent(in) :: CFI_cdesc
    type(CFI_cdesc_t), pointer :: ptr
    integer(CFI_index_t) cfi_sizeof
    call c_f_pointer(CFI_cdesc_t(CFI_cdesc), ptr)
    cfi_sizeof = product(ptr%dim(1:ptr%rank)%extent)*ptr%elem_len 
  end function

end module iso_fortran_binding_m
