import tweepy
from tweepy.auth import OAuthHandler
import mysql.connector
import store_trend
import store_stream
import store_tweets
from time import time, sleep
import config
import warnings

warnings.filterwarnings('ignore')


#Twitter API Keys
config.config()

ckey = config.ckey
csecret = config.csecret
atoken = config.atoken
asecret = config.asecret

# Open database connection
db = mysql.connector.connect(user=config.user, password=config.password,
                            host=config.host,
                            database=config.db)

# prepare a cursor object using cursor() method
cursor = db.cursor()

auth = OAuthHandler(ckey, csecret)
auth.set_access_token(atoken, asecret)

api = tweepy.API(auth)

sql = "SELECT woeid FROM locations"

# Execute the SQL command
cursor.execute(sql)
row = cursor.fetchone()
while row is not None:

    print row

    public_trends = api.trends_place(row[0])
        
    data = public_trends[0]

    trends = data['trends']

    names = [trend['name'] for trend in trends]
        
    for name in names:

        print name
            
        try:
                
            store_trend.store (name)

        except:
            print "error2"


    store_stream.store(names, row[0])
    store_tweets.store(names, row[0])
    
    row = cursor.fetchone()
    sleep(90)
            

