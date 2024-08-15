;;<<Default Template>><<HIGHWAY>><<Default>>;;
; Do not change filenames or add or remove FILEI/FILEO statements using an editor. Use Cube/Application Manager.
RUN PGM=HIGHWAY PRNFILE="D:\2nd Semester M tech\Studio_Lab\Cube Final\cube Final Part 2\15HWY00A.PRN"
FILEI NETI = "D:\2nd Semester M tech\Studio_Lab\Cube Final\cube Final Part 2\iitbnet.net"
FILEO MATO[1] = "D:\2nd Semester M tech\Studio_Lab\Cube Final\cube Final Part 2\15HWY00A.MAT",
MO=1-3, NAME=HWYTIME,DISTANCE,HWYCOST
ZONES=11
PROCESS PHASE=ILOOP
 PATHLOAD PATH=LI.DISTANCE,

 MW[1]=pathtrace(TIME),
 MW[2]=pathtrace(li.DISTANCE),
 MW[3]=3*pathtrace(li.DISTANCE)
 
 MW[1][I] = 1000; Set Intrazonal time
      MW[2][I] = 1000;Set Intrazonal Dist
      MW[3][I] = 1000; Set Intrazonal Cost

ENDPROCESS

ENDRUN
