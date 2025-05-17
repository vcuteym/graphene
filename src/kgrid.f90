module kgrid
  use constants
  implicit none
contains
  subroutine generate_kgrid(nkx,nky,kpts,weight)
    integer, intent(in) :: nkx,nky
    double precision, dimension(2,nkx*nky), intent(out) :: kpts
    double precision, dimension(nkx*nky), intent(out) :: weight
    integer :: i,j,idx
    idx=0
    do j=0,nky-1
       do i=0,nkx-1
          idx=idx+1
          kpts(:,idx) = [2*pi*i/(nkx*a*sqrt(3.d0)), 2*pi*j/(nky*3.d0*a)]
          weight(idx) = 1.d0/(nkx*nky)
       end do
    end do
  end subroutine generate_kgrid
end module kgrid
