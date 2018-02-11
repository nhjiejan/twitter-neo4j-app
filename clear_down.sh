#/bin/bash

# stop and delete docker containers
docker-compose stop && docker-compose rm -f

# delete neo4j data directory
rm -rf neo4j-data/
