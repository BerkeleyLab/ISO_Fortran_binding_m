module get_cfi_cdesc_t_h_m
  use iso_c_binding, only : c_ptr
  implicit none

  interface

    function get_cfi_cdesc_t(stuff) result(cfi_cdesc) bind(C)
      import c_ptr
      implicit none
      type(*), dimension(..), intent(in), target :: stuff
      type(c_ptr), target :: cfi_cdesc
    end function

  end interface

end module
