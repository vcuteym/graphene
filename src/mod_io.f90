module mod_io
  use mod_kinds, only: real_dp
  implicit none
contains
  subroutine write_band_structure(k_dist, band_energies, filename)
    real(real_dp), intent(in) :: k_dist(:)
    real(real_dp), intent(in) :: band_energies(:,:)
    character(len=*), intent(in) :: filename
    integer :: i, nb
    open(unit=10, file=filename, status='replace')
    do i = 1, size(k_dist)
       write(10,'(F12.6,2X,*(F12.6,1X))') k_dist(i), band_energies(:,i)
    end do
    close(10)
  end subroutine write_band_structure

  subroutine write_dos(energy_axis, dos_values, filename)
    real(real_dp), intent(in) :: energy_axis(:)
    real(real_dp), intent(in) :: dos_values(:)
    character(len=*), intent(in) :: filename
    integer :: i
    open(unit=11, file=filename, status='replace')
    do i = 1, size(energy_axis)
       write(11,'(F12.6,2X,F12.6)') energy_axis(i), dos_values(i)
    end do
    close(11)
  end subroutine write_dos
end module mod_io
