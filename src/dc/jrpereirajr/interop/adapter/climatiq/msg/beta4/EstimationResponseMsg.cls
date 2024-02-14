Class dc.jrpereirajr.interop.adapter.climatiq.msg.beta4.EstimationResponseMsg Extends (Ens.Response, %JSON.Adaptor)
{

Parameter %JSONIGNOREINVALIDFIELD = 1;

Property CO2E As %Float(%JSONFIELDNAME = "co2e");

Property CO2EUnit As %String(%JSONFIELDNAME = "co2e_unit", MAXLEN = "");

Storage Default
{
<Data name="EstimationResponseMsgDefaultData">
<Subscript>"EstimationResponseMsg"</Subscript>
<Value name="1">
<Value>CO2E</Value>
</Value>
<Value name="2">
<Value>CO2EUnit</Value>
</Value>
</Data>
<DefaultData>EstimationResponseMsgDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
