
MYHOME=$PWD

. env.sh
setEnv4Org2

CHANNEL=$1
echo "Decoding blocks from channel: ${CHANNEL} - START"

LENGTH=$(jq '.height' <<< "$(peer channel getinfo -c ${CHANNEL} | sed 's/.*{/{/' )")
echo "Ledger length from channel: ${CHANNEL} - ${LENGTH}"

#creating all folders
DATA_DIR=${MYHOME}/ledgersBlocks/${PEER_ID}/${CHANNEL}
mkdir -p ${DATA_DIR}/blocks
mkdir -p ${DATA_DIR}/json

while [ $LENGTH -ne 0 ]; do
  LENGTH=$(expr ${LENGTH} - 1)
  FILENAME=$(printf "%05d" ${LENGTH})
  peer channel fetch ${LENGTH} ${DATA_DIR}/blocks/${FILENAME}.block -c ${CHANNEL} 
  configtxgen -inspectBlock ${DATA_DIR}/blocks/${FILENAME}.block > ${DATA_DIR}/json/${FILENAME}.json
done

echo "Decoding blocks from channel: ${CHANNEL} - END"
cd $MYHOME
