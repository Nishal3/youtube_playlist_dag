from time import time
from pytube import YouTube, Playlist, Channel
from concurrent.futures import ThreadPoolExecutor, as_completed
import os
import sys

PLAYLIST_LINK = str(os.getenv("playlist_link"))
if not PLAYLIST_LINK:
    print("Error: Please enter a valid link")
    sys.exit(1)

video_links = Playlist(PLAYLIST_LINK).video_urls
if not video_links:
    print(
        "Error: Playlist link is either invalid or private, please re-run with a valid link or make the proper adjustments"
    )
    sys.exit(1)
start = time()


def get_channel_name(channel_id):
    channel_url = f"https://www.youtube.com/channel/{channel_id}"
    c = Channel(channel_url)

    channel_name = c.channel_name.replace("'", "''")
    return channel_name


def get_video_title(link):
    title = YouTube(link).title.replace("'", "''")
    channel_id = YouTube(link).channel_id
    return title + "\t" + channel_id + "\t" + get_channel_name(channel_id)


processes = []
with ThreadPoolExecutor(max_workers=10) as executor:
    for url in video_links:
        processes.append(executor.submit(get_video_title, url))

video_titles = []
for task in as_completed(processes):
    video_titles.append(task.result())


print(f"Time taken: {round(time() - start, 2)} seconds")
# Output
with open("data/playlist_titles.csv", "w") as file:
    file.write("name\tchannel_id\tchannel_name\n")
    for i in video_titles:
        file.write(i + "\n")
