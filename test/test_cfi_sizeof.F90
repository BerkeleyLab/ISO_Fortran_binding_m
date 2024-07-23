! Copyright (c), The Regents of the University of California
! Terms of use are as specified in LICENSE.txt
module cfi_sizeof_test_m
  !! Unit tests for cfi_sizeof function
  use test_m, only : test_t, test_result_t
  use iso_fortran_binding_m, only : cfi_sizeof
  use iso_c_binding, only : c_int
  implicit none

  private
  public :: cfi_sizeof_test_t

  type, extends(test_t) :: cfi_sizeof_test_t
  contains
    procedure, nopass :: subject
    procedure, nopass :: results
  end type

contains

  pure function subject() result(specimen)
    character(len=:), allocatable :: specimen
    specimen = "The cfi_sizeof function" 
  end function

  function results() result(test_results)
    type(test_result_t), allocatable :: test_results(:)

    test_results = [ &
      test_result_t("returning c_sizeof for a multidimensional array", check_cfi_sizeof_array()), &
      test_result_t("returning c_sizeof for a scalar", check_cfi_sizeof_scalar()) &
    ]
  end function

  function check_cfi_sizeof_scalar() result(passed)
    logical passed
    integer(c_int) scalar
    integer, parameter :: bits_per_byte = 8
    passed = cfi_sizeof(scalar) == storage_size(scalar)/bits_per_byte
  end function

  function check_cfi_sizeof_array() result(passed)
    logical passed
    integer(c_int) array(1,2,3,4)
    integer, parameter :: bits_per_byte = 8
    passed = cfi_sizeof(array) == product(shape(array)) * storage_size(array)/bits_per_byte
  end function

end module cfi_sizeof_test_m
