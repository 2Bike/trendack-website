import tweepy
from tweepy.auth import OAuthHandler
import mysql.connector
import config

def store(names, woeid):

    #GET the config attributes
    config.config()

    #Twitter API Keys
    ckey = config.ckey
    csecret = config.csecret
    atoken = config.atoken
    asecret = config.asecret
    

    # Open database connection
    db = mysql.connector.connect(user=config.user, password=config.password,
                            host=config.host,
                            database=config.db)

    db2 = mysql.connector.connect(user=config.user, password=config.password,
                            host=config.host,
                            database=config.db)

    db3 = mysql.connector.connect(user=config.user, password=config.password,
                            host=config.host,
                            database=config.db)

    # prepare a cursor object using cursor() method
    cursor = db.cursor()
    mycursor = db2.cursor()
    ins_cursor = db3.cursor()

    auth = OAuthHandler(ckey, csecret)
    auth.set_access_token(atoken, asecret)

    api = tweepy.API(auth)

    woeid = str(woeid)
    

    sql = "SELECT * FROM trends WHERE trend='" + names[0] + "' OR trend='" + names[1] + "' OR trend='" + names[2] + "' OR trend='" + names[3] + "' OR trend='" + names[4] + "' OR trend='" + names[5] + "' OR trend='" + names[6] + "' OR trend='" + names[7] + "' OR trend='" + names[8] + "' OR trend='" + names[9] + "'" 
    cursor.execute(sql)

    row = cursor.fetchone()

    while row is not None:
	
	try:

	    my_id = str(row[0])
			
	    #Hit the request and get the results
	    sequel = "SELECT `latitude`,`longtitude` FROM locations WHERE woeid=" + str(woeid)
	    mycursor.execute(sequel)

	    place = mycursor.fetchone()

	    coord = "" + place[0] + "," + place[1] + ",150mi"
			
	    results = api.search(q = row[1], geocode = coord, result_type="recent", count=10 )
			
			

	    for result in results:

		sql2 = "INSERT INTO `tweets` (`trend_id`, `woeid`, `text`) VALUES ('" + my_id + "', '" + woeid + "','" + result.text + "')"
			
		try:
		    # Execute the SQL command
                    ins_cursor.execute(sql2)
		    # Commit your changes in the database
		    db3.commit()
		    print "success"
		except:
		    # Rollback in case there is any error
		    print "error"
	except:
		print "Error Occured"

        row = cursor.fetchone()
