module mod_band_structure
  use mod_kinds, only: real_dp, complex_dp
  use mod_hamiltonian, only: build_hamiltonian, solve_hamiltonian
  implicit none
contains
  subroutine calculate_bands(k_path, num_bands, band_energies)
    real(real_dp), intent(in) :: k_path(2, :)
    integer, intent(in) :: num_bands
    real(real_dp), allocatable, intent(out) :: band_energies(:,:)
    integer :: nk, i
    complex(complex_dp) :: H(2,2)
    nk = size(k_path,2)
    allocate(band_energies(num_bands, nk))
    do i = 1, nk
       call build_hamiltonian(k_path(:,i), H)
       call solve_hamiltonian(H, band_energies(:,i))
    end do
  end subroutine calculate_bands
end module mod_band_structure
