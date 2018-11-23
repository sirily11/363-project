import pandas
import mysql.connector
from tqdm import tqdm
from colored import fg, bg, attr, stylize
import os

try:
    cnx = mysql.connector.connect(user='root', password='somepassword',
                                  host='mysql')
    cnx.autocommit = False
    c = cnx.cursor()
    cwd = os.getcwd()
except Exception as e:
    print(
        stylize(f"Error: because {e}", fg(1)))


def create_database():
    print("%s==============Creating Database===================%s" %
          (fg(13), attr(0)))
    c.execute("DROP database if exists project ")
    c.execute("CREATE DATABASE if not exists project")
    cnx.database = "project"
    print("Created database")


def create_table_mentioned():
    c.execute("CREATE table IF NOT EXISTS mentioned(tid varchar(255), "
              "screen_name varchar(255),"
              "FOREIGN KEY (tid) references tweets(tid),"
              "FOREIGN KEY (screen_name) references user(screen_name))")
    print("Created table mentioned ")


def create_table_tagged():
    c.execute("CREATE table IF NOT EXISTS tagged("
              "tid varchar(255), "
              "hastagname varchar(255),"
              "foreign key (tid) references tweets(tid)"
              ")")
    print("Created table tagged ")


def create_table_tweets():
    c.execute("CREATE table IF NOT EXISTS tweets(tid varchar(255) primary key , "
              "textbody varchar(255),"
              "retweet_count integer,"
              "retweeted integer,"
              "posted timestamp,"
              "posting_user varchar(255))")
    print("Created table tweets ")


def create_table_urlused():
    c.execute("CREATE table IF NOT EXISTS urlused("
              "tid varchar(255), "
              "url varchar(2083),"
              "foreign key (tid) references tweets(tid))")
    print("Created table urlused ")


def create_table_user():
    c.execute("CREATE table IF NOT EXISTS user("
              "screen_name varchar(255) primary key,"
              "name varchar(255),"
              "sub_category varchar(255),"
              "category varchar(255),"
              "ofstate varchar(20),"
              "numFollowers integer,"
              "numFollowing integer )")
    print("Created table user ")


def create_tables():
    print("%s==============Creating Tables===================%s" %
          (fg(13), attr(0)))
    create_table_tweets()
    create_table_user()
    create_table_mentioned()
    create_table_tagged()
    create_table_urlused()


def insert_data():
    print("%s==============Inserting Data===================%s" %
          (fg(13), attr(0)))
    insert_user()
    insert_tweets()
    insert_tagged()
    insert_urlused()
    insert_mentioned()


def normalize_csv(filename):
    try:
        with open(filename, "r") as f:
            lines = f.readlines()
            lines = list(map(lambda x: x.replace(";", ","), lines))
            with open(filename, "w") as f2:
                f2.writelines(lines)
            print(stylize(f"Normalized csv {filename}", fg(11)))
    except Exception as e:
        print(stylize(f"Cannot open csv {filename}", fg(1)))


def normalize_value(value):
    if str(value) == "nan":
        return ""
    else:
        return value


def insert_mentioned():
    filename = os.path.join(cwd, "COMS363CProjectData/mentioned.csv")
    normalize_csv(filename)
    mentioned = pandas.read_csv(filename)
    tids = [i for i in mentioned["tid"]]
    screen_names = [i for i in mentioned["screen_name"]]

    success = True

    for i in tqdm(range(len(mentioned)), desc="mentioned table"):
        try:
            tid = tids[i]
            screen_name = screen_names[i]
            sql = "insert into mentioned (tid, screen_name) values (%s,%s)"
            value = (tid, screen_name)
            c.execute(sql, value)
        except Exception as e:
            print(
                stylize(f"Error happens at {i} because {e}", fg(1)))
            success = False
            break
    if success:
        cnx.commit()


