MYHOME=$PWD
. env.sh

docker-compose -f config/docker-compose-test-cli.yaml  up -d

cd $PWD