MYHOME=$PWD
. env.sh
cd
cd fabric-samples/test-network

docker-compose -f ./docker/docker-compose-test-net.yaml -f ./docker/docker-compose-couch.yaml up -d peer0.org1.example.com couchdb0
cd $PWD
