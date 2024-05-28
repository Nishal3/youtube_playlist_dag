# Youtube Playlist DAG

## Pipeline Visual
![data_pipeline_visual]

## Set-Up / Requirements

### Python
* Version: 3.2+
* PyTube library installed (`pip install pytube`)

### Docker
* [ Docker and Docker Compose installed ][docker_installation]

### Clone Repo to Your Machine of Choice and Set it up
* Make sure the machine you plan to use has at least 16GB of memory, or else things might get SLOW!

* Click the green "Code" dropdown and download the zip. Unzip the repo in an empty folder, and that's it!

* Create a `user_logged/` folder in the logs directory by running `mkdir logs/user_logged/`

* Create a `.env` file and add the line `AIRFLOW_UID=1000`

Docker compose handles the rest, so that's it for requirements!

## Usage
Start with `docker compose up airflow-init` for initializing the airflow client. Then run `docker-compose up` to run all of the containers.

Open the airflow webserver at your public IP address colon 8080, for example: `127.0.0.1:8080`. If you're using your machine, you can also do `localhost:8080`.

Start the DAG of choice by either triggering it or unpausing it. The data should now be loading/loaded into your PostgreSQL docker container. 

To get more information about the operation of this project, read on.

## Running the DAG with your Own Data
### Collecting Playlist Data
All we need to do is have a new data CSV file for this. To do so, choose a playlist of songs on YouTube you want to use for this. Make sure the playlist is either unlisted or public.  
​  
​Now set the environment variable for `playlist_link` to the link:
``` bash
# Example:
# export playlist_link=https://www.youtube.com/playlist?list=PL7gIQsd6srbb0o9JHmZqZqe0kIHa9NCFO
export playlist_link=<YOUR_LINK>
```
​  
​Now we can run the data fetcher. Be sure to be in the home project directory. You'll see what I mean in the code. 
``` bash
# Make sure you are inside the new directory you made
python data_collector/music_list_fetcher.py
```
Give this some time. It might take a few seconds to finish.  

## Running the DAG
### Running the Docker Containers
To start the docker containers, first run the initialization:
``` bash
docker compose up airflow-init
```  
After that finishes initializing, you compose up all the containers by running:
``` bash
docker compose up
```
### Getting to the Webserver
Once the Docker containers are up, we can access the Airflow webserver to start these DAGs.

* If you run this code on your local machine, go to the URL `localhost:8080`  

* If you downloaded this repository from a virtual machine, make sure you allow your IP or make port 8080 public so you can access this. Then go to the URL `<PUBLIC_IP>:8080`
​  
​  

You should now see a screen like this:
![airflow_webserver_landing]

The username and password are both 'airflow'. After clicking 'Sign In' you should see the DAGs.  
​  
The screen should look something like this:
![airflow_dags_page]  

### Starting the DAGs
There are two DAGs you can choose from: one that loads all of the videos to the database at once and one that slowly populates the database with randomly selected videos.  

`load_all_vids` loads all, and `slow_populate` slowly populates

For whichever one you want to run, click on the DAG, and unpause it.

Here are the visual steps:  
1. Click your chosen DAG:  
![airflow_click_dag]

2. Unpause DAG or Trigger it:
![airflow_unpause_dag]

## Viewing Data Flow to Database
To see the data coming in, go to your terminal and enter your Postgres database container:
``` bash
docker exec -it <YOUR_FOLDER_NAME>-main_postgres_db-1 bash
# If my folder name is youtube_playlist_giver, the container name would be youtube_playlist_giver-main_postgres_db-1
```

You should now be in the docker container. The prompt should be different, now being `root@c9be136ef633:/#` or something similar before the input.  

To get the data, we need to get into the `playlist` database that's inside this container. For this, we can run:
``` bash
psql -U airflow playlists
```  

The prompt changes again and becomes `airflow=#` indicating that we are now inside the database. If we list the tables running the command `\dt`, we will see our `songs` table.

To see if the database is populated, we can simply run the SQL command ```SELECT * FROM `songs`;``` and if we did everything correctly, there should be data in there.

## Backing up the Data
Backing up is not as bad. Like we did earlier, we need to get into the container that runs the database.
``` bash
docker exec -it <YOUR_FOLDER_NAME>-main_postgres_db-1 bash
```

Then we need to run the backup for the playlists database:
``` bash
pg_dump -U airflow playlists > docker-entrypoint-backupdb.d/backup.sql
```

The backed-up data is present in the file `data/init/backup.sql`

### Using Backup to Populate the Database
#### Option 1
Move the file `backup.sql` to the `init/` folder. This will make it so the `backup.sql` script is run on the databases start-up.

#### Option 2
Before starting the DAG, go into the docker container that houses the database, same as before:
``` bash
docker exec -it <YOUR_FILE_NAME>-main_postgres_db-1 bash
```

Then run the command that uses the backup in the docker container:
``` bash
psql -U airflow playlists < docker-entrypoint-backupdb.d/backup.sql
```

## Logging
I made my own logging system since I got frustrated reading the airflow logs. This makes error comprehension 10x faster.

If anything goes awry, check the `logs/user_logged/FILE` with the file being the DAG you're having errors with. If there is an error, chances are, it logged it and will show you exactly where the error happened.

Let's hope there are no errors, but you never know what'll happen!

## Closing
I hope this project can be handy! I know YouTube does not show what videos become unavailable, so using this might make finding those pesky videos easier. That was why I thought of this project.  

I have learned truckloads of information about docker, docker compose, and networking with docker containers with this project. Alongside getting more knowledge about airflow and hooks, I had fun and used this to store all the songs I have in my playlist.

The functionality of this project is not great, but it will make finding unavailable videos easier because this script only gets available videos. If the song is not in the database with all the songs fetched, it is an unavailable video.

Overall, learning while doing is the best way to learn! I learned and implemented so many cool things in this project that, looking back, I feel proud and happy that I went through this journey.

Thank you for taking the time to read this, and have a great day!

## Resources Used:
* [ Docker SVG ][docker_ship]
* [ Network Logo ][network_logo]
* [ Airflow Icon ][airflow_icon]
* [ Database Icon ][database_icon]

<!-- HyperLinks -->
[docker_installation]: https://docs.docker.com/engine/install/ "Docker Installation"

<!-- Images -->
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
