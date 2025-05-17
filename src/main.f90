program graphene_tb
  use mod_kinds
  use mod_constants
  use mod_k_space
  use mod_band_structure
  use mod_dos
  use mod_io
  implicit none
  real(real_dp), allocatable :: k_path(:,:), k_dist(:)
  real(real_dp), allocatable :: bands(:,:)
  real(real_dp), allocatable :: k_grid(:,:)
  real(real_dp), allocatable :: dos_values(:), energy_axis(:)
  real(real_dp) :: high_sym(2,3)
  integer :: nk_segment
  integer :: nkx, nky, nbins
  real(real_dp) :: emin, emax, dE
  integer :: i

  high_sym(:,1) = (/0.0_real_dp, 0.0_real_dp/)             ! Gamma
  high_sym(:,2) = (/2.0_real_dp*pi/3.0_real_dp, 2.0_real_dp*pi/ (3.0_real_dp*sqrt(3.0_real_dp))/) ! K
  high_sym(:,3) = (/pi, pi/sqrt(3.0_real_dp)/)              ! M
  nk_segment = 50
  call generate_k_path(high_sym, nk_segment, k_path, k_dist)
  call calculate_bands(k_path, 2, bands)
  call write_band_structure(k_dist, bands, 'data/bands.dat')

  nkx = 50
  nky = 50
  call generate_brillouin_zone_grid(nkx, nky, k_grid)
  emin = -4.0_real_dp
  emax = 4.0_real_dp
  nbins = 200
  call calculate_dos(k_grid, emin, emax, nbins, dos_values)

  allocate(energy_axis(nbins))
  dE = (emax-emin)/real(nbins,real_dp)
  do i = 1, nbins
     energy_axis(i) = emin + (i-0.5_real_dp)*dE
  end do
  call write_dos(energy_axis, dos_values, 'data/dos.dat')
end program graphene_tb
