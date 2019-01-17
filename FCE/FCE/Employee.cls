/// Employees that might approve exchanges
Class FCE.Employee Extends FCE.PersistentPerson
{

/// Exchanges that this employee approved
Relationship ApprovedOrders As FCE.CurrencyOrder [ Cardinality = many, Inverse = Employee ];

Property Email As %String(PATTERN = ".e1""@fcxbank.com""", POPSPEC = "String(5)_""@fcxbank.com""") [ Required ];

Storage Default
{
<Data name="EmployeeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Email</Value>
</Value>
<Value name="4">
<Value>DOB</Value>
</Value>
<Value name="5">
<Value>Home</Value>
</Value>
<Value name="6">
<Value>Work</Value>
</Value>
</Data>
<DataLocation>^FCE.EmployeeD</DataLocation>
<DefaultData>EmployeeDefaultData</DefaultData>
<ExtentSize>15</ExtentSize>
<IdLocation>^FCE.EmployeeD</IdLocation>
<IndexLocation>^FCE.EmployeeI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>1</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>1.4</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="DOB">
<AverageFieldSize>5</AverageFieldSize>
<Selectivity>6.6667%</Selectivity>
</Property>
<Property name="Email">
<AverageFieldSize>16.87</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Home">
<AverageFieldSize>35.73,City:6.73,State:2,Street:16.67,Zip:5</AverageFieldSize>
<Selectivity>6.6667%,City:8.3333%,State:25.0000%,Street:6.6667%,Zip:6.6667%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>14.73</AverageFieldSize>
<Selectivity>6.6667%</Selectivity>
</Property>
<Property name="PrintName">
<AverageFieldSize>14.73</AverageFieldSize>
<Selectivity>6.6667%</Selectivity>
</Property>
<Property name="Work">
<AverageFieldSize>35.33,City:6.73,State:2,Street:16.13,Zip:5</AverageFieldSize>
<Selectivity>6.6667%,City:10.0000%,State:25.0000%,Street:6.6667%,Zip:6.6667%</Selectivity>
</Property>
<SQLMap name="EmailIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="NameIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^FCE.EmployeeS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
