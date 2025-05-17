module mod_hamiltonian
  use mod_kinds, only: real_dp, complex_dp
  use mod_constants, only: t
  use mod_graphene_lattice, only: nn_vectors
  implicit none
contains
  subroutine build_hamiltonian(k_vec, H)
    real(real_dp), intent(in) :: k_vec(2)
    complex(complex_dp), intent(out) :: H(2,2)
    real(real_dp) :: phase
    integer :: i
    complex(complex_dp) :: f
    f = (0.0_real_dp, 0.0_real_dp)
    do i = 1, 3
       phase = dot_product(k_vec, nn_vectors(:,i))
       f = f + exp(cmplx(0.0_real_dp, phase))
    end do
    H = (0.0_real_dp,0.0_real_dp)
    H(1,2) = t * f
    H(2,1) = conjg(H(1,2))
  end subroutine build_hamiltonian

  subroutine solve_hamiltonian(H, eigenvalues)
    complex(complex_dp), intent(in) :: H(2,2)
    real(real_dp), intent(out) :: eigenvalues(2)
    real(real_dp) :: mag
    mag = abs(H(1,2))
    eigenvalues(1) = mag
    eigenvalues(2) = -mag
  end subroutine solve_hamiltonian
end module mod_hamiltonian
