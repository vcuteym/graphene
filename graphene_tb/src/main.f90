program graphene_tb
  use mod_kinds
  use mod_constants
  use mod_graphene_lattice
  use mod_k_space
  use mod_band_structure
  use mod_dos
  use mod_io
  implicit none
  integer, parameter :: num_bands = 2
  integer, parameter :: nkseg = 3
  integer, parameter :: nk_grid = 50
  real(real_dp), dimension(2,4) :: k_points
  integer, dimension(nkseg) :: nk_segment
  real(real_dp), allocatable :: k_path(:,:)
  real(real_dp), allocatable :: k_dist(:)
  real(real_dp), allocatable :: band_energies(:,:)
  real(real_dp), allocatable :: k_grid(:,:)
  real(real_dp), allocatable :: dos_vals(:)
  real(real_dp), allocatable :: energy_axis(:)
  integer :: nk_total, i
  real(real_dp) :: energy_min, energy_max

  ! Define high symmetry points Gamma, K, M, Gamma
  k_points(:,1) = (/0.0_real_dp, 0.0_real_dp/)
  k_points(:,2) = (/2.0_real_dp*pi/(3.0_real_dp*a), 2.0_real_dp*pi/(3.0_real_dp*sqrt3*a)/)
  k_points(:,3) = (/pi/a, 0.0_real_dp/)
  k_points(:,4) = k_points(:,1)
  nk_segment = (/40,40,40/)

  nk_total = 1 + sum(nk_segment)
  allocate(k_path(2,nk_total))
  allocate(k_dist(nk_total))
  call generate_k_path(k_points, nk_segment, k_path, k_dist)
  allocate(band_energies(num_bands,nk_total))
  call calculate_bands(k_path, num_bands, band_energies)

  call write_band_structure(k_dist, band_energies, '../data/bands.dat')

  allocate(k_grid(2,nk_grid*nk_grid))
  call generate_brillouin_zone_grid(nk_grid, nk_grid, k_grid)

  energy_min = -3.0_real_dp*t
  energy_max =  3.0_real_dp*t
  allocate(dos_vals(200))
  allocate(energy_axis(200))
  do i = 1, 200
    energy_axis(i) = energy_min + (energy_max-energy_min)*real(i-1,real_dp)/199.0_real_dp
  end do
  call calculate_dos(k_grid, energy_min, energy_max, 200, dos_vals)
  call write_dos(energy_axis, dos_vals, '../data/dos.dat')
end program graphene_tb
