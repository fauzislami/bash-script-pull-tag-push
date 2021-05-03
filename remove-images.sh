#!/bin/bash



NEXUS_REGISTRY=registry.paas.pajak.go.id:5000

NEXUS_REPO=ocp4/openshift4

filename1='images-ocp4-2-21.txt'

NC='\033[0m'

n=0



while read -r f1 f2;

do

#  echo -e "\e[36mRemoving Base Image${NC} : $f2"

#  n=$((n+1))

#  docker rmi -f $f2

#  echo -e "\e[92mDone${NC}\n"



 echo -e "\e[36mRemoving Tagged Image${NC} : $f1"

  docker rmi $NEXUS_REGISTRY/$NEXUS_REPO:$f1

  echo -e "\e[92mDone${NC}\n"



done < $filename1



echo -e "\e[92mAll of the images has been removed!${NC}"

echo -e "\e[92mAmount of removed images :${NC} $n\n"
