#!/bin/bash
chmod +x download_lakesp_command.sh
module load Anaconda3/2022.10
source activate /home/kmcquil/env/swot_normalq
podaac-data-downloader -c SWOT_L2_HR_LakeSP_2.0 -d /projects/swot/Data/SWOT_L2_HR_LakeSP_2.0/ --start-date 2023-01-01T00:00:00Z --end-date 2024-07-07T23:59:59Z --granule-name *_NA_*


