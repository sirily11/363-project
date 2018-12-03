import sys
import time
import logging
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler, LoggingEventHandler
import os
import subprocess
from selenium import webdriver


class jspHandler(FileSystemEventHandler):
    def __init__(self):
        self.changes = 0

    def reload(self):
        try:
            if self.changes > 4:
                subprocess.check_call("docker-compose restart jsp", shell=True)
                print("Hot reloading")
                self.changes = 0
            else:
                print(f"Detecting changes:{self.changes}.")
                self.changes += 1
        except Exception as e:
            print(f"Error:{e} \n Did u start the docker compose?")

    def on_moved(self, event):
        if ".jsp" in event.src_path:
            self.reload()

    def on_created(self, event):
        if ".jsp" in event.src_path:
            self.reload()

    def on_deleted(self, event):
        if ".jsp" in event.src_path:
            self.reload()

    def on_modified(self, event):
        if ".jsp" in event.src_path:
            self.reload()


def reload():
    subprocess.check_call("docker-compose restart jsp", shell=True)
    print("Hot reloading")


def main():
    # logging.basicConfig(level=logging.INFO,
    #                     format='%(asctime)s - %(message)s',
    #                     datefmt='%Y-%m-%d %H:%M:%S')
    # path = os.path.join(os.getcwd(), "jsp")
    # print(path)
    # if "363-project" not in path:
    #     Exception("Not in the project folder")

    # event_handler = jspHandler()
    # observer = Observer()
    # observer.schedule(event_handler, path, recursive=True)
    # observer.start()
    # while True:
    #     time.sleep(0.5)
    # observer.join()
    while True:
        input("Reload? ")
        reload()


if __name__ == "__main__":
    main()
