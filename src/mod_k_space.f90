module mod_k_space
  use mod_kinds, only: real_dp
  use mod_constants, only: pi
  implicit none
contains
  subroutine generate_k_path(high_sym_points, nk_segment, k_path, k_dist)
    real(real_dp), intent(in)  :: high_sym_points(2, :)
    integer,       intent(in)  :: nk_segment
    real(real_dp), allocatable, intent(out) :: k_path(:,:)
    real(real_dp), allocatable, intent(out) :: k_dist(:)
    integer :: nseg, i, j, idx
    real(real_dp) :: dk(2), segment_length

    nseg = size(high_sym_points,2)
    allocate(k_path(2, nk_segment*(nseg-1)+1))
    allocate(k_dist(nk_segment*(nseg-1)+1))

    k_path(:,1) = high_sym_points(:,1)
    k_dist(1) = 0.0_real_dp
    idx = 1
    do j = 1, nseg-1
       dk = (high_sym_points(:,j+1) - high_sym_points(:,j))/real(nk_segment,real_dp)
       do i = 1, nk_segment
          idx = idx + 1
          k_path(:,idx) = high_sym_points(:,j) + i*dk
          segment_length = sqrt(sum(dk**2))
          k_dist(idx) = k_dist(idx-1) + segment_length
       end do
    end do
  end subroutine generate_k_path

  subroutine generate_brillouin_zone_grid(nkx, nky, k_grid)
    integer, intent(in) :: nkx, nky
    real(real_dp), allocatable, intent(out) :: k_grid(:,:)
    real(real_dp) :: kx, ky
    integer :: i, j, idx
    allocate(k_grid(2, nkx*nky))
    idx = 0
    do j = 0, nky-1
       ky = -pi + (2*pi)*real(j,real_dp)/real(nky-1,real_dp)
       do i = 0, nkx-1
          kx = -pi + (2*pi)*real(i,real_dp)/real(nkx-1,real_dp)
          idx = idx + 1
          k_grid(:,idx) = (/kx, ky/)
       end do
    end do
  end subroutine generate_brillouin_zone_grid
end module mod_k_space
