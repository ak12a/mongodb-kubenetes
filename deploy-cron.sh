#!/bin/bash

echo -e "\n\n[Mongo-CronJob-Setup] Deploying  mongo backup cronjob \n\n"

kubectl apply -f ./cronjob/

echo 
if [ $? == '0' ]
  then 
   echo -e "\n\n[Mongo-CronJob-Setup] Cronjob deployed Successfully \n\n"
  else  
   echo -e "\n\n[Mongo-CronJob-Setup] somthing wired happen Please check bu running kubectl command \n\n"
fi 
exit