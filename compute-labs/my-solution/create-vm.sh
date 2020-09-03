#!/bin/bash

# Import the settings from the common settings file
source ./project-settings.sh


#create Instance with metadata which contains the bucket info to push the logs once startup script has been completed to the bucket.
gcloud beta compute --project=$PROJECT_NAME instances create $VM_INSTANCE_NAME \
        --zone=us-central1-a \
        --machine-type=f1-micro \
        --subnet=default --network-tier=PREMIUM \
        --metadata=lab-logs-bucket=gs://$BUCKET_NAME/ \
        --metadata-from-file startup-script=../worker-startup-script.sh \
        --maintenance-policy=MIGRATE --scopes=https://www.googleapis.com/auth/cloud-platform --image=debian-9-stretch-v20200902 --image-project=debian-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=instance-1 --reservation-affinity=any