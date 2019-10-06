      DOUBLE PRECISION FUNCTION BESFJ0(X)
C     BESSEL FUNCTION J0(X)
C
      DOUBLE PRECISION X
      DOUBLE PRECISION SRNAME
      DOUBLE PRECISION A, B, C, CX, G, SX, T2, T, TBPI, XBIG, XVSMAL, Y
      DOUBLE PRECISION DCOS, DSIN, DSQRT
C     ..
      DATA SRNAME /8H BESFJ0 /
      DATA XBIG,XVSMAL,TBPI/3.4D+15,3.2D-9,6.36619772367581343D-1/
C
      T = DABS(X)
C     ERROR 1 TEST
      IF (T.GT.XBIG) GO TO 60
C     X RANGE TEST
      IF (T.GT.8.0D0) GO TO 40
C     SMALL X
C      TEST FOR VERY SMALL X
      IF (T.GT.XVSMAL) GO TO 20
      BESFJ0 = 1.0D0
      GO TO 80
   20 T = 3.125D-2*T*T - 1.0D0
      T2 = 2.0D0*T
C
C
      A= +4.125321000000D-14
      B=T2*A -1.943834690000D-12
      C=T2*B-A +7.848696314000D-11
      A=T2*C-B  -2.679253530560D-9
      B=T2*A-C  +7.608163592419D-8
      C=T2*B-A  -1.761946907762D-6
      A=T2*C-B  +3.246032882101D-5
      B=T2*A-C  -4.606261662063D-4
      C=T2*B-A  +4.819180069468D-3
      A=T2*C-B  -3.489376941141D-2
      B=T2*A-C  +1.580671023321D-1
      C=T2*B-A  -3.700949938726D-1
      A=T2*C-B  +2.651786132033D-1
      B=T2*A-C  -8.723442352852D-3
      Y=T*B-A  +1.577279714749D-1
C
      BESFJ0 = Y
      GO TO 80
C
C     LARGE X
   40 G = T - 0.5D0/TBPI
      Y = DSQRT(TBPI/T)
      CX = DCOS(G)*Y
      SX = -DSIN(G)*Y*8.0D0/T
      T = 128.0D0/(T*T) - 1.0D0
C
C
      Y=  +9.99457276D-1+T*(  -5.36366929D-4+T*(  +6.13732440D-6+
     AT*(  -2.06823782D-7+T*(  +1.30451717D-8))))
C
      G=  -1.55551139D-2+T*(  +6.83314931D-5+T*(  -1.47708215D-6+
     AT*(  +7.10458046D-8+T*(  -5.81753275D-9+T*( +6.75219505D-10)))))
C
C
      BESFJ0 = Y*CX + G*SX
      GO TO 80
