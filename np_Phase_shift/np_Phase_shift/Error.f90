module Error
            use Constantes
            use Potenciales
            use rk4
    contains
    
!======================================================================
!                   Error cuadrático medio relativo
!======================================================================
!                   ( abs(Exp - Sim) )**2 / abs(Exp)
!----------------------------------------------------------------------
!                           Malfliet Tjon
!----------------------------------------------------------------------
subroutine ECMR(chi1 , chi2 , chi3 , chi4 , chi5 , chi6 , chi7 , chi8 , chi9 , &
                chi10, chi11, chi12, chi13, chi14, chi15, chi16, chi17, chi18, &
                chi19, chi20)
        integer     :: i
        real(8)     :: chi1 , chi2 , chi3 , chi4 , chi5 , chi6 , chi7 , &
                       chi8 , chi9 , chi10, chi11, chi12, chi13, chi14, &
                       chi15, chi16, chi17, chi18, chi19, chi20
        real(8)     :: nu   , sum  , Sim  , Exp
!============================= TRIPLET ================================
        sum = 0d0
        nu  = 0d0
                
        do i = 1, 7                                   !ECM hasta 50 MeV
                Sim  = PFMRK4( k(i), Vparam(4), Vparam(5), Vparam(6), Vparam(7), MT, 0)
                Exp  = deltaExp1(i)
                nu   = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum  = sum + nu
                chi1 = sum / i
        end do
        sum = 0d0
        nu  = 0d0

        do i = 8, 17                                 !ECM hasta 300 MeV
                Sim  = PFMRK4( k(i), Vparam(4), Vparam(5), Vparam(6), Vparam(7), MT, 0)
                Exp  = deltaExp1(i)
                nu   = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum  = sum + nu
                chi2 = sum / (i-7)  
        end do
!============================= SINGLET ================================
        sum = 0d0
        nu  = 0d0
        
        do i = 1, 7                                   !ECM hasta 50 MeV
                Sim  = PFMRK4( k(i), VparamMT(4), VparamMT(5), VparamMT(6), VparamMT(7), MT, 0)
                Exp  = deltaExp2(i)
                nu   = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum  = sum + nu
                chi3 = sum / i             
        end do
        sum = 0d0
        nu  = 0d0
        
        do i = 8, 17                                 !ECM hasta 300 MeV
                Sim  = PFMRK4( k(i), VparamMT(4), VparamMT(5), VparamMT(6), VparamMT(7), MT, 0)
                Exp  = deltaExp2(i)
                nu   = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum  = sum + nu
                chi4 = sum / (i-5)
        end do
!----------------------------------------------------------------------
!                              Morse
!----------------------------------------------------------------------
        sum = 0d0
        nu  = 0d0
        do i = 1, 7                                  !ECM hasta 50 MeV
                Sim  = PFMRK4( k(i), VparamMO(4), VparamMO(5), VparamMO(6), 0d0, MO, 0 )
                Exp  = deltaExp1(i)
                nu   = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum  = sum + nu
                chi5 = sum / i             
        end do
        sum = 0d0
        nu  = 0d0
        
        do i = 8, 17 
                Sim  = PFMRK4( k(i), VparamMO(4), VparamMO(5), VparamMO(6), 0d0, MO, 0 )
                Exp  = deltaExp1(i)
                nu = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum = sum + nu
                chi6 = sum / (i-7)  
        end do
!============================= SINGLET ================================
        sum = 0d0
        nu  = 0d0
        
        do i = 1, 7                                  !ECM hasta 50 MeV
                Sim  = PFMRK4( k(i), VparamMO1(4), VparamMO1(5), VparamMO1(6), 0d0, MO, 0 )
                Exp  = deltaExp2(i)
                nu   = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum  = sum + nu
                chi7 = sum / i 
        end do
        sum = 0d0
        nu  = 0d0
        
        do i = 1, 17 
                Sim  = PFMRK4( k(i), VparamMO1(4), VparamMO1(5), VparamMO1(6), 0d0, MO, 0 )
                Exp  = deltaExp2(i)
                nu = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum = sum + nu
                chi8 = sum / (i)
        end do
!----------------------------------------------------------------------
!                              Hulthen
!----------------------------------------------------------------------
        sum = 0d0
        nu  = 0d0      
