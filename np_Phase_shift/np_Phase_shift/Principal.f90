Program Principal
    use Constantes
    use Potenciales
    use rk4
    use Error
    use Seccion_eficaz
    implicit none
    
integer :: i, j, uni
real(8) :: r, h
real(8) :: deltaVsr
real(8) :: chi1 ,  chi2,  chi3,  chi4,  chi5,  chi6,  chi7,  chi8, &
           chi9 , chi10, chi11, chi12, chi13, chi14, chi15, chi16, & 
           chi17, chi18, chi19, chi20, chi21, chi22, chi23, chi24, &
           chi25, chi26, chi27, chi28

call Docs(uni)
uni = 1
!=============================== Definicion de los datos exp. ===============
do i = 1, 11
    write(1,'(6F10.3)') ElabG(i), deltaExpG(i)
    write(2,'(6F10.3)') ElabG(i), deltaExpG1(i)
end do
do i = 1, 32
    write(3,*) ElabS(i), sigma_exp(i)*0.001
end do
!pause
!============================== Calculo de los cambios de fase ===================
!
!'================= Calculo del cambio de fase por dispersion 3S1 ================'
!'---------------------------------------------------------------------------------------------'
!'                              Parametros viejos                                            '
!'_____________________________________________________________________________________________'
do i = 1, 17
    write(4,'(6F10.3)') Elab(i), PFMRK4(k(i), Vparam(4)  , Vparam(5)  , Vparam(6)  ,Vparam(7)  , MT , 0) , &
                                 PFMRK4(k(i), VparamMR(1), VparamMR(2), VparamMR(3),VparamMR(3), MR , 0) , &
                                 PFMRK4(k(i), VparamMO(4), VparamMO(5), VparamMO(6),VparamMO(3), MO , 0) , &
                                 PFMRK4(k(i), VparamHU(4), VparamHU(5), VparamHU(3),VparamHU(3), HU1, 0) , &
                                 deltaExp1(i)
end do
!'---------------------------------------------------------------------------------------------'
!'                              Parametros nuevos                                            '
!'_____________________________________________________________________________________________'
do i = 1, 18
    write(5,'(6F10.3)') Elab(i), PFMRK4(k(i), Vparam(1)  , Vparam(2)  , Vparam(3)  ,2d0*Vparam(3), MT , 0), &
                                 PFMRK4(k(i), VparamMR(1), VparamMR(2), VparamMR(3),VparamMR(3)  , MR , 0), &
                                 PFMRK4(k(i), VparamMO(1), VparamMO(2), VparamMO(3),VparamMO(4)  , MO , 0), &
                                 PFMRK4(k(i), VparamHU(1), VparamHU(2), VparamHU(3),VparamHU(3)  , HU , 0), &
                                 deltaExp1(i)
end do
!---------------------------------------------------------------------------------
!'================= Calculo del cambio de fase por dispersion 1S0 ================'
!'---------------------------------------------------------------------------------------------'
!'                              Parametros viejos                                            '
!'_____________________________________________________________________________________________'
do i = 1, 17
    write(6,'(6F10.3)') Elab(i), PFMRK4(k(i), VparamMT(4) , VparamMT(5) , VparamMT(6) , VparamMT(7), MT , 0) , &
                                 PFMRK4(k(i), VparamMR1(1), VparamMR1(2), VparamMR1(3), 0d0        , MR , 0) , &
                                 PFMRK4(k(i), VparamMO1(4), VparamMO1(5), VparamMO1(6), 0d0        , MO , 0) , &
                                 PFMRK4(k(i), VparamHU1(4), VparamHU1(5), VparamHU1(3), 0d0        , HU1, 0) , &
                                 deltaExp2(i)
end do
!'---------------------------------------------------------------------------------------------'
!'                              Parametros nuevos                                            '
!'_____________________________________________________________________________________________'
do i = 1, 18
    write(7,'(6F10.3)') Elab(i), PFMRK4(k(i), VparamMT(1) , VparamMT(2) , VparamMT(3) , 2d0*VparamMT(3) , MT, 0), &
                                 PFMRK4(k(i), VparamMR1(1), VparamMR1(2), VparamMR1(3), 0d0             , MR , 0), &
                                 PFMRK4(k(i), VparamMO1(1), VparamMO1(2), VparamMO1(3), 0d0             , MO , 0), &
                                 PFMRK4(k(i), VparamHU1(1), VparamHU1(2), VparamHU1(3), 0d0             , HU2, 0), &
                                 deltaExp2(i)
end do
!======================= Llamado para calcular los errores ======================
call ECMR(chi1 , chi2, chi3 , chi4 , chi5 , chi6 , chi7 , chi8 , chi9 , &
                chi10, chi11, chi12, chi13, chi14, chi15, chi16, chi17, chi18, &
                chi19, chi20)

