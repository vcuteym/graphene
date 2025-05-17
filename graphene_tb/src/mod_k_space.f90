module mod_k_space
  use mod_kinds
  use mod_constants
  implicit none
contains
  subroutine generate_k_path(high_sym_points, nk_segment, k_path, k_dist)
    real(real_dp), intent(in) :: high_sym_points(2, :)
    integer, intent(in) :: nk_segment(:)
    real(real_dp), intent(out) :: k_path(2, :)
    real(real_dp), intent(out) :: k_dist(:)
    integer :: nseg, i, j, idx, npts
    real(real_dp) :: dk(2), step(2), dist
    nseg = size(nk_segment)
    npts = 1
    do i = 1, nseg
      npts = npts + nk_segment(i)
    end do
    if(size(k_path,2) < npts) stop 'k_path array too small'
    if(size(k_dist) < npts) stop 'k_dist array too small'
    k_path(:,1) = high_sym_points(:,1)
    k_dist(1) = 0.0_real_dp
    idx = 1
    dist = 0.0_real_dp
    do i = 1, nseg
      dk = high_sym_points(:,i+1) - high_sym_points(:,i)
      step = dk / real(nk_segment(i), real_dp)
      do j = 1, nk_segment(i)
        idx = idx + 1
        k_path(:,idx) = high_sym_points(:,i) + step*j
        dist = dist + sqrt(step(1)**2 + step(2)**2)
        k_dist(idx) = dist
      end do
    end do
  end subroutine generate_k_path

  subroutine generate_brillouin_zone_grid(nkx, nky, k_grid)
    integer, intent(in) :: nkx, nky
    real(real_dp), intent(out) :: k_grid(2, :)
    integer :: ix, iy, idx
    real(real_dp) :: kx_min, kx_max, ky_min, ky_max
    kx_min = -pi/a
    kx_max =  pi/a
    ky_min = -pi/(sqrt(3.0_real_dp)*a)
    ky_max =  pi/(sqrt(3.0_real_dp)*a)
    if(size(k_grid,2) < nkx*nky) stop 'k_grid array too small'
    idx = 0
    do iy = 0, nky-1
      do ix = 0, nkx-1
        idx = idx + 1
        k_grid(1,idx) = kx_min + (kx_max-kx_min)*real(ix,real_dp)/(nkx-1)
        k_grid(2,idx) = ky_min + (ky_max-ky_min)*real(iy,real_dp)/(nky-1)
      end do
    end do
  end subroutine generate_brillouin_zone_grid
end module mod_k_space
