#!/bin/bash
# Arguments 
# 1. start date in the format YYYY-MM-DDTHH:MM:SSZ
# 2. end date in the format YYYY-MM-DDTHH:MM:SSZ

# Example command: 
# ./download_lakesp_command.sh  2023-01-01T00:00:00Z 2024-07-07T23:59:59Z 

# Print the arguments 
echo "Start date: $1"
echo "End date: $2"

#chmod +x download_lakesp_command.sh
module load Anaconda3/2022.10
source activate /home/kmcquil/env/swot_normalq
podaac-data-downloader -c SWOT_L2_HR_LakeSP_2.0 -d /projects/swot/Data/SWOT_L2_HR_LakeSP_2.0/ --start-date $1 --end-date $2 --granule-name *_NA_*


