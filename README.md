# Youtube Playlist DAG

## Pipeline Visual
![data_pipeline_visual]

## Set-Up / Requirements

### Python
* Version: 3.2+
* PyTube library installed (`pip install pytube`)

### Docker
* [ Docker and Docker Compose installed ][docker_installation]

### Clone Repo to Your Machine of Choice
* Make sure the machine you plan to use has at least 16GB of memory or else things might get SLOW!

* Click the green "Code" dropdown and download the zip. Unzip the repo where yout want to store it, and that's it!

That's it for requirements! Everything else will be handled by our docker compose file.

## Usage
### Collecting Playlist Data
Choose a playlist of songs on YouTube you want to use for this. Make sure the playlist is either unlisted or public, this is very important.  
​  
​Now set the environment variable for `playlist_link` to the link:
``` bash
# Example:
# export playlist_link=https://www.youtube.com/playlist?list=PL7gIQsd6srbb0o9JHmZqZqe0kIHa9NCFO
export playlist_link=YOUR_LINK
```
​  
​Now we can run the data fetcher. Make sure you are in the main project directory, you'll see what I mean in the code. 
``` bash
# Make sure you are not inside the data_collector/ directory
python data_collector/music_list_fetcher.py
```
Give this some time, if your playlist is large this might take a few seconds to finish.  

## Running the DAG
### Running the Docker containers
To start the docker containers, first run the initialization:
``` bash
docker compose up airflow-init
```  
Then you compose up all the containers by running:
``` bash
docker compose up
```
### Starting the DAG of choice
There are two DAGs to choose from, one that loads all of the songs to the database at once and one that slowly populates the database with randomly selected songs.  
​  
Once the Docker containers are all up and running, we can access the Airflow webserver. 

## Resources Used:
* [ Docker SVG ][docker_ship]
* [ Network Logo ][network_logo]
* [ Airflow Icon ][airflow_icon]
* [ Database Icon ][database_icon]

<!-- HyperLinks -->
[docker_installation]: https://docs.docker.com/engine/install/ "Docker Installation"

<!-- Images Used -->
[data_pipeline_visual]: https://raw.githubusercontent.com/Nishal3/youtube_playlist_dag/assets/Youtube_Playlist_DAG.png "Final Pipeline Visual"

<!-- Cited Works - Links -->

[docker_ship]: https://commons.wikimedia.org/wiki/File:Docker-svgrepo-com.svg "Docker Ship"

[network_logo]: https://iconscout.com/free-icon/network-363 "Network Logo"

[file_storage_icon]: https://iconscout.com/free-icon/file-box-3155207 "File Storage Icon"

[airflow_icon]: https://commons.wikimedia.org/wiki/File:AirflowLogo.png "Airflow Icon"

[database_icon]: https://iconduck.com/icons/21839/database# "Database Icon"