module Seccion_eficaz
            use Constantes
            use Potenciales
            use rk4
    contains
!======================================================================
!                       Seccion eficaz parcial
!======================================================================
    function sigma(triplet, singlet, kcom) result(total)    !Vr, Va, Mua        
            real(8), intent(in) :: triplet, singlet, kcom
            real(8)             :: total, parcial_s, parcial_t 
            
            parcial_t = 4d0*pi*( (sin(triplet*pi/180d0))**2 )/(kcom**2)
            parcial_s = 4d0*pi*( (sin(singlet*pi/180d0))**2 )/(kcom**2)
            
            total = (parcial_t*3d0 + parcial_s)/4d0

    end function sigma

    
 
    

end module