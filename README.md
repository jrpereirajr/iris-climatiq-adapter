# iris-climatiq-adapter
An IRIS Interoperability adapter for using the Climatiq API

# Introduction

The [Climatiq API](https://www.climatiq.io/) is a service for calculate estating of CO2 emissions for several human activities.

Currently, the following Climatiq messages are implemented:

* [Estimate](https://www.climatiq.io/docs#estimate)
* [Flights](https://www.climatiq.io/docs#flights)
* [Water treatment](https://www.climatiq.io/docs#water-treatment)
* [Plastic waste](https://www.climatiq.io/docs#plastic-waste)
* [Clothing and footware](https://www.climatiq.io/docs#clothing-and-footwear)

Any help to increase this list are welcome! :)    

## DOCKER Support
### Prerequisites   
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.    
### Installation    
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
or using **WebTerminal**
```
http://localhost:42773/terminal/
```  
