module mod_hamiltonian
  use mod_kinds
  use mod_constants
  use mod_graphene_lattice
  implicit none
contains
  subroutine build_hamiltonian(k_vec, H)
    real(real_dp), intent(in) :: k_vec(2)
    complex(real_dp), intent(out) :: H(2,2)
    integer :: i
    complex(real_dp) :: phase, sum
    sum = (0.0_real_dp, 0.0_real_dp)
    do i = 1, size(nn_vectors,2)
      phase = exp( (0.0_real_dp,1.0_real_dp) * dot_product(k_vec, nn_vectors(:,i)) )
      sum = sum + phase
    end do
    H = 0.0_real_dp
    H(1,2) = -t * sum
    H(2,1) = conjg(H(1,2))
  end subroutine build_hamiltonian

  subroutine solve_hamiltonian(H, eigenvalues)
    complex(real_dp), intent(in) :: H(2,2)
    real(real_dp), intent(out) :: eigenvalues(2)
    real(real_dp) :: offdiag
    offdiag = abs(H(1,2))
    eigenvalues(1) = -offdiag
    eigenvalues(2) =  offdiag
  end subroutine solve_hamiltonian
end module mod_hamiltonian
