# General set up and commands for ARC

## Helpful documentation

- PODAAC Data Downloader: https://github.com/podaac/data-subscriber
- ARC VT: https://arc.vt.edu/
- ARC Open OnDemand (request jupyter notebook on the cluster): https://ood.arc.vt.edu/pun/sys/dashboard/

## Setup a python environment on ARC to run the PODAAC data downloader

- Create the environment on the node type where you will partially run the code.
- Use 'source' instead of 'conda'
- Will also have to set up the  .netrc file. Details in the podaac-data-downloader tutorial. 

```

module load Anaconda3/2022.10
conda create -p /home/kmcquil/env/swot_normalq python=3.9 pip
source activate /home/kmcquil/env/swot_normalq

pip install geopandas
pip install netCDF4
pip install numpy
pip install pandas
pip install podaac-data-subscriber
pip install matplotlib
pip install matplotlib_scalebar
pip install ipykernel
conda install ipython
conda install jupyter
pip install --force-reinstall charset-normalizer

source deactivate /home/kmcquil/env/swot_normalq

```

- When setting up the .netrc, you must run this command afterwards
```
chmod og-rw .netrc

```


Ctrl+Shift+V switches to preview.

## Frequently used commands 
Log into the cluster
```
ssh kmcquil@tinkercliffs2.arc.vt.edu
```
Submit .sh script to download data (do this on login node). Might need to give permission. Ex. with LakeSP data:
```
# Look in the file to see the last date downloaded. Use that as the next start date 
nano download_lakesp_command.sh 
# First time this script is run, it needs permission
chmod +x download_lakesp_command.sh
# Run the script. Dates should be in format YYYY-MM-DDTHH:MM:SSZ
./download_lakesp_command.sh <start_date> <end_date>
```

Submit a script to run on compute nodes:
```
sbatch <script name> 
```

Check on script on queue:
```
squeue -u <username>
```

## Use ARC Open OnDemand to interactively work in a Jupyter Notebook

- ARC Open OnDemand allows you to request an interactive session and work in the familiar jupyter notebook format
- Request an interactive session from 'Jupyter Notebook -- Test conda env/module' with the following inputs:
    - Cluster: tinkercliffs
    - Container: Jupyter Data Science
    - Account: swot
    - Reservation: blank
    - Partition: normal_q
    - Number of hours: 1 (up to you)
    - Number of nodes: 1 (up to you)
    - Number of cores: 1 (up to you)
    - conda environment: /home/kmcquil/env/swot_normalq (path to your conda env)
    - default directory to start notebooks: /projects/swot/ (up to you)
    - python user base: ~/.local
    - Required module: anaconda3/2022.10
