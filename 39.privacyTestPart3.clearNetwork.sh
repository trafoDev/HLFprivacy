MYHOME=$PWD
. env.sh

#export COMPOSE_PROJECT_NAME=net
#docker-compose -f ./config/docker-compose-test-peer.yaml -f ./config/docker-compose-couch-peer1.yaml  down --volumes --remove-orphans
docker kill peer1.org1.example.com
docker kill peer1couchdb0
docker rm -f peer1.org1.example.com
docker rm -f peer1couchdb0

docker volume rm net_peer1.org1.example.com

#remove directories
rm -rf config/peer1.org1.volume/

cd $PWD