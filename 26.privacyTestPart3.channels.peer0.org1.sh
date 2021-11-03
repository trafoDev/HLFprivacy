MYHOME=$PWD
. env.sh
cd
cd fabric-samples/test-network
#initialize marble without PDC
setEnv4Org1
echo "Join both channels"
peer channel join -b ./channel-artifacts/channel.n1.block
peer channel join -b ./channel-artifacts/channel.n2.block

cd $PWD


