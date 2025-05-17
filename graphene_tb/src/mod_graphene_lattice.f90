module mod_graphene_lattice
  use mod_kinds
  use mod_constants
  implicit none
  real(real_dp), parameter :: sqrt3 = 1.7320508075688772_real_dp
  ! real space lattice vectors
  real(real_dp), dimension(2), parameter :: a1 = (/sqrt3*a/2.0_real_dp,  3.0_real_dp*a/2.0_real_dp/)
  real(real_dp), dimension(2), parameter :: a2 = (/-sqrt3*a/2.0_real_dp, 3.0_real_dp*a/2.0_real_dp/)
  ! reciprocal lattice vectors
  real(real_dp), dimension(2), parameter :: b1 = (/2.0_real_dp*pi/(sqrt3*a), 2.0_real_dp*pi/(3.0_real_dp*a)/)
  real(real_dp), dimension(2), parameter :: b2 = (/-2.0_real_dp*pi/(sqrt3*a), 2.0_real_dp*pi/(3.0_real_dp*a)/)
  ! basis vectors (two atoms per cell)
  real(real_dp), dimension(2,2), parameter :: basis_vectors = reshape( (/ &
       0.0_real_dp, 0.0_real_dp, & ! atom A
       0.0_real_dp, a/sqrt3        & ! atom B
     /), (/2,2/) )
  ! nearest neighbor vectors from A to B
  real(real_dp), dimension(2,3), parameter :: nn_vectors = reshape( (/ &
       0.0_real_dp,  a/sqrt3, &
      -sqrt3*a/2.0_real_dp, -a/2.0_real_dp, &
       sqrt3*a/2.0_real_dp, -a/2.0_real_dp &
     /), (/2,3/) )
end module mod_graphene_lattice