call EPAP(chi21, chi22, chi23, chi24, chi25, chi26, chi27, chi28)
!================================================================================
100 format(' Malfliet Tjon   Triplet      ECMR      ', 5F10.4, 5F10.4, 5F10.4, 5F10.4)
200 format(' Malfliet Tjon   Singlet      ECMR      ', 5F10.3, 5F10.3, 5F10.3, 5F10.3)
300 format(' Morse           Triplet      ECMR      ', 5F10.3, 5F10.3, 5F10.3, 5F10.3)
400 format(' Morse           Singlet      ECMR      ', 5F10.3, 5F10.3, 5F10.3, 5F10.3)
500 format(' Hulthen         Triplet      ECMR      ', 5F10.3, 5F10.3, 5F10.3, 5F10.3)
600 format(' Hulthen         Singlet      ECMR      ', 5F10.3, 5F10.3, 5F10.3, 5F10.3)    
700 format(' Manning Rosen   Triplet      ECMR      ', 5F10.3, 5F10.3, 5F10.3, 5F10.3)
800 format(' Manning Rosen   Singlet      ECMR      ', 5F10.3, 5F10.3, 5F10.3, 5F10.3)

900  format(' Malfliet Tjon   Triplet      EPAP(%)   ', 5F10.3, 5F10.3, 5F10.3, 5F10.3)
1000 format(' Malfliet Tjon   Singlet      EPAP(%)   ', 5F10.3, 5F10.3, 5F10.3, 5F10.3)
1100 format(' Morse           Triplet      EPAP(%)   ', 5F10.3, 5F10.3, 5F10.3, 5F10.3)
1200 format(' Morse           Singlet      EPAP(%)   ', 5F10.3, 5F10.3, 5F10.3, 5F10.3)
1300 format(' Hulthen         Triplet      ECMR      ', 5F10.3, 5F10.3, 5F10.3, 5F10.3)
1400 format(' Hulthen         Singlet      ECMR      ', 5F10.3, 5F10.3, 5F10.3, 5F10.3)

write(8,*) '=================== Parametros viejos ======================'
write(8,*) '=============================================================='
write(8,*) 'Potenciales     Estados     Error       hasta 50    mayor a 50'
write(8,*) '=============================================================='
write(8,100)  chi1 , chi2 
write(8,200)  chi3 , chi4 
write(8,300)  chi5 , chi6
write(8,400)  chi7 , chi8 
write(8,500)  chi9 , chi10
write(8,600)  chi11, chi12
write(8,700)  chi17, chi18
write(8,800)  chi19, chi20

write(8,*) '=================== Parametros nuevos ========================'
write(8,*) '=============================================================='
write(8,*) 'Potenciales     Estados     Error       hasta 50    mayor a 50'
write(8,*) '=============================================================='
write(8,900)  chi21, chi22
write(8,1000) chi23, chi24
write(8,1100) chi25, chi26
write(8,1200) chi27, chi28
write(8,1300) chi13, chi14
write(8,1400) chi15, chi16
!
!======================= Calculo de la sección eficaz total =====================
! '=================== Parametros nuevos ======================'
! '=============================================================='
! '    Elab     MT     MR       Morse    Hulthen'
! '=============================================================='
do i = 1, 32
write(9,'(6F10.3)') ElabS(i), sigma( PFMRK4(kS(i), Vparam(1)   , Vparam(2)   , Vparam(3)   , 2d0*Vparam(3)  , MT , 0), &
                                     PFMRK4(kS(i), VparamMT(1) , VparamMT(2) , VparamMT(3) , 2d0*VparamMT(3), MT , 0), kS(i) )*0.01, &
                              sigma( PFMRK4(kS(i), VparamMR(1) , VparamMR(2) , VparamMR(3) , 0d0            , MR , 0), &
                                     PFMRK4(kS(i), VparamMR1(1), VparamMR1(2), VparamMR1(3), 0d0            , MR , 0), kS(i) )*0.01, &
                              sigma( PFMRK4(kS(i), VparamMO(1) , VparamMO(2) , VparamMO(3) , 0d0            , MO , 0), &
                                     PFMRK4(kS(i), VparamMO1(1), VparamMO1(2), VparamMO1(3), 0d0            , MO , 0), kS(i) )*0.01, &
                              sigma( PFMRK4(kS(i), VparamHU(1) , VparamHU(2) , VparamHU(3) , 0d0            , HU , 0), &
                                     PFMRK4(kS(i), VparamHU1(1), VparamHU1(2), VparamHU1(3), 0d0            , HU2, 0), kS(i) )*0.01