!============================= TRIPLET ================================ 
        do i = 1, 7                                  !ECM hasta 50 MeV
                Sim  = PFMRK4( k(i), VparamHU(4), VparamHU(5), VparamHU(3), 0d0, HU1, 0 )
                Exp  = deltaExp1(i)
                nu   = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum  = sum + nu
                chi9 = sum / i 
        end do
        sum = 0d0
        nu  = 0d0
        
        do i = 8, 17 
                Sim  = PFMRK4( k(i), VparamHU(4), VparamHU(5), VparamHU(3), 0d0, HU1, 0 )
                Exp  = deltaExp1(i)
                nu = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum = sum + nu
                chi10 = sum / (i-7)
        end do
!============================= SINGLET ================================ 
        sum = 0d0
        nu  = 0d0
        
        do i = 1, 7                                  !ECM hasta 50 MeV
                Sim  = PFMRK4( k(i), VparamHU1(4), VparamHU1(5), VparamHU1(3), 0d0, HU1, 0 )
                Exp  = deltaExp2(i)
                nu   = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum  = sum + nu
                chi11 = sum / i 
        end do
        sum = 0d0
        nu  = 0d0
        
        do i = 8, 17 
                Sim  = PFMRK4( k(i), VparamHU1(4), VparamHU1(5), VparamHU1(3), 0d0, HU1, 0 )
                Exp  = deltaExp2(i)
                nu = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum = sum + nu
                chi12 = sum / (i-7)
        end do
!============================= TRIPLET ================================
        sum = 0d0
        nu  = 0d0
        do i = 1, 7                                  !ECM hasta 50 MeV
                Sim  = PFMRK4( k(i), VparamHU(1), VparamHU(2), VparamHU(3), 0d0, HU, 0 )
                Exp  = deltaExp1(i)
                nu   = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum  = sum + nu
                chi13 = sum / i             
        end do
        sum = 0d0
        nu  = 0d0
        
        do i = 8, 17 
                Sim  = PFMRK4( k(i), VparamHU(1), VparamHU(2), VparamHU(3), 0d0, HU, 0 )
                Exp  = deltaExp1(i)
                nu = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum = sum + nu
                chi14 = sum / (i-7)  
        end do
!============================= SINGLET ================================
        sum = 0d0
        nu  = 0d0
        
        do i = 1, 7                                  !ECM hasta 50 MeV
                Sim  = PFMRK4( k(i), VparamHU1(1), VparamHU1(2), VparamHU1(3), 0d0, HU2, 0 )
                Exp  = deltaExp2(i)
                nu   = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum  = sum + nu
                chi15 = sum / i 
        end do
        sum = 0d0
        nu  = 0d0
        
        do i = 8, 17 
                Sim  = PFMRK4( k(i), VparamHU1(1), VparamHU1(2), VparamHU1(3), 0d0, HU2, 0 )
                Exp  = deltaExp2(i)
                nu = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum = sum + nu
                chi16 = sum / (i-7)
        end do
!----------------------------------------------------------------------
!                              Manning Rosen
!----------------------------------------------------------------------
        sum  = 0d0
        nu   = 0d0
!============================= TRIPLET ================================
        do i = 1, 7                                  !hasta 50 MeV
                Sim  = PFMRK4( k(i), VparamMR(1), VparamMR(2), VparamMR(3), 0d0, MR, 0)
                Exp  = deltaExp1(i)
                nu   = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum  = sum + nu
                chi17 = sum / i 
        end do
        sum = 0d0
        nu  = 0d0
        do i = 8, 17                                 ! hasta 300 MeV
                Sim  = PFMRK4( k(i), VparamMR(1), VparamMR(2), VparamMR(3), 0d0, MR, 0)
                Exp  = deltaExp1(i)
                nu   = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum  = sum + nu
                chi18 = sum / (i-7)
        end do
        sum  = 0d0
        nu   = 0d0
!============================= SINGLET ================================
        do i = 1, 7                                  !hasta 50 MeV
                Sim  = PFMRK4( k(i), VparamMR1(1), VparamMR1(2), VparamMR1(3), 0d0, MR, 0)
                Exp  = deltaExp2(i)
                nu   = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum  = sum + nu
                chi19 = sum / i 
        end do
        sum = 0d0
        nu  = 0d0
        do i = 8, 17                                 ! hasta 300 MeV
                Sim  = PFMRK4( k(i), VparamMR1(1), VparamMR1(2), VparamMR1(3), 0d0, MR, 0)
                Exp  = deltaExp2(i)
                nu   = ( abs(Exp - Sim) )**2 / abs(Exp)
                sum  = sum + nu
                chi20 = sum / (i-7)
        end do

end subroutine

