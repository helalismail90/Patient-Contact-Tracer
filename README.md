
# Patient Contact Tracer

This project aims to help identifying and/or predicting a possible foci for covid-19. 
Given data for a patient or multiple patients.

## The following diagram explains movement for an individual between different places
<img src="https://raw.githubusercontent.com/helalismail90/Patient-Contact-Tracer/master/docs/person-movement-diagram.png"  
alt="Markdown Monster icon"  
style="float: left; margin-right: 10px;" />

## The Expected Output given a case most visited locations
All The Data being used is sampled "dummy" data for testing and demonstration purposes

<img src="https://raw.githubusercontent.com/helalismail90/Patient-Contact-Tracer/master/docs/kepler.png"  
alt="Markdown Monster icon"  
style="float: left; margin-right: 10px;" />


# This project aims to help decision makers identify
- Which areas, roads, neighborhoods The Gov. or military should start disinfecting
- Which areas would develop to be the next disease foci 
- Which hospitals would probably receive more cases


# Main Components


## Trace Generation API

An API that takes a patients most visited locations as input [ home, work, gym. .. etc ] and generates possible trace for the patient movement through routes between those locations, generating geojson response.

    GET <HOST-URL>/api/gen_trace?case_id=<CASE-ID>&locations=locALng,LocAlat;LocBLng,LocBLat;LocCLng,LocCLat
    

## Patient(s) Polygon 
A geojson output file is generated everytime the /gen_trace API is called 
The geojosn file can be feed into Kepler.gl generating a visualization with patients hotspots and most frequently used routes.


# Environment Setup

## Install Ruby
 Install Ruby Version Manager : [https://rvm.io/](https://rvm.io/)
 Download a stable ruby version [ I'm using 2.5.1 ]

## Install Jets
Jets is The Ruby Serverless Framework.
Jets allows you to create and deploy serverless services with ease. It includes everything you need to build an API and deploy it to AWS Lambda. Jets leverages the power of Ruby to make serverless joyful for everyone.
Project : [https://rubyonjets.com/](https://rubyonjets.com/)
Setup : [https://rubyonjets.com/quick-start/](https://rubyonjets.com/quick-start/)
Github : [https://github.com/tongueroo/jets](https://github.com/tongueroo/jets)

**The installation is pretty simple, upon installing ruby just run the following command**

	$ gem install jets

## Initializing Your Project Locally
    $ cd <project-directory>
    $ rake db:create
    $ rake db:migrate
    
## Run Your Project
    $ jets server
The `jets server` command starts a server that mimics API Gateway so you can test locally on port `8888` 

