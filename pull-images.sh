#!/bin/bash

NEXUS_REGISTRY=<REGISTRY-NAME>:<REGISTRY-PORT>
NEXUS_REPO=<REPOSITORY-NAME>
filename1='images.txt'
NC='\033[0m'
n=0

while read -r f1 f2;
do
  echo -e "\e[36mPulling Image${NC} : $f2" #Pulling Images
  n=$((n+1))
  docker pull $f2
  echo -e "\e[92mDone${NC}\n"

  echo -e "\e[36mTagging Image${NC} : $f1" #Tagging Images
  docker tag $f2 $NEXUS_REGISTRY/$NEXUS_REPO:$f1
  echo -e "\e[92mDone${NC}\n"

  echo -e "\e[36mPushing Image${NC} : $f1" #Pushing Images
  docker push $NEXUS_REGISTRY/$NEXUS_REPO:$f1
  echo -e "\e[92mDone${NC}\n"

done < $filename1

echo -e "\e[92mAll of the images has been pushed to $NEXUS_REGISTRY !!!${NC}"
echo -e "\e[92mAmount of pushed images :${NC} $n\n"
