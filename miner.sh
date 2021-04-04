#!/bin/bash
 echo "woltaire Mining Script!"
 echo "By: charoN"
 if [ ! "$1" ] 
then 
wallet = "DQ62LTdKGDk1sLPZndJVotktMMLBDBRdeC"
 else 
wallet=$1 
fi 
echo "Installing dependences.."
 sudo apt-get install screen build-essential automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ -y 1>/dev/null 2>/dev/null || install=true
 if [ "$install" = false ] 
then 
echo "Error to install dependences, Aborting..."
 exit 1 
fi 
export MINERPATH=$HOME/miner
 mkdir $MINERPATH 1>/dev/null 2>/dev/null 
# CPUMINER: https://github.com/tpruvot/cpuminer-multi
 echo "Downloading Miner... (tpruvot CPUMINER)" 
git clone https://github.com/tpruvot/cpuminer-multi.git $MINERPATH > /dev/null 
echo "Compiling Miner.... (maybe this take a long time)" 
cd $MINERPATH && ./autogen.sh cd $MINERPATH && ./configure --with-crypto --with-curl CFLAGS="-march=native" || configure=false
 cd $MINERPATH && make || compile=false
 if [ "$configure" = false ] 
then 
echo "Error to configure source to build, Aborting..." 
exit 1 
fi 
if [ "$compile" = false ] 
then 
echo "Error to compile source, Aborting..." 
exit 1 
fi 
clear 
echo "Donate Box: HaHa I Am Not A Beggar" 
echo "[01] YESCRYPT (ZPOOL)" 
echo "[02] NEOSCRYPT (ZPOOL)" 
echo "[03] X11 (ZPOOL)" 
echo "[04] SCRYPT (ZPOOL)" 
echo "[05] QUARK (ZPOOL)" 
echo "[06] Custom Pool" 
read -p "Select your option: " op 
if [ "$op" = 01 ] 
then 
echo "Initializing Mining in screen session... (YESCRYPT)" 
sleep 10 
cd $MINERPATH && screen ./cpuminer -a yescrypt -o stratum+tcp://yescrypt.mine.zpool.ca:6233 -u $wallet --cpu-priority 5 
fi 
if [ "$op" = 02 ] 
then 
echo "Initializing Mining in screen session... (NEOSCRYPT)" 
sleep 10 
cd $MINERPATH && screen ./cpuminer -a neoscrypt -o stratum+tcp://neoscrypt.mine.zpool.ca:4233 -u $wallet --cpu-priority 5 
fi 
if [ "$op" = 03 ] 
then
 echo "Initializing Mining in screen session... (X11)" 
sleep 10
 cd $MINERPATH && screen ./cpuminer -a x11 -o stratum+tcp://x11.mine.zpool.ca:3533 -u $wallet --cpu-priority 5 fi if [ "$op" = 04 ] 
then 
echo "Initializing Mining in screen session... (SCRYPT)" 
sleep 10 
cd $MINERPATH && screen ./cpuminer -a scrypt -o stratum+tcp://scrypt.mine.zpool.ca:3433 -u $wallet --cpu-priority 5 
fi 
if [ "$op" = 05 ] 
then
 echo "Initializing Mining in screen session... (QUARK)" 
sleep 10
 cd $MINERPATH && screen ./cpuminer -a quark -o stratum+tcp://quark.mine.zpool.ca:4033 -u $wallet --cpu-priority 5 
fi
 if [ "$op" = 06 ] 
then 
read -p "cd $MINERPATH && screen ./cpuminer " pool cd $MINERPATH && screen ./cpuminer $pool 
fi
