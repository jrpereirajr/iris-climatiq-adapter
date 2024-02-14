Class dc.jrpereirajr.interop.adapter.climatiq.ApiBeta3 Extends dc.jrpereirajr.interop.adapter.climatiq.Api
{

Parameter Server = "beta4.api.climatiq.io";

Method GetServer() As %String
{
    Return ..#Server
}

Method CreateRequest() As %Net.HttpRequest
{
    #Dim request = ##class(%Net.HttpRequest).%New()
    Do request.SetHeader("Authorization", "Bearer "_..ApiKey)
    Return request
}

Method EstimateGeneric(pPayload As dc.jrpereirajr.interop.adapter.climatiq.msg.beta4.EstimateRequestMsg) As %Net.HttpResponse
{
    #Dim request = ..CreateRequest()
    Set url = "https://"_..GetServer()_"/estimate"
    Set json = pPayload.GetJSON()
    Set data(1) = json
    $$$TOE(st, ..Adapter.SendFormDataArray(.response, "POST", request, "", .data, url))
    Return response
}

Method EstimateFlight(pPayload As dc.jrpereirajr.interop.adapter.climatiq.msg.beta3.EstimateFlightLegsMsg) As %Net.HttpResponse
{
    #Dim request = ..CreateRequest()
    Set url = "https://"_..GetServer()_"/travel/flights"
    $$$TOE(st, pPayload.%JSONExportToString(.json))
    Set data(1) = json
    $$$TOE(st, ..Adapter.SendFormDataArray(.response, "POST", request, "", .data, url))
    Return response
}

}