C
   60 WRITE(6,61) SRNAME
   61 FORMAT(1X,//,'ERROR IN ',A8)
      BESFJ0 = DSQRT(TBPI/T)
C
   80 RETURN
      END
      DOUBLE PRECISION FUNCTION BESFJ1(X)
C     BESSEL FUNCTION J1(X)
C
      DOUBLE PRECISION X
      DOUBLE PRECISION SRNAME
      DOUBLE PRECISION A, B, C, CX, G, SX, T2, T, TBPI, XBIG, XVSMAL, Y
      DOUBLE PRECISION DCOS, DSIN, DSQRT
      DATA SRNAME /8H BESFJ1 /
      DATA XVSMAL,XBIG,TBPI/3.2D-9,3.4D+15,6.36619772367581343D-1/
C
      T = DABS(X)
C     ERROR 1 TEST
      IF (T.GT.XBIG) GO TO 60
C     X RANGE TEST
      IF (T.GT.8.0D0) GO TO 40
C     SMALL X
      Y = 4.0D0
C      TEST FOR VERY SMALL X
      IF (T.LE.XVSMAL) GO TO 20
      T = 3.125D-2*T*T - 1.0D0
      T2 = 2.0D0*T
C
      A= -5.777404200000D-13
      B=T2*A +2.528123664000D-11
      C=T2*B-A -9.424212981600D-10
      A=T2*C-B  +2.949707007278D-8
      B=T2*A-C  -7.617587805400D-7
      C=T2*B-A  +1.588701923993D-5
      A=T2*C-B  -2.604443893486D-4
      B=T2*A-C  +3.240270182684D-3
      C=T2*B-A  -2.917552480615D-2
      A=T2*C-B  +1.777091172397D-1
      B=T2*A-C  -6.614439341345D-1
      C=T2*B-A  +1.287994098858D+0
      A=T2*C-B  -1.191801160541D+0
      Y=T*A-C  +6.483587706053D-1
C
C
   20 BESFJ1 = Y*X*0.125D0
      GO TO 80
C
C     LARGE X
   40 G = T - 1.5D0/TBPI
      Y = DSIGN(DSQRT(TBPI/T),X)
      CX = DCOS(G)*Y
      SX = -DSIN(G)*Y*8.0D0/T
      T = 128.0D0/(T*T) - 1.0D0
C
C
      Y=  +1.00090703D+0+T*(  +8.98804504D-4+T*(  -7.95959347D-6+
     AT*(  +2.47105358D-7+T*(  -1.49751260D-8))))
C
C
C
      G=  +4.67768740D-2+T*(  -9.62145905D-5+T*(  +1.82113970D-6+
     AT*(  -8.29018528D-8+T*(  +6.58335466D-9+T*( -7.49818190D-10)))))
C
C
      BESFJ1 = Y*CX + G*SX
      GO TO 80
C     ERROR 1 EXIT
   60 WRITE(6,61) SRNAME
   61 FORMAT(1X,//,'ERROR IN ',A8)
      BESFJ1 = DSQRT(TBPI/T)
C
   80 RETURN
      END
      COMPLEX*16 FUNCTION BESHS0(X, IFAIL)
C     COMPLEX*16 BESHS0
C-----------------------------------------------------------------------
C     BESSEL FUNCTION HS0(X)
C
C                           COMPUTED USING CHEBYSHEV REPRESENTATION
C
C-----------------------------------------------------------------------
C
      DOUBLE PRECISION X
      INTEGER IFAIL
      DOUBLE PRECISION SRNAME
      DOUBLE PRECISION A, B, C, CX, G, SX, T2, T, TBPI, XBIG, XVSMAL, Y
      DOUBLE PRECISION DCOS, DSIN, DSQRT, P, Q, Z
      DATA SRNAME /8H BESHS0 /
      DATA XBIG,XVSMAL,TBPI/3.4D+15,3.2D-9,6.36619772367581343D-1/
C
      T = DABS(X)
C     ERROR 1 TEST
      IF (T.GT.XBIG) GO TO 60
      IFAIL = 0
C     X RANGE TEST
      IF (T.GT.8.0D0) GO TO 40
C     SMALL X
C      TEST FOR VERY SMALL X
      IF (T.GT.XVSMAL) GO TO 20
      BESFJ0 = 1.0D0
      GO TO 80
   20 T = 3.125D-2*T*T - 1.0D0
      T2 = 2.0D0*T
C
C
      A= +4.125321000000D-14
      B=T2*A -1.943834690000D-12
      C=T2*B-A +7.848696314000D-11
      A=T2*C-B  -2.679253530560D-9
      B=T2*A-C  +7.608163592419D-8
      C=T2*B-A  -1.761946907762D-6
      A=T2*C-B  +3.246032882101D-5
      B=T2*A-C  -4.606261662063D-4
      C=T2*B-A  +4.819180069468D-3
      A=T2*C-B  -3.489376941141D-2
      B=T2*A-C  +1.580671023321D-1
      C=T2*B-A  -3.700949938726D-1
      A=T2*C-B  +2.651786132033D-1
      B=T2*A-C  -8.723442352852D-3
      Y=T*B-A  +1.577279714749D-1
C
      BESHS0 = DCMPLX(Y,0.0D0)
      GO TO 80
C
C     LARGE X
   40 G = T - 0.5D0/TBPI
      Y = DSQRT(TBPI/T)
      CX = DCOS(G)*Y
      SX = DSIN(G)*Y
      Z = 128.0D0/(T*T) - 1.0D0
C
C
      P=  +9.99457276D-1+Z*(  -5.36366929D-4+Z*(  +6.13732440D-6+
     AZ*(  -2.06823782D-7+Z*(  +1.30451717D-8))))
C
C
      Q=  -1.55551139D-2+Z*(  +6.83314931D-5+Z*(  -1.47708215D-6+
     AZ*(  +7.10458046D-8+Z*(  -5.81753275D-9+Z*( +6.75219505D-10)))))
C
      Q = Q*8.0D0/T
C
      BESHS0 = DCMPLX(P,Q)*DCMPLX(CX,SX)
      GO TO 80
C
C     ERROR 1 EXIT
   60 WRITE(6,61) SRNAME
   61 FORMAT(1X,//,'ERROR IN ',A8)
      BESHS0 = DCMPLX(TBPI/T,0.0D0)
C
   80 RETURN
      END
