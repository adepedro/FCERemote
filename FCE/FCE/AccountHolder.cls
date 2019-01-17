/// Customer with accounts
Class FCE.AccountHolder Extends FCE.PersistentPerson
{

/// Current account balance
Property Balance As %Numeric(MINVAL = 0);

/// Type of currency that this account holds
Property Currency As FCE.CurrencyName [ Required ];

/// Exchanges that this customer made
Relationship CurrencyOrders As FCE.CurrencyOrder [ Cardinality = many, Inverse = AccountHolder ];

/// Debit account balance and save account
Method Update(paymentAmount As %Numeric) As %Status
{
	set ..Balance = ..Balance - paymentAmount
	return $$$OK
}

Storage Default
{
<Data name="AccountHolderDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Balance</Value>
</Value>
<Value name="3">
<Value>Currency</Value>
</Value>
<Value name="4">
<Value>Email</Value>
</Value>
<Value name="5">
<Value>DOB</Value>
</Value>
<Value name="6">
<Value>Home</Value>
</Value>
<Value name="7">
<Value>Work</Value>
</Value>
<Value name="8">
<Value>Name</Value>
</Value>
</Data>
<DataLocation>^FCE.AccountHolderD</DataLocation>
<DefaultData>AccountHolderDefaultData</DefaultData>
<ExtentSize>15</ExtentSize>
<IdLocation>^FCE.AccountHolderD</IdLocation>
<IndexLocation>^FCE.AccountHolderI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>1</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>1.4</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Balance">
<AverageFieldSize>6.6</AverageFieldSize>
<Selectivity>6.6667%</Selectivity>
</Property>
<Property name="Currency">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>12.5000%</Selectivity>
</Property>
<Property name="DOB">
<AverageFieldSize>5</AverageFieldSize>
<Selectivity>6.6667%</Selectivity>
</Property>
<Property name="Email">
<AverageFieldSize>4.93</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Home">
<AverageFieldSize>36.67,City:7.6,State:2,Street:16.67,Zip:5</AverageFieldSize>
<Selectivity>6.6667%,City:7.6923%,State:25.0000%,Street:6.6667%,Zip:6.6667%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>15.93</AverageFieldSize>
<Selectivity>6.6667%</Selectivity>
</Property>
<Property name="PrintName">
<AverageFieldSize>15.93</AverageFieldSize>
<Selectivity>6.6667%</Selectivity>
</Property>
<Property name="Work">
<AverageFieldSize>35.87,City:7.2,State:2,Street:16.33,Zip:5</AverageFieldSize>
<Selectivity>6.6667%,City:9.0909%,State:25.0000%,Street:6.6667%,Zip:6.6667%</Selectivity>
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
<StreamLocation>^FCE.AccountHolderS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
