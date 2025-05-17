module dos
  implicit none
contains
  subroutine calc_dos(energies,weights,sigma,ne,emin,emax,edos)
    double precision, intent(in) :: energies(:)
    double precision, intent(in) :: weights(:)
    double precision, intent(in) :: sigma
    integer, intent(in) :: ne
    double precision, intent(in) :: emin,emax
    double precision, intent(out) :: edos(ne)
    integer :: i,j,n
    double precision :: e,step
    n = size(energies)
    step = (emax-emin)/real(ne-1)
    do i=1,ne
       e = emin + (i-1)*step
       edos(i)=0.d0
       do j=1,n
          edos(i) = edos(i) + weights(j)*gauss(e-energies(j),sigma)
       end do
    end do
  end subroutine calc_dos

  pure function gauss(x,sigma) result(val)
    double precision, intent(in) :: x,sigma
    double precision :: val
    val = exp(- (x/sigma)**2 /2.d0)/(sigma*sqrt(2.d0*pi))
  end function gauss
end module dos
