module mod_band_structure
  use mod_kinds
  use mod_hamiltonian
  implicit none
contains
  subroutine calculate_bands(k_path, num_bands, band_energies)
    real(real_dp), intent(in) :: k_path(2, :)
    integer, intent(in) :: num_bands
    real(real_dp), intent(out) :: band_energies(num_bands, :)
    integer :: nk, i
    complex(real_dp) :: H(2,2)
    real(real_dp) :: eig(2)
    nk = size(k_path,2)
    if(num_bands /= 2) stop 'num_bands must be 2'
    if(size(band_energies,2) < nk) stop 'band_energies array too small'
    do i = 1, nk
      call build_hamiltonian(k_path(:,i), H)
      call solve_hamiltonian(H, eig)
      band_energies(:,i) = eig
    end do
  end subroutine calculate_bands
end module mod_band_structure