!======================================================================
!                   Error porcentual absoluto promedio
!======================================================================
!		              ( abs(Exp - Sim) ) / abs(Exp)
!----------------------------------------------------------------------
!                           Malfliet Tjon
!----------------------------------------------------------------------
    subroutine EPAP(chi21, chi22, chi23, chi24, chi25, chi26, chi27, chi28) !chi1,...,chi4 Es el error con los nuevos parametros
        integer         :: i                                     !chi5,...,chi8 Es el error con los viejos parametros
        real(8)         :: chi21, chi22, chi23, chi24, chi25, chi26, chi27, chi28
        real(8)         :: nu   , sum  , Sim  , Exp

!============================= TRIPLET ================================
        sum = 0d0
        nu  = 0d0
                
        do i = 1, 5                                   !ECM hasta 50 MeV
                Sim  = PFMRK4( kG(i), Vparam(1), Vparam(2), Vparam(3), 2d0*Vparam(3), MT, 0)
                Exp  = deltaExpG(i)
                nu   = ( abs(Exp - Sim) ) / abs(Exp)
                sum  = sum + nu
                chi21 = sum*100d0 / i             
        end do
        sum = 0d0
        nu  = 0d0
        
        do i = 1, 11                                 !ECM hasta 350 MeV
                Sim  = PFMRK4( kG(i), Vparam(1), Vparam(2), Vparam(3), 2d0*Vparam(3), MT, 0)
                Exp  = deltaExpG(i)
                nu   = ( abs(Exp - Sim) ) / abs(Exp)
                sum  = sum + nu
                chi22 = sum*100d0 / (i)  
        end do
!============================= SINGLET ================================
        sum = 0d0
        nu  = 0d0
        
        do i = 1, 5                                   !ECM hasta 50 MeV
                Sim  = PFMRK4( kG(i), VparamMT(1), VparamMT(2), VparamMT(3), 2d0*VparamMT(3), MT, 0)
                Exp  = deltaExpG1(i)
                nu   = ( abs(Exp - Sim) ) / abs(Exp)
                sum  = sum + nu
                chi23 = sum*100d0 / i             
        end do
        sum = 0d0
        nu  = 0d0
        
        do i = 1, 11                                 !ECM hasta 350 MeV
                Sim  = PFMRK4( kG(i), VparamMT(1), VparamMT(2), VparamMT(3), 2d0*VparamMT(3), MT, 0)
                Exp  = deltaExpG1(i)
                nu   = ( abs(Exp - Sim) ) / abs(Exp)
                sum  = sum + nu
                chi24 = sum*100d0 / (i)  
        end do
!----------------------------------------------------------------------
!                              Morse
!----------------------------------------------------------------------
        sum = 0d0
        nu  = 0d0
        
!============================= TRIPLET ================================
        do i = 1, 7                                  !ECM hasta 50 MeV
                Sim  = PFMRK4( k(i), VparamMO(1), VparamMO(2), VparamMO(3), 0d0, MO, 0 )
                Exp  = deltaExp1(i)
                nu   = ( abs(Exp - Sim) ) / abs(Exp)
                sum  = sum + nu
                chi25 = sum*100d0 / i             
        end do
        sum = 0d0
        nu  = 0d0
        
        do i = 1, 18 
                Sim  = PFMRK4( k(i), VparamMO(1), VparamMO(2), VparamMO(3), 0d0, MO, 0 )
                Exp  = deltaExp1(i)
                nu = ( abs(Exp - Sim) ) / abs(Exp)
                sum = sum + nu
                chi26 = sum*100d0 / (i)  
        end do
!============================= SINGLET ================================
        sum = 0d0
        nu  = 0d0
        
        do i = 1, 7                                  !ECM hasta 50 MeV
                Sim  = PFMRK4( k(i), VparamMO1(1), VparamMO1(2), VparamMO1(3), 0d0, MO, 0 )
                Exp  = deltaExp2(i)
                nu   = ( abs(Exp - Sim) ) / abs(Exp)
                sum  = sum + nu
                chi27 = sum*100d0 / i 
        end do
        sum = 0d0
        nu  = 0d0
        
        do i = 1, 18 
                Sim  = PFMRK4( k(i), VparamMO1(1), VparamMO1(2), VparamMO1(3), 0d0, MO, 0 )
                Exp  = deltaExp2(i)
                nu = ( abs(Exp - Sim) ) / abs(Exp)
                sum = sum + nu
                chi28 = sum*100d0 / (i)
        end do
end subroutine
    
end module