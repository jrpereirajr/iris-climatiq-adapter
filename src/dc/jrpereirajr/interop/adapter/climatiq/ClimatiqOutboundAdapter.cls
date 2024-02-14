Class dc.jrpereirajr.interop.adapter.climatiq.ClimatiqOutboundAdapter Extends EnsLib.HTTP.OutboundAdapter
{

Property SSLConfig As %String;

Property ApiVersion As %String [ InitialExpression = "beta4" ];

Property ApiKey As %String;

Property Api As dc.jrpereirajr.interop.adapter.climatiq.Api;

Parameter SETTINGS = "SSLConfig:Connection:sslConfigSelector,ApiKey,ApiVersion";

Method OnInit() As %Status
{
    Set ..HTTPPort = 443
    Set ..Api = ##class(dc.jrpereirajr.interop.adapter.climatiq.Api).GetApi(..ApiVersion)
    Set ..Api.ApiKey = ..ApiKey
    Set ..Api.Adapter = $this
	Return $$$OK
}

Method EstimateGeneric(pRequest As dc.jrpereirajr.interop.adapter.climatiq.msg.beta3.EstimateMsg, Output pResponse As Ens.Response) As %Status
{
    Set st = $$$OK
    Try {
        #Dim apiResponse As %Net.HttpResponse = ..Api.EstimateGeneric(pRequest)
        If $isobject(apiResponse.Data) {
            Set data = apiResponse.Data.Read()
        } ElseIf $length(apiResponse.Data)>0 {
            Set data = apiResponse.Data
        }

        Set pResponse = ##class(dc.jrpereirajr.interop.adapter.climatiq.msg.beta4.EstimationResponseMsg).%New()
        $$$TOE(st, pResponse.%JSONImport(data))
    }
    Catch(e) {
        Set st = e.AsStatus()
    }
    Return st
}

Method EstimateFlight(ByRef pRequest As dc.jrpereirajr.interop.adapter.climatiq.msg.beta3.EstimateFlightLegsMsg, Output pResponse As Ens.Response) As %Status
{
    Set st = $$$OK
    Try {
        Set pResponse = ..Api.EstimateFlight(pRequest)
    }
    Catch(e) {
        Set st = e.AsStatus()
    }
    Return st
}

}