end do
! '=================== Parametros viejos ========================'
! '=============================================================='
! '    Elab     MT     MR       Morse    Hulthen'
! '=============================================================='
do i = 1, 32
write(10,'(6F10.3)') ElabS(i),sigma( PFMRK4(kS(i), Vparam(4)   , Vparam(5)   , Vparam(6)   , Vparam(7)  , MT , 0), &
                                     PFMRK4(kS(i), VparamMT(4) , VparamMT(5) , VparamMT(6) , VparamMT(7), MT , 0), kS(i) )*0.01, &
                              sigma( PFMRK4(kS(i), VparamMR(1) , VparamMR(2) , VparamMR(3) , 0d0        , MR , 0), &
                                     PFMRK4(kS(i), VparamMR1(1), VparamMR1(2), VparamMR1(3), 0d0        , MR , 0), kS(i) )*0.01, &
                              sigma( PFMRK4(kS(i), VparamMO(4) , VparamMO(5) , VparamMO(6) , 0d0        , MO , 0), &
                                     PFMRK4(kS(i), VparamMO1(4), VparamMO1(5), VparamMO1(6), 0d0        , MO , 0), kS(i) )*0.01, &
                              sigma( PFMRK4(kS(i), VparamHU(4) , VparamHU(5) , VparamHU(3) , 0d0        , HU1, 0), &
                                     PFMRK4(kS(i), VparamHU1(4), VparamHU1(5), VparamHU1(3), 0d0        , HU1, 0), kS(i) )*0.01
end do
!============================= Llamado para graficar =====================
!---------------------------------------------------------------------------------------------
!                                   Potenciales
!_____________________________________________________________________________________________
!'============================== Parametros nuevos ======================='
r = 0.001d0                                 
h = 5d0/5000d0
    do i = 1, 5000
        write(11,'(F5.3,5F13.3)')  r, MT(r, Vparam(1)  , Vparam(2)  , Vparam(3)  , 2d0*Vparam(3) ), &
                                      MR(r, VparamMr(1), VparamMr(2), VparamMr(3), 0d0           ), &
                                      MO(r, Vparammo(1), Vparammo(2), Vparammo(3), 0d0           ), &
                                      HU(r, VparamHu(1), VparamHu(2), VparamHu(3), 0d0           )
        r = r + h
    end do
r = 0.001d0                                 
h = 5d0/5000d0
    do i = 1, 5000
        write(12,'(F5.3,5F13.3)') r, MT(r , VparamMT(1) , VparamMT(2) , VparamMT(3) , 2d0*VparamMT(3) ), &
                                     MR(r , VparamMr1(1), Vparammr1(2), Vparammr1(3), 0d0             ), &
                                     MO(r , Vparammo1(1), Vparammo1(2), Vparammo1(3), 0d0             ), &
                                     HU2(r, VparamHu1(1), VparamHu1(2), VparamHu1(3), 0d0             )
        r = r + h
    end do
!'============================= Parametros viejos ======================='
r = 0.001d0                                 
h = 5d0/5000d0
    do i = 1, 5000
        write(13,'(F5.3,5F13.3)') r, MT(r , Vparam(4)  , Vparam(5)  , Vparam(6)  ,Vparam(7) ), &
                                     MR(r , VparamMr(1), Vparammr(2), Vparammr(3), 0d0      ), &
                                     MO(r , Vparammo(4), Vparammo(5), Vparammo(6), 0d0      ), &
                                     HU1(r, VparamHu(4), VparamHu(5), VparamHu(3), 0d0      )
        r = r + h
    end do
r = 0.001d0                                 
h = 5d0/5000d0
    do i = 1, 5000
        write(14,'(F5.3,5F13.3)') r, MT(r , VparamMT(4) , VparamMT(5) , VparamMT(6) , VparamMT(7) ), &
                                     MR(r , VparamMr1(1), Vparammr1(2), Vparammr1(3), 0d0         ), &
                                     MO(r , Vparammo1(4), Vparammo1(5), Vparammo1(6), 0d0         ), &
                                     HU1(r, VparamHu1(4), VparamHu1(5), VparamHu1(3), 0d0         )
        r = r + h
    end do
    
do i = 1, 17
    deltaVsr = PFMRK4(k(i), VparamMT(1) , VparamMT(2) , VparamMT(3) , 2d0*VparamMT(3) , MT, i)
end do
!== Nota: Las gráficas son mostradas en pdf con un formato pdfcairo,
!         distinto al mostrado en el documento final ==
!---------------------------------------------------------------------------------------------
!                                   Potenciales
!_____________________________________________________________________________________________    
call execute_command_line("gnuplot -p Grafica_potenciales.plt"  )
!---------------------------------------------------------------------------------------------
!                                 Cambios de fase
!_____________________________________________________________________________________________    
call execute_command_line("gnuplot -p Grafica_3S1.plt"  )
call execute_command_line("gnuplot -p Grafica_1S0.plt"  )
!---------------------------------------------------------------------------------------------
!                       Cambio de fase respecto a la distancia
!_____________________________________________________________________________________________    
call execute_command_line("gnuplot -p Grafica_d_vs_r.plt"  )
!---------------------------------------------------------------------------------------------
!                               Seccion eficaz total
!_____________________________________________________________________________________________    
call execute_command_line("gnuplot -p Grafica_seccion_eficaz.plt"  )

End program