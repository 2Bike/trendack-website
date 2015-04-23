import tweepy
from tweepy.auth import OAuthHandler
import mysql.connector


#Twitter API Keys

ckey = 'aL2farMDkmgVNwPyqd4rOrfya'
csecret = '3DrS33hv732PA1cinlkQaSZddduah4ZclHEv7wf31x9l31qa8h'
atoken = '2601808146-wCNJuIhAKNN6A6dkvFdLzxXXw2BfLvBvVHSMtrs'
asecret = 'VlbjVDzCHzEfwsnBU5clvxeXVu0UEFXL1z80j57yfPZkP'

# Open database connection
db = mysql.connector.connect(user='root', password='',
                            host='localhost',
                            database='trendack')

# prepare a cursor object using cursor() method
cursor = db.cursor()

auth = OAuthHandler(ckey, csecret)
auth.set_access_token(atoken, asecret)

api = tweepy.API(auth)

sql = "SELECT woeid FROM locations"

try:
    # Execute the SQL command
    cursor.execute(sql)
    row = cursor.fetchone()

    while row is not None:

        public_trends = api.trends_place(row[0]) 

        data = public_trends[0]

        trends = data['trends']

        names = [trend['name'] for trend in trends]

        
        
        row = cursor.fetchone()
except:
    # Rollback in case there is any error
    db.rollback()
    print "error"

cursor.close()
