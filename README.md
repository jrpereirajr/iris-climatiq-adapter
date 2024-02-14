# iris-climatiq-adapter
An IRIS Interoperability adapter for using the Climatiq API

# Introduction

The [Climatiq API](https://www.climatiq.io/) is a service for calculate estating of CO2 emissions for several human activities.

Currently, the following Climatiq messages are implemented:

* [Water treatment](https://www.climatiq.io/data/activity/water_treatment-type_collected_purified_water_distribution_of_water_services)

TODO list (available for the older beta3 version but still unimplemented in beta4):

* [Estimate](https://www.climatiq.io/docs#estimate)
* [Flights](https://www.climatiq.io/docs#flights)
* [Plastic waste](https://www.climatiq.io/docs#plastic-waste)
* [Clothing and footware](https://www.climatiq.io/docs#clothing-and-footwear)

TODO list (available for the newer beta4 version but still unimplemented):
* A LOT! Any help to increase the supported list are very welcome! :) 

# IPM

You can add this adapter to your project using the IPM (formely known as ZPM):

```
USER>zpm
=============================================================================
|| Welcome to the Package Manager Shell (ZPM).                             ||
|| Enter q/quit to exit the shell. Enter ?/help to view available commands ||
=============================================================================
zpm:USER>install iris-climatiq-adapter
```

# DOCKER Support - sample app

## Prerequisites

Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.    

## Installation

Clone/git pull the repo into any local directory
```
$ git clone https://github.com/jrpereirajr/iris-climatiq-adapter.git  
```
Open the terminal in this directory and run:
```
$ docker-compose build
```
Run IRIS container with your project:
```
$ docker-compose up -d
```
Test from docker console
```
$ docker-compose exec iris1 iris session iris
USER>
```

After you are done, you can access a[sample IRIS production](http://localhost:42773/csp/user/EnsPortal.ProductionConfig.zen?PRODUCTION=dc.jrpereirajr.interop.adapter.climatiq.samples.SampleProduction) with the Climatiq Business Operation using the  Climatiq Output Adapter:

![](https://raw.githubusercontent.com/jrpereirajr/iris-climatiq-adapter/main/img/chrome_9lFuMDSU72.png)

This adapter uses the Climatiq API to perform the CO2 estimations. So, you need to have the Climatiq API key set up in the Climatiq Business Operation:

![](https://raw.githubusercontent.com/jrpereirajr/iris-climatiq-adapter/main/img/4ZcBbGwtzZ.png)

You also have to set up a SSL configuration in the Climatiq Business Operation, in order to perform HTTPS requests:

![](https://raw.githubusercontent.com/jrpereirajr/iris-climatiq-adapter/main/img/EvBXBganYH.png)

After you are done, you can start the IRIS Interoperaiblity production and test the Climatiq Business Operation:

![](https://raw.githubusercontent.com/jrpereirajr/iris-climatiq-adapter/main/img/USFKjxuIZb.png)
![](https://raw.githubusercontent.com/jrpereirajr/iris-climatiq-adapter/main/img/D9cjPfaAlg.png)
![](https://raw.githubusercontent.com/jrpereirajr/iris-climatiq-adapter/main/img/qIxcdl0Nlj.png)
![](https://raw.githubusercontent.com/jrpereirajr/iris-climatiq-adapter/main/img/zyLAerfrAo.png)
![](https://raw.githubusercontent.com/jrpereirajr/iris-climatiq-adapter/main/img/nAxZrj2TFF.png)

Note that you ask to Climatiq estimate the CO2 emissions for US$ 100 of water treatment, which climatiq estimate as emiting 409.1 kg of CO2.