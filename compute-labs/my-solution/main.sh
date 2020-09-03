#!/bin/bash

# Import the settings from the common settings file
source ../project-settings.sh

#create project
bash create-project.sh

#create prv bucket
bash create-bucket.sh

#create Machine instance
bash create-vm.sh