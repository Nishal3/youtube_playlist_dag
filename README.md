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

* Click the green "Code" dropdown and download the zip. Unzip the repo in a empty folder, and that's it!

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
### Running the Docker Containers
To start the docker containers, first run the initialization:
``` bash
docker compose up airflow-init
```  
Then you compose up all the containers by running:
``` bash
docker compose up
```
### Getting to the Webserver
Once the Docker containers are all up and running, we can access the Airflow webserver to start these DAGs.

* If you run this code on your local machine, go to the URL `localhost:8080`  

* If you downloaded this repository from a virtual machine, make sure you allow your IP or make public the port 8080 so you can access this. Then go to the URL `PUBLIC_IP:8080`
​  
​  

You should now see a screen like this:
![airflow_webserver_landing]

Username is 'airflow' and Password is also 'airflow'. After clicking 'Sign In', you should see the DAGs now.  
​  
The screen should look something like this:
![airflow_dags_page]  


### Starting the DAGs
There are two DAGs to choose from, one that loads all of the videos to the database at once and one that slowly populates the database with randomly selected videos.  

`load_all_vids` loads all, and `slow_populate` slowly populates

For whichever one you would like to run, click on the name, and unpause the DAG

Here are the visual steps:  
1. Click your chosen DAG:  
![airflow_click_dag]

2. Unpause DAG:
![airflow_unpause_dag]

## Viewing Data Flow to Database
To see the data coming in, go to your terminal and enter your postgres database container:
``` bash
docker exec -it <YOUR_FOLDER_NAME>-main_postgres_db-1 bash
# If my folder name is youtube_playlist_giver, the container name would be youtube_playlist_giver-main_postgres_db-1
```

You should now be in the docker container. The prompt should be different, it should now be `root@c9be136ef633:/#` or something similar before the input.  

To get the data, we need to get into the `playlist` database that's inside this container. To do this we can run:
``` bash
psql -U airflow playlists
```  

The prompt changes again and becomes `airflow=#` telling us we are now inside of the database. If we list the tables by running the command `\dt`, we will see the `songs` table.

To see if the database is populated or not, we can simply run the SQL command `SELECT * FROM songs;` and if we did everything correctly, there should be data in there.


## Resources Used:
* [ Docker SVG ][docker_ship]
* [ Network Logo ][network_logo]
* [ Airflow Icon ][airflow_icon]
* [ Database Icon ][database_icon]

<!-- HyperLinks -->
[docker_installation]: https://docs.docker.com/engine/install/ "Docker Installation"

<!-- Images Used -->
[data_pipeline_visual]: https://raw.githubusercontent.com/Nishal3/youtube_playlist_dag/assets/Youtube_Playlist_DAG.png "Final Pipeline Visual"

[airflow_webserver_landing]: https://raw.githubusercontent.com/Nishal3/youtube_playlist_dag/assets/Airflow_Webserver_Landing.png "Airflow Webserver Landing Page"

[airflow_dags_page]: https://raw.githubusercontent.com/Nishal3/youtube_playlist_dag/assets/Airflow_DAGs_Page.png "Airflow DAGs Page"

[airflow_click_dag]: https://raw.githubusercontent.com/Nishal3/youtube_playlist_dag/assets/Airflow_Click_DAG.png "Click DAG" 

[airflow_unpause_dag]: https://raw.githubusercontent.com/Nishal3/youtube_playlist_dag/assets/Airflow_Unpause_DAG.png "Unpause DAG"

<!-- Cited Works - Links -->

[docker_ship]: https://commons.wikimedia.org/wiki/File:Docker-svgrepo-com.svg "Docker Ship"

[network_logo]: https://iconscout.com/free-icon/network-363 "Network Logo"

[file_storage_icon]: https://iconscout.com/free-icon/file-box-3155207 "File Storage Icon"

[airflow_icon]: https://commons.wikimedia.org/wiki/File:AirflowLogo.png "Airflow Icon"

[database_icon]: https://iconduck.com/icons/21839/database# "Database Icon"