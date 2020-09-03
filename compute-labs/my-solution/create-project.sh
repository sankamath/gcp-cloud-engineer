#!/bin/bash

# Import the settings from the common settings file
source ./project-settings.sh

#create project
gcloud projects create $PROJECT_NAME --name=$PROJECT_NAME

#set gloud config setting
gcloud config set project $PROJECT_NAME

gcloud config set compute/region $PROJECT_REGION

gcloud config set compute/zone $PROJECT_ZONE

gcloud beta billing projects link $PROJECT_NAME --billing-account=$ACCOUNT_ID

#enable compute api
gcloud services enable compute.googleapis.com

