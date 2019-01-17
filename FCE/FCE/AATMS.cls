Class FCE.AATMS [ ClassType = view, CompileAfter = FCE.ATM, DdlAllowed, Owner = {_SYSTEM}, Not ProcedureBlock, SqlTableName = AATMS, ViewQuery = { SELECT SerialNumber,Address->City
 	FROM FCE.ATM
 	WHERE Address->City %STARTSWITH 'A'} ]
{

Parameter READONLY = 1;

}
