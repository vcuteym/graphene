module lattice
  use constants
  implicit none
  double precision, parameter :: sqrt3 = 1.7320508075688772d0
  double precision, parameter :: a0 = sqrt3*a  ! lattice constant
  double precision, parameter :: b = 4.0d0*pi/(sqrt3*a0)
  ! primitive lattice vectors
  double precision, dimension(2,2), parameter :: avec = reshape([ &
       sqrt3/2*a0,  1.5d0*a, &
       -sqrt3/2*a0, 1.5d0*a ], [2,2])
  ! reciprocal lattice vectors
  double precision, dimension(2,2), parameter :: bvec = reshape([ &
       2*pi/(sqrt3*a), 2*pi/(3*a), &
       -2*pi/(sqrt3*a), 2*pi/(3*a) ], [2,2])

contains

  subroutine high_symmetry_path(nk,path)
    ! Returns k-path along Gamma-K-M-Gamma
    integer, intent(in) :: nk
    double precision, dimension(2,nk), intent(out) :: path
    double precision :: gamma(2), kpoint(2), mpoint(2)
    integer :: i, seg
    integer :: nseg
    double precision, dimension(3) :: seglen
    nseg = 3
    seglen = (/1.d0,1.d0,1.d0/)
    gamma = [0.d0, 0.d0]
    kpoint = [2.d0*pi/(3.d0*a), 2.d0*pi/(3.d0*sqrt3*a)]
    mpoint = [pi/(sqrt3*a), pi/(3.d0*a)]
    seglen(1) = norm2(kpoint - gamma)
    seglen(2) = norm2(mpoint - kpoint)
    seglen(3) = norm2(gamma - mpoint)
    seglen = seglen/sum(seglen)
    integer :: p1, p2
    double precision, dimension(2) :: k1,k2
    double precision :: t
    p1 = 1
    k1 = gamma
    k2 = kpoint
    do seg=1,nseg
       select case(seg)
       case(1)
          k1 = gamma
          k2 = kpoint
       case(2)
          k1 = kpoint
          k2 = mpoint
       case(3)
          k1 = mpoint
          k2 = gamma
       end select
       p2 = p1 + int(seglen(seg)*nk) - 1
       if(seg==nseg) p2 = nk
       do i=p1,p2
          t = real(i - p1)/real(max(1,p2 - p1))
          path(:,i) = (1.d0 - t)*k1 + t*k2
       end do
       p1 = p2 + 1
    end do
  end subroutine high_symmetry_path

end module lattice
