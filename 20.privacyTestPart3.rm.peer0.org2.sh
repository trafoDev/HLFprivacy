MYHOME=$PWD
. env.sh
cd
docker kill peer0.org2.example.com
docker rm   peer0.org2.example.com
docker kill cli.test
docker rm   cli.test
docker volume rm net_peer0.org2.example.com

docker kill couchdb1
docker rm   couchdb1

cd $PWD

