;;<<Default Template>><<DISTRIBUTION>><<Default>>;;
; Do not change filenames or add or remove FILEI/FILEO statements using an editor. Use Cube/Application Manager.
RUN PGM=DISTRIBUTION PRNFILE="D:\2ND SEMESTER M TECH\STUDIO_LAB\CUBE FINAL\CUBE_DISTRIBUTION_01-04-2024\12DST00A.PRN"
FILEO MATO[1] = "D:\2ND SEMESTER M TECH\STUDIO_LAB\CUBE FINAL\CUBE_DISTRIBUTION_01-04-2024\12DST00A.MAT"
FILEI ZDATI[1] = "D:\2ND SEMESTER M TECH\STUDIO_LAB\CUBE FINAL\CUBE_DISTRIBUTION_01-04-2024\12GEN00B.DAT"
FILEI MATI[1] = "D:\2ND SEMESTER M TECH\STUDIO_LAB\CUBE FINAL\CUBE_DISTRIBUTION_01-04-2024\15MAT00B.MAT"

; The DISTRIBUTION module does not have any explicit phases.  The module does run within an implied ILOOP
; where I is the origin zones.  The module has a built in GRAVITY statement for implementing this commonly
; used distribution method.  User defined distribution process can also be defined.

ENDRUN
