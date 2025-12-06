!================================================================================================
!                                   Método de Runge-Kutta de orden 4
!================================================================================================
Module rk4
    use Constantes
    use Fase
    use Potenciales
    implicit none
    private
    public :: PFMRK4
    
contains
!------------------------------------------------------------------------------------------------
!       Método de runge-kutta con tamaño de paso fijo h = 0.00001 
!------------------------------------------------------------------------------------------------    
    function PFMRK4(kcom, p1, p2, p3, p4, V, j)result(grados)
        Real(8), intent(in) :: kcom, p1, p2, p3, p4
        procedure(fun_potencial) :: V
        Real(8)             :: grados
        
        Integer, parameter :: N = 50000
        Real(8), parameter :: a = 0d0, b = 5.0d0
        Real(8), parameter :: h = (b - a)/N
        Real(8)            :: r, y, k1, k2, k3, k4, k5, k6
        Integer            :: i, j
            !! Condiciones iniciales
        r = h; y = 0d0   
        do i = 1, N
            if      (j == 1 ) then
                write(15,'(4F10.4)') r, y*180d0 / pi 
            else if (j == 3 ) then
                write(16,'(4F10.4)') r, y*180d0 / pi
            else if (j == 7 ) then
                write(17,'(4F10.4)') r, y*180d0 / pi
            else if (j == 9 ) then
                write(18,'(4F10.4)') r, y*180d0 / pi
            else if (j == 13) then
                write(19,'(4F10.4)') r, y*180d0 / pi 
            else if (j == 17) then
                write(20,'(4F10.4)') r, y*180d0 / pi
            end if
!============================== RK4 =====================================================            
            k1 = delta1( r,             y,              kcom, p1, p2, p3, p4, V)
            k2 = delta1( r+0.5d0*h,     y+0.5d0*k1*h,   kcom, p1, p2, p3, p4, V)
            k3 = delta1( r+0.5d0*h,     y+0.5d0*k2*h,   kcom, p1, p2, p3, p4, V)
            k4 = delta1( r+h,           y+k3*h,         kcom, p1, p2, p3, p4, V)
        
            y  = y  + h*(k1 + 2d0*k2 + 2d0*k3 + k4)/6d0
            
            r  = r + h
        end do
    
        grados = (y*180d0 / pi)
        
    end function
End module rk4