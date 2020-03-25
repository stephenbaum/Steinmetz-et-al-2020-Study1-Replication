﻿* Encoding: UTF-8.

GET DATA
  /TYPE=XLSX
  /FILE='/Users/stephenbaum/Desktop/Steinmetz_etal_2020Study1.xlsx'
  /SHEET=name 'Sheet0'
  /CELLRANGE=FULL
  /READNAMES=ON
  /DATATYPEMIN PERCENTAGE=95.0
  /HIDDEN IGNORE=YES.
EXECUTE.
DATASET NAME DataSet3 WINDOW=FRONT.

*** For check, 2 is correct ***
*** For computer, 1 is correct ***
*** For previous, 3 means they have not read about this HIT before ***

CROSSTABS
  /TABLES=check BY condition
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=computer BY condition
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=previous BY condition
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.

RELIABILITY
  /VARIABLES=jenny katie sofia ava gaby Lisa
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

COMPUTE group=MEAN(jenny,katie,sofia,ava,gaby,Lisa).
EXECUTE.

DATASET ACTIVATE DataSet3.
T-TEST GROUPS=condition(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=group
  /CRITERIA=CI(.95).

DATASET ACTIVATE DataSet3.
T-TEST GROUPS=condition(1 3)
  /MISSING=ANALYSIS
  /VARIABLES=group
  /CRITERIA=CI(.95).

DATASET ACTIVATE DataSet3.
T-TEST GROUPS=condition(2 3)
  /MISSING=ANALYSIS
  /VARIABLES=group
  /CRITERIA=CI(.95).

ONEWAY group BY condition
  /CONTRAST=1 -1 0 
  /CONTRAST=1 0 -1 
  /CONTRAST=0 1 -1 
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS.

*** For each item ***

ONEWAY jenny BY condition
  /CONTRAST=1 -1 0 
  /CONTRAST=1 0 -1 
  /CONTRAST=0 1 -1 
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS.

ONEWAY katie BY condition
  /CONTRAST=1 -1 0 
  /CONTRAST=1 0 -1 
  /CONTRAST=0 1 -1 
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS.

ONEWAY sofia BY condition
  /CONTRAST=1 -1 0 
  /CONTRAST=1 0 -1 
  /CONTRAST=0 1 -1 
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS.

ONEWAY ava BY condition
  /CONTRAST=1 -1 0 
  /CONTRAST=1 0 -1 
  /CONTRAST=0 1 -1 
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS.

ONEWAY gaby BY condition
  /CONTRAST=1 -1 0 
  /CONTRAST=1 0 -1 
  /CONTRAST=0 1 -1 
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS.

ONEWAY Lisa BY condition
  /CONTRAST=1 -1 0 
  /CONTRAST=1 0 -1 
  /CONTRAST=0 1 -1 
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS.

*** What about the influence variable ***

ONEWAY influence BY condition
  /CONTRAST=1 -1 0 
  /CONTRAST=1 0 -1 
  /CONTRAST=0 1 -1 
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS.

