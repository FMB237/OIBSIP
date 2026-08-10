#!/bin/bash
# Author FMB237

# Simple script for running my DVWA container 

# Adding the Green Color
GREEN='\033[0;32m'

echo -e "${GREEN} Running the simple DVMA script using  docker"
docker run --rm -it -p 80:80 vulnerables/web-dvwa