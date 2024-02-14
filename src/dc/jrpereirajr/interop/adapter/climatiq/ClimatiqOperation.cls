Class dc.jrpereirajr.interop.adapter.climatiq.ClimatiqOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "dc.jrpereirajr.interop.adapter.climatiq.ClimatiqOutboundAdapter";

Parameter INVOCATION = "Queue";

Property Adapter As dc.jrpereirajr.interop.adapter.climatiq.ClimatiqOutboundAdapter;

Method EstimateGeneric(ByRef pRequest As dc.jrpereirajr.interop.adapter.climatiq.msg.beta4.EstimateRequestMsg, Output pResponse As Ens.Response) As %Status
{
    Set st = $$$OK
    Try {
        $$$TOE(st, ..Adapter.EstimateGeneric(.pRequest, .pResponse))
    }
    Catch(e) {
        Set st = e.AsStatus()
    }
    Return st
}

Method EstimateClothes(ByRef pRequest As dc.jrpereirajr.interop.adapter.climatiq.msg.beta3.EstimateClothesMsg, Output pResponse As Ens.Response) As %Status
{
    // todo: implement the beta4 endpoint
    Throw ##class(%Exception.General).%New("This endpoint is no longer supported")
    Set st = $$$OK
    Try {
        // converts the message to a generic estimate paylod
        Set estimateMsg = ##class(dc.jrpereirajr.interop.adapter.climatiq.msg.beta3.EstimateMsg).%New()
        Set estimateMsg.EmissionFactor = {
                "activity_id": "consumer_goods-type_clothing"
            }.%ToJSON()
        Set estimateMsg.Parameters = {
                "money": (pRequest.Money),
                "money_unit": (pRequest.MoneyUnit)
            }.%ToJSON()

        $$$TOE(st, ..Adapter.EstimateGeneric(.estimateMsg, .pResponse))
    }
    Catch(e) {
        Set st = e.AsStatus()
    }
    Return st
}

Method EstimateFlight(ByRef pRequest As dc.jrpereirajr.interop.adapter.climatiq.msg.beta3.EstimateFlightLegsMsg, Output pResponse As Ens.Response) As %Status
{
    // todo: implement the beta4 endpoint
    Throw ##class(%Exception.General).%New("This endpoint is no longer supported")
    Set st = $$$OK
    Try {
        $$$TOE(st, ..Adapter.EstimateFlight(.pRequest, .pResponse))
    }
    Catch(e) {
        Set st = e.AsStatus()
    }
    Return st
}

Method EstimateWaterTreatment(ByRef pRequest As dc.jrpereirajr.interop.adapter.climatiq.msg.beta4.EstimateWaterTreatmentMsg, Output pResponse As dc.jrpereirajr.interop.adapter.climatiq.msg.beta4.EstimationResponseMsg) As %Status
{
    Set st = $$$OK
    Try {
        $$$TOE(st, ..Adapter.EstimateGeneric(pRequest, .pResponse))
    }
    Catch(e) {
        Set st = e.AsStatus()
    }
    Return st
}

Method EstimatePlasticWaste(ByRef pRequest As dc.jrpereirajr.interop.adapter.climatiq.msg.beta3.EstimatePlasticWasteMsg, Output pResponse As Ens.Response) As %Status
{
    // todo: implement the beta4 endpoint
    Throw ##class(%Exception.General).%New("This endpoint is no longer supported")
    Set st = $$$OK
    Try {
        // converts the message to a generic estimate paylod
        Set estimateMsg = ##class(dc.jrpereirajr.interop.adapter.climatiq.msg.beta3.EstimateMsg).%New()
        Set estimateMsg.EmissionFactor = {
                "activity_id": "waste_type_hdpe-disposal_method_combusted"
            }.%ToJSON()
        Set estimateMsg.Parameters = {
                "weight": (pRequest.Weight),
                "weight_unit": (pRequest.WeightUnit)
            }.%ToJSON()

        $$$TOE(st, ..Adapter.EstimateGeneric(.estimateMsg, .pResponse))
    }
    Catch(e) {
        Set st = e.AsStatus()
    }
    Return st
}

Method EstimationDeprecated(pRequest As %RegisteredObject, pResponse As %RegisteredObject) As %Status
{
    Try {
        Throw ##class(%Exception.General).%New("This endpoint is no longer supported")
    }
    Catch(e) {
        Set st = e.AsStatus()
    }
    Return st
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="dc.jrpereirajr.interop.adapter.climatiq.msg.beta4.EstimateWaterTreatmentMsg">
        <Method>EstimateWaterTreatment</Method>
    </MapItem>
    <MapItem MessageType="dc.jrpereirajr.interop.adapter.climatiq.msg.beta3.EstimateMsg">
        <Method>EstimationDeprecated</Method>
    </MapItem>
    <MapItem MessageType="dc.jrpereirajr.interop.adapter.climatiq.msg.beta3.EstimateClothesMsg">
        <Method>EstimationDeprecated</Method>
    </MapItem>
    <MapItem MessageType="dc.jrpereirajr.interop.adapter.climatiq.msg.beta3.EstimateFlightLegsMsg">
        <Method>EstimationDeprecated</Method>
    </MapItem>
    <MapItem MessageType="dc.jrpereirajr.interop.adapter.climatiq.msg.beta3.EstimateWaterTreatmentMsg">
        <Method>EstimationDeprecated</Method>
    </MapItem>
    <MapItem MessageType="dc.jrpereirajr.interop.adapter.climatiq.msg.beta3.EstimatePlasticWasteMsg">
        <Method>EstimationDeprecated</Method>
    </MapItem>
</MapItems>
}

}
