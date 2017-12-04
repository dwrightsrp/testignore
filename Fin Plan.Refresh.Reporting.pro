601,100
602,"Fin Plan.Refresh.Reporting"
562,"VIEW"
586,"Fin Plan"
585,"Fin Plan"
564,
565,"fl:j<QagYAiFmc6@GiQ:Vp@HYqwAmg6lsAol6Q2Er7TqnMgyoV7B?L<Pq5Eal3k`4qA_dv?Xj7>yaKQf;af8[z1R2bN5gB:>FxgKni<S[q1u^awX_?3GSYpuo36Tn]^^5nx1N=@RrD`f\nqXmW7AA^_EBk0KIBT5VbBp270MmP`btC=5adjWlT=Ch37VpMbOBMGki@[n"
559,1
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,0
567,","
588,"."
589,
568,""""
570,Fin Plan Load Reporting
571,
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,14
vAccount
vYear
vScenario
vVersion
vLedger
vSubledger
vBU
vGL
vMonth
vMeasure
vValue
NVALUE
SVALUE
VALUE_IS_STRING
578,14
2
2
2
2
2
2
2
2
2
2
1
1
2
1
579,14
9
1
3
4
5
6
7
8
2
10
11
0
0
0
580,14
0
0
0
0
0
0
0
0
0
0
0
0
0
0
581,14
0
0
0
0
0
0
0
0
0
0
0
0
0
0
582,11
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=33ColType=827
931,1
0,0,0,0,0,0,0,0,0,0,0,
603,0
572,89

#****Begin: Generated Statements***
#****End: Generated Statements****


vCube = 'Fin Plan';
vTCube = 'Fin Plan Reporting';
vSysCube = 'System_Parameters';
vDim = 'Time';

TargetDir = CellGetS(vSysCube,'DataOut Directory','String');

CubeClearData(vTCube);

vView = 'Fin Plan Load Reporting';
vCurTime = SUBST(CellGetS( vSysCube,'Server Date','String'),1,4) | ' ' |  SUBST(CellGetS( vSysCube,'Server Date','String'),6,2);

IF( ViewExists(vCube,vView) = 1);
	ViewDestroy(vCube,vView);
ENDIF;
	ViewCreate(vCube,vView);

CubeSetLogChanges(vTCube,0);

ViewSubsetAssign(vCube,vView,'Account','zLeaf');
ViewRowDimensionSet(vCube,vView,'Account',1);

ViewSubsetAssign(vCube,vView,'Year','zLeaf');
ViewRowDimensionSet(vCube,vView,'Year',2);

ViewSubsetAssign(vCube,vView,'Month','zLeaf');
ViewColumnDimensionSet(vCube,vView,'Month',1);

ViewSubsetAssign(vCube,vView,'Scenario','Fin Plan Reporting');
ViewRowDimensionSet(vCube,vView,'Scenario',3);

ViewSubsetAssign(vCube,vView,'Version','All Members');
ViewRowDimensionSet(vCube,vView,'Version',4);

ViewSubsetAssign(vCube,vView,'Ledger Type','zLeaf');
ViewRowDimensionSet(vCube,vView,'Ledger Type',5);

ViewSubsetAssign(vCube,vView,'Subledger','zLeaf');
ViewRowDimensionSet(vCube,vView,'Subledger',6);

ViewSubsetAssign(vCube,vView,'Business_Unit','zLeaf');
ViewRowDimensionSet(vCube,vView,'Business_Unit',7);

ViewSubsetAssign(vCube,vView,'GL_Unit','zLeaf');
ViewRowDimensionSet(vCube,vView,'GL_Unit',8);

ViewSubsetAssign(vCube,vView,'Measures (Fin Plan)','Final Amount');
ViewColumnDimensionSet(vCube,vView,'Measure (Fin Plan)',2);

ViewExtractSkipZeroesSet (vCube, vView, 1);
ViewExtractSkipCalcsSet(vCube, vView, 1);

DataSourceNameForServer = vCube;
DatasourceCubeview=vView;


#ATTRDELETE(vDim,'Acct Actuals');
#ATTRINSERT(vDim,'','Acct Actuals','S');
#
#ATTRDELETE(vDim,'Acct A/B Display');
#ATTRINSERT(vDim,'','Acct A/B Display','S');
#
#ATTRDELETE(vDim,'Acct A/F Display');
#ATTRINSERT(vDim,'','Acct A/F Display','S');
#
#vIndx = 1;
#vDimSize = DIMSIZ(vDim);
#
#WHILE(vIndx <= vDimSize);
#	vElement = DIMNM(vDim,vIndx);
#	IF( ELLEV(vDim,vElement) = 0);
#		IF(vIndx< DIMIX(vDim,vCurTime));
#			ATTRPUTS('Y',vDim,vElement,'Acct Actuals');
#			ATTRPUTS('Actual',vDim,vElement,'Acct A/B Display');
#			ATTRPUTS('Actual',vDim,vElement,'Acct A/F Display');
#		ELSE;
#			ATTRPUTS('Budget',vDim,vElement,'Acct A/B Display');
#			ATTRPUTS('Forecast',vDim,vElement,'Acct A/F Display');
#		ENDIF;
#	ENDIF;
#	vIndx = vIndx+1;
#END;
#

573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,15

#****Begin: Generated Statements***
#****End: Generated Statements****

IF( vMonth @= 'BB' );
	itemskip;
ENDIF;

#vTime = vMonth | ' ' | vYear;
vTime = vMonth | ' ' | vYear;

IF( DIMIX(vDim,vTime) = 0 % (DIMIX(vDim,vTime) >= DIMIX(vDim,vCurTime) & vScenario @= 'Actual'));
	itemskip;
ENDIF;

CellPutN(vValue,vTCube,vLedger,vScenario,vGL,vVersion,vBU,vSubledger,vTime,vAccount,vMeasure);
575,3

#****Begin: Generated Statements***
#****End: Generated Statements****
576,CubeAction=1511DataAction=1503CubeLogChanges=0
930,0
638,1
804,0
1217,0
900,
901,
902,
903,
906,
929,
907,
908,
904,0
905,0
909,0
911,
912,
913,
914,
915,
916,
917,0
918,1
919,0
920,50000
921,""
922,""
923,0
924,""
925,""
926,""
927,""
