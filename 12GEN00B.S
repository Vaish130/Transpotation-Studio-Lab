;;<<Default Template>><<GENERATION>><<Default>>;;
; Do not change filenames or add or remove FILEI/FILEO statements using an editor. Use Cube/Application Manager.
RUN PGM=GENERATION PRNFILE="D:\2nd Semester M tech\Studio_Lab\Cube Final\cube Final Part 2\12GEN00B.PRN"

FILEI ZDATI[1] = "D:\2nd Semester M tech\Studio_Lab\Cube Final\cube Final Part 2\Taz_23m0549.dbf"
FILEO PAO[1] = "D:\2nd Semester M tech\Studio_Lab\Cube Final\cube Final Part 2\12GEN00B.DAT",
LIST=Z P[1] A[1], DBF=T, NAMES=ID,PROD,ATTR
ZONES=11

PROCESS PHASE=ILOOP
; This phase performs a zonal loop (I=1,Zones).  This phase is used to compute productions (P[#]=) and 
; attractions (A[#]=) by zone.  Up to 20 P's and 20 A's can be computed in a single run.
  P[1]=0.8*POPULATION
  A[1]=1.2*EMPLOYMENT


ENDPROCESS


PROCESS PHASE=ADJUST
; This phase is optional and if used is processed only once after the completion of the ILOOP phase.
; This phase is used to adjust and/or balance the final trip productions and attractions.
    A[1]=P[1][0]/A[1][0]*A[1]


ENDPROCESS

ENDRUN
