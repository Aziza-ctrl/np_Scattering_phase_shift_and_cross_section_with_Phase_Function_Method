Module Constantes
    implicit none
    real(8), parameter :: pi = acos(-1.0d0)
    real(8), parameter :: mp = 938.272046         !938.27208816 !MeV
    real(8), parameter :: mn = 939.565379         !939.56542052 !MeV
    real(8), parameter :: Mu = mp*mn/(mp+mn)      !MeV
    real(8), parameter :: hc = 197.329            !197.326
    real(8), parameter :: frac = (hc**2)/(2d0*Mu) !41.472

    real(8), parameter, dimension(18)   :: Elab      = [ 1.0     , 5.0    , 10.0   , 15.0 , &
                                                         20.0    , 25.0   , 50.0   , 75.0 , &
                                                         100.0   , 125.0  , 150.0  , 175.0, &
                                                         200.0   , 225.0  , 250.0  , 275.0, &
                                                         300.0   , 350.0]
    
    real(8), parameter, dimension(11)   :: ElabG     = [ 1.0     , 5.0    , 10.0   , 25.0 , &
                                                         50.0    , 100.0  , 150.0  , 200.0, &
                                                         250.0   , 300.0  , 350.0  ]
    
    real(8), parameter, dimension(32)   :: ElabS     = [ 0.00197 , 0.003  , 0.008  , 0.01 , &
                                                         0.023645, 0.06   , 0.07500, 0.143, &
                                                         0.155   , 0.205  , 0.315  , 0.405, &
                                                         0.415   , 0.585  , 0.605  , 1.0  , &
                                                         5.0     , 10.0   , 15.0   , 20.0 , &
                                                         25.0    , 50.0   , 75.0   , 100.0, &
                                                         125.0   , 150.0  , 175.0  , 200.0, &
                                                         225.0   , 250.0  , 275.0  , 300.0  ]
    
    real(8), parameter, dimension(11)   :: deltaExpG = [ 147.748 , 118.169, 102.587, 80.559, &
                                                         62.645  , 43.088 , 30.644 , 21.244, &
                                                         13.551  , 6.966  , 1.176  ]
    
    real(8), parameter, dimension(11)   :: deltaExpG1 = [ 62.105 , 63.689 , 60.038 , 51.011, &
                                                          40.644 , 26.772 , 16.791 , 8.759 , &
                                                          1.982  , -3.855 , -8.923 ]
    
    real(8), parameter, dimension(18)   :: deltaExp1 = [ 147.71  , 118.08 , 102.76 , 93.55, &
                                                         86.92   , 81.68  , 64.23  , 52.64, &
                                                         43.71   , 36.47  , 30.44  , 25.29, &
                                                         20.83   , 16.89  , 13.36  , 10.18, &
                                                         7.27    , 2.11]
    
    real(8), parameter, dimension(18)   :: deltaExp2 = [ 61.95   , 63.23  , 59.35  , 55.88, &
                                                         52.9    , 50.3   , 40.38  , 32.87, &
                                                         26.4    , 20.57  , 15.26  , 10.41, &
                                                         5.99    , 1.99   , -1.63  , -4.89, &
                                                        -7.82    , -12.83 ]
    
    real(8), parameter, dimension(17)   :: deltaSim  = [ 146.795 , 114.905, 97.552 ,97.552, &
                                                         79.286  , 73.354 , 55.156 ,44.955, &
                                                         38.064  , 38.064 , 29.080 ,25.973, &
                                                         23.448  , 21.368 , 19.640 ,18.193, &
                                                         16.973  ]
    
    real(8), parameter, dimension(17)   :: deltaSimMo  = [ 146.138 , 115.701, 99.804 ,90.039, &
                                                         82.915    , 77.270 , 58.975 ,47.706, &
                                                         39.469    , 32.962 , 27.581 ,22.996, &
                                                         19.004    , 15.474 , 12.311 , 9.450, &
                                                         6.840  ]
    
    real(8), parameter, dimension(17)   :: deltaSimMo1  = [ 62.139 , 64.167 , 60.351 ,56.671, &
                                                         53.369    , 50.397 , 38.831 ,30.462, &
                                                         23.867    , 18.416 , 13.771 ,9.725 , &
                                                         6.144     , 2.933  , 0.026  ,-2.628, &
                                                         -5.068  ] 
    
    real(8), parameter, dimension(17)   :: deltaSimMR  = [ 173.191 , 123.852, 101.811 ,90.808, &
                                                         83.878    , 78.859 , 64.247  ,57.039, &
                                                         52.546    , 49.065 , 46.381  ,44.325, &
                                                         42.610    , 41.075 , 39.716  ,38.552, &
                                                         37.554  ]
    
    real(8), parameter, dimension(17)   :: deltaSimMR1  = [ 64.491 , 62.783 , 57.679 ,53.995, &
                                                         51.197    , 48.955 , 41.791 ,37.630, &
                                                         34.796    , 32.726 , 31.156 ,29.940, &
                                                         28.987    , 28.237 , 27.644 ,27.178, &
                                                         26.813  ]
    
    real(8), parameter, dimension(32)   :: sigma_exp = [ 20130.0   ,100000.0,100000.0,100000.0, &
                                                         17749.5   , 15400.0, 14200.0,          &
                                                         11210.0   , 10780.0, 9580.0 , 7920.0 , &
                                                         6900.0    , 6940.0 , 5759.0 , 5725.0 , &
                                                         4261.0    , 1627.0 , 944.6  , 649.0  , &
                                                         482.3     ,  380.3 , 168.1  , 101.7  , &
                                                         73.62     , 60.234 , 50.77  , 46.121 , &
                                                         42.43     , 39.649 , 37.89  , 36.178 , &
                                                         35.53   ]
    
    real(8), parameter, dimension(11) :: EcmG = mp*ElabG /(mn+mp)
    real(8), parameter, dimension(18) :: Ecm  = mp*Elab  /(mn+mp)
    real(8), parameter, dimension(32) :: EcmS = mp*ElabS /(mn+mp)
    
    real(8), parameter, dimension(11) :: kG   = sqrt(EcmG/frac)
    real(8), parameter, dimension(18) :: k    = sqrt(Ecm /frac)
    real(8), parameter, dimension(32) :: ks   = sqrt(EcmS/frac)

    real(8), parameter, dimension(7) :: Vparam    = [6441.306 , 1673.652, 2.323, 1458.0 , 635.0  , 1.55 ,  3.11  ] !Vr, Va, Mua 
    real(8), parameter, dimension(7) :: VparamMT  = [3596.159 , 994.549, 2.096, 897.304, 331.801, 1.575, 3.704  ] !Vr, Va, Mua 

    real(8), parameter, dimension(3) :: VparamMR  = [1.57             , 1.213542              ,         0.005 ] !A, b, alpha
    real(8), parameter, dimension(3) :: VparamMR1 = [0.952            ,  1.152                ,        -0.0043] !A, b, alpha

    real(8), parameter, dimension(6) :: VparamMo  = [113.983, 0.839   , 0.350       , 162.309 , 0.658   , 0.3 ] !V0, rm, am
    real(8), parameter, dimension(6) :: VparamMo1 = [103.798, 0.886   , 0.308       , 121.236 , 0.667 , 0.283 ] !V0, rm, am
    
    real(8), parameter, dimension(5) :: VparamHu  = [1.1    ,  0.2316 , 0.0         , 1.4054  ,       0.232   ] !beta, alpha
    real(8), parameter, dimension(5) :: VparamHu1 = [1.1    , -0.0544 , 0.0         , 1.4054  ,     -0.0404   ] !beta, alpha
    
    contains
End module Constantes