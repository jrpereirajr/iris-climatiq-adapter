Class dc.jrpereirajr.interop.adapter.climatiq.msg.beta4.EstimateWaterTreatmentMsg Extends dc.jrpereirajr.interop.adapter.climatiq.msg.beta4.EstimateRequestMsg
{

Parameter %JSONIGNOREINVALIDFIELD = 1;

Property Money As %Float(%JSONFIELDNAME = "money");

Property MoneyUnit As %String(%JSONFIELDNAME = "money_unit");

Method GetJSON() As %String
{
    $$$TOE(st, ..%JSONExportToString(.params))
    Return {
        "emission_factor": {
            "activity_id": "water_treatment-type_collected_purified_water_distribution_of_water_services",
            "data_version": "^0"
        },
        "parameters": ({}.%FromJSON(params))
    }.%ToJSON()
}

Storage Default
{
<Data name="EstimateWaterTreatmentMsgDefaultData">
<Subscript>"EstimateWaterTreatmentMsg"</Subscript>
<Value name="1">
<Value>Money</Value>
</Value>
<Value name="2">
<Value>MoneyUnit</Value>
</Value>
</Data>
<DefaultData>EstimateWaterTreatmentMsgDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
