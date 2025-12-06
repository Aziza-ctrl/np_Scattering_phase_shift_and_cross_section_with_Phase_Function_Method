!================================================================================================
!                                   Método de función de fase
!================================================================================================
Module Fase
    use Constantes
    use Potenciales
    implicit none
    private
    public :: delta1

contains
!------------------------------------------------------------------------------------------------
!                                   Cambio de fase con 2Mu/h
!------------------------------------------------------------------------------------------------
    function delta1(r, delta0, kcm, p1, p2, p3, p4, V) result(d) 
        Real(8), intent(in)      :: r, delta0,kcm, p1, p2, p3, p4
        procedure(fun_potencial) :: V
        Real(8)                  :: d

        d = -V(r, p1, p2, p3, p4) * ( sin(kcm*r + delta0) )**2 &
            / (kcm*frac)
        
    end function delta1

End module Fase