; Script for program PUBLIC TRANSPORT in file "D:\2ND SEMESTER M TECH\STUDIO_LAB\CUBE FINAL\CUBE_DISTRIBUTION_01-04-2024\15PTR00A.S"
;;<<Default Template>><<PUBLIC TRANSPORT>><<Default>>;;
; Do not change filenames or add or remove FILEI/FILEO statements using an editor. Use Cube/Application Manager.
RUN PGM=PUBLIC TRANSPORT PRNFILE="D:\2ND SEMESTER M TECH\STUDIO_LAB\CUBE FINAL\CUBE_DISTRIBUTION_01-04-2024\15PTR00A.PRN"
FILEO ROUTEO[1] = "D:\2ND SEMESTER M TECH\STUDIO_LAB\CUBE FINAL\CUBE_DISTRIBUTION_01-04-2024\15PTR00A.RTE"
FILEO REPORTO = "D:\2ND SEMESTER M TECH\STUDIO_LAB\CUBE FINAL\CUBE_DISTRIBUTION_01-04-2024\15PTR00B.PRN"
FILEO NTLEGO = "D:\2ND SEMESTER M TECH\STUDIO_LAB\CUBE FINAL\CUBE_DISTRIBUTION_01-04-2024\15PTR00A.NTL"
FILEI FACTORI[1] = "D:\2nd Semester M tech\Studio_Lab\Cube Final\Cube_Distribution_01-04-2024\Factor_pt.FAC"
FILEI FAREI = "D:\2nd Semester M tech\Studio_Lab\Cube Final\Cube_Distribution_01-04-2024\FarePT.FAR"
FILEO NETO = "D:\2ND SEMESTER M TECH\STUDIO_LAB\CUBE FINAL\CUBE_DISTRIBUTION_01-04-2024\15PTR00A.NET"
FILEI SYSTEMI = "D:\2nd Semester M tech\Studio_Lab\Cube Final\Cube_Distribution_01-04-2024\PT_SYSTEM.PTS"
FILEI LINEI[1] = "D:\2nd Semester M tech\Studio_Lab\Cube Final\Cube_Distribution_01-04-2024\Public_Transport.LIN"
FILEI NETI = "D:\2nd Semester M tech\Studio_Lab\Cube Final\Cube_Distribution_01-04-2024\iitbnet.net"

PARAMETERS TRANTIME = lw.TRANSITTIME
 
 
PROCESS PHASE = LINKREAD
    Lw.walktime=0
    Lw.TRANSITTIME = (li.DISTANCE * 60) / li.SPEED
    Lw.distance=li.distance
    Lw.walktime=(li.DISTANCE * 60) / li.SPEED
 
ENDPROCESS
 
 
PROCESS PHASE=DATAPREP
 
;Generating Access/Egress links
  list='\nGenerate Zone Access/Egress Legs'
  GENERATE,
    COST=Lw.DISTANCE,
    EXTRACTCOST=(Lw.DISTANCE*60)/3,
    MAXNTLEGS=3,
    MAXCOST[1]=1,
    LIST=T,
    NTLEGMODE = 100,
    ONEWAY=F,
    DIRECTION=3,
    INCLUDELINK = (Lw.walktime>0),
    FROMNODE = 1-11, TONODE = 101-1100
    
 
;Generating Transfer Links
  list='\nGenerate Transfer Legs'
  GENERATE,
    COST=Lw.DISTANCE,
    EXTRACTCOST=(Lw.DISTANCE*60)/3,
  MAXNTLEGS=3,
  MAXCOST[1]=1,
  LIST=T,
  NTLEGMODE = 100,
  ONEWAY=F,
  INCLUDELINK = (Lw.walktime>0),
  FROMNODE = 100-1100, TONODE = 100-1100
  
  
ENDPROCESS
 
ENDRUN

