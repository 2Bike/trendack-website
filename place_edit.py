import csv
import tweepy
from tweepy.auth import OAuthHandler
from time import time, sleep
import store_places

#Twitter API Keys

ckey = 'aL2farMDkmgVNwPyqd4rOrfya'
csecret = '3DrS33hv732PA1cinlkQaSZddduah4ZclHEv7wf31x9l31qa8h'
atoken = '2601808146-wCNJuIhAKNN6A6dkvFdLzxXXw2BfLvBvVHSMtrs'
asecret = 'VlbjVDzCHzEfwsnBU5clvxeXVu0UEFXL1z80j57yfPZkP'

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

            
