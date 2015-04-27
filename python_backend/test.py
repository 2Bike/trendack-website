import mysql.connector
import config

config.config()

# Open database connection
db = mysql.connector.connect(user=config.user, password=config.password,
                            host=config.host,
                            database=config.db)


# prepare a cursor object using cursor() method
cursor = db.cursor()

#Hit the request and get the results
sequel = "SELECT `latitude`,`longtitude` FROM locations WHERE woeid=21125" 
cursor.execute(sequel)

place = cursor.fetchone()

print place
