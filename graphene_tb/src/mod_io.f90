module mod_io
  use mod_kinds
  implicit none
contains
  subroutine write_band_structure(k_dist, band_energies, filename)
    real(real_dp), intent(in) :: k_dist(:)
    real(real_dp), intent(in) :: band_energies(2, :)
    character(len=*), intent(in) :: filename
    integer :: nk, i
    open(unit=10, file=filename, status='replace')
    nk = size(k_dist)
    do i = 1, nk
      write(10,'(F12.6,2F12.6)') k_dist(i), band_energies(1,i), band_energies(2,i)
    end do
    close(10)
  end subroutine write_band_structure

  subroutine write_dos(energy_axis, dos_values, filename)
    real(real_dp), intent(in) :: energy_axis(:)
    real(real_dp), intent(in) :: dos_values(:)
    character(len=*), intent(in) :: filename
    integer :: i, n
    open(unit=11, file=filename, status='replace')
    n = size(energy_axis)
    do i = 1, n
      write(11,'(F12.6,F12.6)') energy_axis(i), dos_values(i)
    end do
    close(11)
  end subroutine write_dos
end module mod_io
