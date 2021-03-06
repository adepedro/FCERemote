Include %occErrors

Class FCE.Operations.REST Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/branches" Method="POST" Call="CreateBranch" />
<Route Url="/branches/:ID" Method="GET" Call="RetrieveBranch" />
<Route Url="/branches/:ID" Method="DELETE" Call="DeleteBranch" />
</Routes>
}

ClassMethod RetrieveBranch(branchID As %String) As %Status
{
	#dim branch as FCE.Branch
	set branch = ##class(FCE.Branch).%OpenId(branchID, , .st)
	if (st = 1) {
		set jsonBranch = {}
		set st = branch.CopyToObject(jsonBranch)
		write jsonBranch.%ToJSON()
	}
	return st
}

ClassMethod CreateBranch() As %Status
{
	#dim %request As %CSP.Request
	set data = ##class(%DynamicObject).%FromJSON(%request.Content)
	#dim branch as FCE.Branch
	set branch = ##class(FCE.Branch).%New()
	do branch.CopyFromObject(data)
	set st = branch.%Save()
	if (st = 1) {
		set jsonBranch = {}
		set st = branch.CopyToObject(jsonBranch)
		write jsonBranch.%ToJSON()
	}
	return st
}

ClassMethod DeleteBranch(branchID As %String) As %Status
{
	#dim %response As %CSP.Response
	set st = ##class(FCE.Branch).%DeleteId(branchID)
	set %response.Status = ..#HTTP204NOCONTENT
	return st
}

/// Issue a '500' error and give some indication as to what occurred
/// (Overridden to interpret some particular %Status values as different HTTP status codes.)
ClassMethod Http500(ex As %Exception.AbstractException) As %Status
{
	set st = ex.AsStatus()
	set code = +$System.Status.GetErrorCodes(st)
    return ..ReportHttpStatusCode($case(code,
    			$$$LoadObjectNotFound  :..#HTTP404NOTFOUND,
    			$$$DeleteObjectNotFound:..#HTTP404NOTFOUND,
    			$$$AccessDenied        :..#HTTP403FORBIDDEN,
    			                       :..#HTTP500INTERNALSERVERERROR), st)
}

}
