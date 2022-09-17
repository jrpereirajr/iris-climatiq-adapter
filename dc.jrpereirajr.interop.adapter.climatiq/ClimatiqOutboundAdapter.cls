Class dc.jrpereirajr.interop.adapter.climatiq.ClimatiqOutboundAdapter Extends EnsLib.HTTP.OutboundAdapter
{

Property SSLConfig As %String;

Property ApiVersion As %String [ InitialExpression = "beta3" ];

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

Method EstimateGeneric(ByRef pRequest As dc.jrpereirajr.interop.adapter.climatiq.msg.beta3.EstimateMsg, Output pResponse As Ens.Response) As %Status
{
    Set st = $$$OK
    Try {
        Set pResponse = ..Api.EstimateGeneric(pRequest)
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
