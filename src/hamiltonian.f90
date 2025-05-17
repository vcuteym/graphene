module hamiltonian
  use constants
  implicit none
  double precision, dimension(2,3), parameter :: delta = reshape([ &
       0.d0, -a, &
       sqrt(3.d0)/2.d0*a, 0.5d0*a, &
       -sqrt(3.d0)/2.d0*a, 0.5d0*a ], [2,3])
contains
  subroutine construct_h(k,ham)
    double precision, dimension(2), intent(in) :: k
    complex(8), dimension(2,2), intent(out) :: ham
    double precision :: freal, fimag, phase
    integer :: i
    freal=0.d0
    fimag=0.d0
    do i=1,3
       phase = k(1)*delta(1,i) + k(2)*delta(2,i)
       freal = freal + cos(phase)
       fimag = fimag + sin(phase)
    end do
    ham(1,1)=0.d0
    ham(2,2)=0.d0
    ham(1,2)=t*(freal + cmplx(0.d0,-fimag))
    ham(2,1)=conjg(ham(1,2))
  end subroutine construct_h
end module hamiltonian
