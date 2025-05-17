module mod_constants
  use mod_kinds, only: real_dp
  implicit none
  real(real_dp), parameter :: pi = 3.14159265358979323846_real_dp
  real(real_dp), parameter :: a = 2.46_real_dp ! lattice constant in Angstrom
  real(real_dp), parameter :: t = -2.7_real_dp  ! hopping parameter in eV
end module mod_constants
