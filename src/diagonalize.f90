module diagonalize
  implicit none
contains
  subroutine diag2x2(h,eigvec,eigval)
    complex(8), intent(in) :: h(2,2)
    complex(8), intent(out) :: eigvec(2,2)
    double precision, intent(out) :: eigval(2)
    complex(8) :: a(2,2)
    complex(8) :: work(2*2)
    double precision :: rwork(3*2-2)
    integer :: info
    a = h
    eigvec = a
    call zheev('V','U',2,eigvec,2,eigval,work,size(work),rwork,info)
  end subroutine diag2x2
end module diagonalize
