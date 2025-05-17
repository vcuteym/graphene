module mod_dos
  use mod_kinds
  use mod_hamiltonian
  implicit none
contains
  subroutine calculate_dos(k_grid, energy_min, energy_max, num_bins, dos_values)
    real(real_dp), intent(in) :: k_grid(2, :)
    real(real_dp), intent(in) :: energy_min, energy_max
    integer, intent(in) :: num_bins
    real(real_dp), intent(out) :: dos_values(num_bins)
    integer :: i, j, nk
    real(real_dp) :: bin_width, energy
    real(real_dp) :: eig(2)
    complex(real_dp) :: H(2,2)

    nk = size(k_grid,2)
    dos_values = 0.0_real_dp
    bin_width = (energy_max-energy_min)/real(num_bins,real_dp)
    do i = 1, nk
      call build_hamiltonian(k_grid(:,i), H)
      call solve_hamiltonian(H, eig)
      do j = 1, 2
        energy = eig(j)
        if(energy >= energy_min .and. energy < energy_max) then
          dos_values(int((energy-energy_min)/bin_width)+1) = &
              dos_values(int((energy-energy_min)/bin_width)+1) + 1.0_real_dp
        end if
      end do
    end do
    dos_values = dos_values / (real(nk,real_dp)*bin_width)
  end subroutine calculate_dos
end module mod_dos
