# 363 Project Set up

Requirements:

- Docker
- Docker compose
- Python(The requirement to install Docker compose)

> If you install Docker on Windows or Mac, docker compose will be installed with your docker.

## What's included?

The docker-compose will automatically start a jsp server and a local database server. Everything you need will be automatically created for you.

## Installation

### Step one

clone this repostory and then open a terminal in the project folder. If you on windows, first insider the folder, then shift + right click, open a power shell. If you on Mac OS, right click the project, select service, open a terminal.

### Step two

Linux/Mac OS

```
sudo docker-compose up jsp
sudo docker-compose up mysql
```
> If you need to import the data into the database, you can try to use sudo docker-compose run import_data. Remember run this command after the running the commands above.

Windows

```
docker-compose up jsp
docker-compose up mysql
```

### Step three

Open a web browser, then go to localhost:8080/webapp to see the helloworld page.

> If you on Mac OS, you need to go to 0.0.0.0:8080/webapp to see the helloworld page.

## How to modify?

> Update the page

Put everything under the jsp folder.

> Local database's data

Every data is under the sql/db-storage.
