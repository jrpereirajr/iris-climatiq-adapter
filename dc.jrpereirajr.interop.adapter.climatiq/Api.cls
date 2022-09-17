Class dc.jrpereirajr.interop.adapter.climatiq.Api Extends %RegisteredObject
{

Property ApiKey As %String;

Property Adapter As dc.jrpereirajr.interop.adapter.climatiq.ClimatiqOutboundAdapter;

ClassMethod GetApi(pApiVersion As %String) As dc.jrpereirajr.interop.adapter.climatiq.Api
{
    If (pApiVersion = "beta3") {
        Return ##class(dc.jrpereirajr.interop.adapter.climatiq.ApiBeta3).%New()
    } Else {
        Throw ##class(%Exception.General).%New("API version not supported: "_pApiVersion)
    }
}

Method GetServer() As %String [ Abstract ]
{
}

Method CreateRequest() As %Net.HttpRequest [ Abstract ]
{
}

}
