from time import time
from pytube import YouTube, Playlist, Channel
from concurrent.futures import ThreadPoolExecutor, as_completed

playlist_link = "https://youtube.com/playlist?list=PL7gIQsd6srbZorq6CmfZr_wTf_ONPantw&si=x5YU67UFmHbacC0M"
video_links = Playlist(playlist_link).video_urls
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
    print(task.result())


print(f"Time taken: {time() - start}")
# Output
with open("playlist_titles.txt", "w") as file:
    file.write("name\tchannel_id\tchannel_name\n")
    for i in video_titles:
        file.write(i + "\n")
