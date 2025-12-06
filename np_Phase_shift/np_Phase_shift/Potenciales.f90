!================================================================================================
!                                           Potenciales
!================================================================================================
Module Potenciales
    use Constantes
    implicit none
    
    public :: fun_potencial
    public :: MT, MR, MO, HU
    
    abstract interface
    function fun_potencial(r, p1, p2, p3, p4) result(Vr)
        real(8), intent(in) :: r, p1, p2, p3, p4
        real(8) :: Vr
    end function fun_potencial
    end interface

contains
!------------------------------------------------------------------------------------------------
!                                        1) Malfliet-Tjon
!------------------------------------------------------------------------------------------------
    Function MT(r, p1, p2, p3, p4) result(Vr)    !Vr, Va, Mua        
        Real(8), intent(in) :: r, p1, p2, p3, p4
        Real(8)             :: Vr 
        
        Vr = -p2*exp(-p3*r)/r + p1*exp(-p4*r)/r

    end function MT
!------------------------------------------------------------------------------------------------
!                                        2) Manning-Rosen
!------------------------------------------------------------------------------------------------
    Function MR(r, p1, p2, p3, p4) result(Vr)    !A, b, alpha       
        Real(8), intent(in) :: r, p1, p2, p3, p4
        Real(8)             :: Vr

        Vr = frac*( p3*(p3-1d0)*exp(-2d0*r/p2)/( (1d0-exp(-r/p2))**2 ) - p1*exp(-r/p2)/( 1d0-exp(-r/p2) ) )/(p2**2)

    end function MR
!------------------------------------------------------------------------------------------------
!                                        3) Morse
!------------------------------------------------------------------------------------------------
    Function MO(r, p1, p2, p3, p4) result(Vr)    !V0, rm, am       
        Real(8), intent(in) :: r, p1, p2, p3, p4
        Real(8)             :: Vr

        Vr = p1*(exp(-2d0*(r-p2)/p3)-2d0*exp(-(r-p2)/p3))

    end function MO

!------------------------------------------------------------------------------------------------
!                                        3.0) Hulthen 2019
!------------------------------------------------------------------------------------------------
    Function HU(r, p1, p2, p3, p4) result(Vr)    !beta, alpha       
        Real(8), intent(in) :: r, p1, p2, p3, p4
        Real(8) :: Vr

        Vr = frac*( -(p1**2 - p2**2)*(p1-p2)*exp(-(p1-p2)*r) / (1d0 - exp(-(p1-p2)*r)) )
                      
    end function HU
!------------------------------------------------------------------------------------------------
!                                        3.1) Hulthen 2016
!------------------------------------------------------------------------------------------------
    Function HU1(r, p1, p2, p3, p4) result(Vr)    !beta, alpha       
        Real(8), intent(in) :: r, p1, p2, p3, p4
        Real(8) :: Vr

        Vr = frac*( -(p1**2 - p2**2)*exp(-(p1-p2)*r) / (1d0 - exp(-(p1-p2)*r)) ) + &
             frac*(  ( p1    - p2  )**2 )*exp(-(p1-p2)*r) / (1d0-exp(-(p1-p2)*r))**2  !para el triplet *(p1-p2) para el singlet sin *(p1-p2)
             
    end function HU1
!------------------------------------------------------------------------------------------------
!                                        3.2) Hulthen 2019
!------------------------------------------------------------------------------------------------
    Function HU2(r, p1, p2, p3, p4) result(Vr)    !beta, alpha       
        Real(8), intent(in) :: r, p1, p2, p3, p4
        Real(8) :: Vr

        Vr = frac*( -(p1**2 - p2**2)*exp(-(p1-p2)*r) / (1d0 - exp(-(p1-p2)*r)) )          
    end function HU2
    

End module Potenciales