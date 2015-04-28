import config
import mysql.connector

def store(name, woeid):

    #GET the config attributes
    config.config()

    # Open database connection
    db = mysql.connector.connect(user=config.user, password=config.password,
                            host=config.host,
                            database=config.db)



    # prepare a cursor object using cursor() method
    cursor = db.cursor()

    ids = str(woeid)

    # Prepare SQL query to store records
    sql = "INSERT INTO `locations`(`woeid`, `name`) VALUES (" + ids + ", '" + name + "' ) "

    try:
       # Execute the SQL command
       cursor.execute(sql)
       # Commit your changes in the database
       db.commit()
       print "success"
    except:
       # Rollback in case there is any error
       db.rollback()
       print "error"

    cursor.close()
    # disconnect from server
    db.close()
