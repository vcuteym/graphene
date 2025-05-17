module mod_dos
  use mod_kinds, only: real_dp, complex_dp
  use mod_hamiltonian, only: build_hamiltonian, solve_hamiltonian
  implicit none
contains
  subroutine calculate_dos(k_grid, energy_min, energy_max, num_bins, dos_values)
    real(real_dp), intent(in) :: k_grid(2,:)
    real(real_dp), intent(in) :: energy_min, energy_max
    integer, intent(in) :: num_bins
    real(real_dp), allocatable, intent(out) :: dos_values(:)
    integer :: nk, i, b
    real(real_dp) :: dE, energy
    complex(complex_dp) :: H(2,2)
    real(real_dp) :: eig(2)
    nk = size(k_grid,2)
    allocate(dos_values(num_bins))
    dos_values = 0.0_real_dp
    dE = (energy_max - energy_min)/real(num_bins, real_dp)
    do i = 1, nk
       call build_hamiltonian(k_grid(:,i), H)
       call solve_hamiltonian(H, eig)
       do b = 1, 2
          energy = eig(b)
          if (energy >= energy_min .and. energy <= energy_max) then
             dos_values(int((energy-energy_min)/dE)+1) = dos_values(int((energy-energy_min)/dE)+1) + 1.0_real_dp
          end if
       end do
    end do
    dos_values = dos_values / real(nk, real_dp)
  end subroutine calculate_dos
end module mod_dos
