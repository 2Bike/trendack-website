import csv
import tweepy
from tweepy.auth import OAuthHandler
from time import time, sleep
import store_places
import config


#Twitter API Keys
config.config()

ckey = config.ckey
csecret = config.csecret
atoken = config.atoken
asecret = config.asecret

auth = OAuthHandler(ckey, csecret)
auth.set_access_token(atoken, asecret)

#Connect to Twitter Api

api = tweepy.API(auth)

#open the .csv file and read the coordinates
with open ('Capitals.csv', 'r') as f:   
    reader = csv.reader(f)

    #read a row and store it to the db
    for row in reader:

        row = ", ".join(row)
        data = row.split(";")

        # From the coord get the woeid of the place
        
        woeid = api.trends_closest(data[1], data[2])
        woeid = woeid[0]

        print data[0]
        print woeid['woeid']
        
        #Call the function to store data
        store_places.store (data[0], woeid['woeid'])


        # Interval seconds to hit the twitter api (Max 15 hits in 15 minutes)
        sleep(90)

            