def insert_tweets():
    filename = os.path.join(cwd, "COMS363CProjectData/tweets.csv")
    normalize_csv(filename)
    tweets = pandas.read_csv(filename)
    tid = [i for i in tweets["tid"]]
    textbody = [i for i in tweets["textbody"]]
    retweet_count = [i for i in tweets["retweet_count"]]
    retweeted = [i for i in tweets["retweeted"]]
    posted = [i for i in tweets["posted"]]
    posting_user = [i for i in tweets["posting_user"]]

    success = True

    for i in tqdm(range(len(tweets)), desc="tweets table"):
        try:
            sql = "insert into tweets (" \
                  "tid,textbody,retweet_count," \
                  "retweeted,posted,posting_user) " \
                  "values (%s,%s,%s,%s,%s,%s)"
            value = (tid[i], textbody[i],
                     retweet_count[i], retweeted[i],
                     posted[i], posting_user[i]
                     )

            c.execute(sql, value)
        except Exception as e:
            print(
                stylize(f"Error happens at {i} because {e}", fg(1)))
            success = False
            break

    if success:
        cnx.commit()


def insert_user():
    filename = os.path.join(cwd, "COMS363CProjectData/user.csv")
    normalize_csv(filename)
    user = pandas.read_csv(filename)
    screen_name = [normalize_value(i) for i in user["screen_name"]]
    name = [normalize_value(i) for i in user["name"]]
    sub_category = [normalize_value(i) for i in user["sub_category"]]
    category = [normalize_value(i) for i in user["category"]]
    ofstate = [normalize_value(i) for i in user["ofstate"]]
    numFollowers = [normalize_value(i) for i in user["numFollowers"]]
    numFollowing = [normalize_value(i) for i in user["numFollowing"]]

    success = True

    for i in tqdm(range(len(user)), desc="user table"):
        try:
            sql = "insert into user ( " \
                  "screen_name, " \
                  "name, sub_category, " \
                  "category, ofstate, " \
                  "numFollowers, numFollowing) " \
                  "values (%s,%s,%s,%s,%s,%s,%s)"

            value = (screen_name[i], name[i],
                     sub_category[i], category[i],
                     ofstate[i], numFollowers[i],
                     numFollowing[i])

            c.execute(sql, value)
        except Exception as e:
            print(
                stylize(f"Error happens at {i} because {e}", fg(1)))
            success = False
            break

    if success:
        cnx.commit()


def insert_tagged():
    filename = os.path.join(cwd, "COMS363CProjectData/tagged.csv")
    normalize_csv(filename)
    user = pandas.read_csv(filename)
    tid = [normalize_value(i) for i in user["tid"]]
    hastagname = [normalize_value(i) for i in user["hastagname"]]
    success = True

    for i in tqdm(range(len(user)), desc="tagged table"):
        try:
            sql = "insert into tagged (" \
                  "tid, hastagname) " \
                  "VALUES (%s,%s)"

            value = (tid[i], hastagname[i])

            c.execute(sql, value)
        except Exception as e:
            print(
                stylize(f"Error happens at {i} because {e}", fg(1)))
            success = False
            break
    if success:
        cnx.commit()


def insert_urlused():
    filename = os.path.join(cwd, "COMS363CProjectData/urlused.csv")
    normalize_csv(filename)
    user = pandas.read_csv(filename)
    tid = [normalize_value(i) for i in user["tid"]]
    url = [normalize_value(i) for i in user["url"]]
    success = True

    for i in tqdm(range(len(user)), desc="url table"):
        try:
            sql = "insert into urlused (" \
                  "tid, url) " \
                  "VALUES (%s,%s)"

            value = (tid[i], url[i])

            c.execute(sql, value)
        except Exception as e:
            print(
                stylize(f"Error happens at {i} because {e}", fg(1)))
            success = False
            break
    if success:
        cnx.commit()


if __name__ == '__main__':
    create_database()
    create_tables()
    insert_data()
    print("%s==============Finished===================%s" %
          (fg(13), attr(0)))
    input("Press any key to exit")
