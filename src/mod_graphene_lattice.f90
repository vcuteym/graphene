module mod_graphene_lattice
  use mod_kinds, only: real_dp
  use mod_constants, only: a, pi
  implicit none
  real(real_dp), parameter :: sqrt3 = 1.7320508075688772_real_dp
  ! real space lattice vectors
  real(real_dp), parameter :: a1(2) = (/  sqrt3/2.0_real_dp*a, -0.5_real_dp*a /)
  real(real_dp), parameter :: a2(2) = (/  sqrt3/2.0_real_dp*a,  0.5_real_dp*a /)
  ! reciprocal lattice vectors
  real(real_dp), parameter :: b1(2) = (/(2.0_real_dp*pi/a)*(1.0_real_dp/sqrt3), -(2.0_real_dp*pi/a)*(1.0_real_dp)/)/
  real(real_dp), parameter :: b2(2) = (/(2.0_real_dp*pi/a)*(1.0_real_dp/sqrt3),  (2.0_real_dp*pi/a)*(1.0_real_dp)/)/
  ! basis vectors
  real(real_dp), parameter :: basis_vectors(2,2) = reshape( (/0.0_real_dp, 0.0_real_dp, &
                                                           1.0_real_dp/sqrt3*a, 0.0_real_dp/), &
                                                         (/2,2/) )
  ! nearest neighbor vectors (from A to B)
  real(real_dp), parameter :: nn_vectors(2,3) = reshape((/ &
        0.0_real_dp,        a/sqrt3, &
        -sqrt3/2.0_real_dp*a, -0.5_real_dp*a, &
         sqrt3/2.0_real_dp*a, -0.5_real_dp*a /), (/2,3/))
end module mod_graphene_lattice
