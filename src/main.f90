program graphene_tb
  use constants
  use lattice
  use kgrid
  use hamiltonian
  use diagonalize
  use dos
  implicit none
  integer, parameter :: nkpath = 200
  integer, parameter :: nkx = 40, nky=40
  integer, parameter :: ne = 400
  double precision, dimension(2,nkpath) :: kpath
  double precision, dimension(nkpath,2) :: ebands
  double precision, dimension(2,2) :: h
  complex(8), dimension(2,2) :: hc
  complex(8), dimension(2,2) :: vec
  double precision, dimension(2) :: eval
  double precision, dimension(2,nkx*nky) :: kpts
  double precision, dimension(nkx*nky) :: kw
  double precision, dimension(2*nkx*nky) :: egrid
  double precision :: emin, emax
  double precision, dimension(ne) :: dosdata
  integer :: i,j,idx

  call high_symmetry_path(nkpath,kpath)

  do i=1,nkpath
     call construct_h(kpath(:,i),hc)
     call diag2x2(hc,vec,eval)
     ebands(i,1)=eval(1)
     ebands(i,2)=eval(2)
  end do

  open(unit=10,file='band.dat',status='replace')
  do i=1,nkpath
     write(10,'(3f12.6)') real(i), ebands(i,1), ebands(i,2)
  end do
  close(10)

  call generate_kgrid(nkx,nky,kpts,kw)
  idx=0
  do i=1,nkx*nky
     call construct_h(kpts(:,i),hc)
     call diag2x2(hc,vec,eval)
     egrid(idx*2+1)=eval(1)
     egrid(idx*2+2)=eval(2)
     idx=idx+1
  end do

  emin = minval(egrid) - 1.d0
  emax = maxval(egrid) + 1.d0
  call calc_dos(egrid,spread(kw,1,2),0.05d0,ne,emin,emax,dosdata)

  open(unit=11,file='dos.dat',status='replace')
  do i=1,ne
     write(11,'(2f12.6)') emin + (i-1)*(emax-emin)/(ne-1), dosdata(i)
  end do
  close(11)
end program graphene_tb
