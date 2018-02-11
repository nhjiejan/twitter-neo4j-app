# (2017-18 DC3800) Advanced Database System coursework


A simple Big Data application which stores tweets in a graph and visualises the top tags associated with the tweets as a word cloud.

## Prerequisites
* Linux machine or VM
* Docker and Docker-compose (https://docs.docker.com/install/ and https://docs.docker.com/compose/install/)
* git


## installation steps

### setup twitter authentication

You will need to authenticate with Twitter to use this application. To do
so, sign up to twitter and register for developer credentials and create a Twitter app here:

	https://dev.twitter.com/apps/

* Click `create new app`
* Enter the Application details (these can be random)
* For `website` you can enter "https://www.google.com"
* Once that is created, go to `Keys and Access tokens`
* Copy the "Consumer Key" and "consumer secret" for use below

You can then create a bearer token by running:
`curl -XPOST -u consumer_key:consumer_secret 'https://api.twitter.com/oauth2/token?grant_type=client_credentials'`

e.g
```
$ curl -XPOST -u xxxxxxxxx:yyyyyyyyy 'https://api.twitter.com/oauth2/token?grant_type=client_credentials'
```

expected response:

```
{"token_type":"bearer","access_token":"xyxyxyxyxyxyxyxyxyxyxyxyxyxyxyx"}
```

update the docker-compose.yaml file and paste in the value for the "TWITTER_BEARER" variable with the "access_token" value



### Pull down git project
* `sudo yum install git`
* `git clone https://github.com/nhjiejan/twitter-neo4j-app`



### start the application
* change directory into the git project, where the docker-compose.yaml file is: `cd twitter-neo4j-app`
* change the "TWITTER_SEARCH" variable in the docker-compose.yaml file to customise your twitter search
* run `docker-compose up -d`
* this will pull down all of the docker dependencies and run all the components as independent containers


### Visit http://localhost:3000
* give the application a minute or two to load data from the twiter API and index in neo4j.
* if you're running this from within a VM (i.e vagrant) you will need to port-forward port 3000 to your host.

------------------------------------------------------------------------
