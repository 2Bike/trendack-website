import mysql.connector
import config

def store (trend):

    #GET the config attributes
    config.config()

    # Open database connection
    db = mysql.connector.connect(user=config.user, password=config.password,
                            host=config.host,
                            database=config.db)

    # prepare a cursor object using cursor() method
    cursor = db.cursor()

    # Prepare SQL query to store records
    sql = "INSERT IGNORE INTO trends (trend) VALUES ('" + trend + "')"

    try:
       # Execute the SQL command
       cursor.execute(sql)
       # Commit your changes in the database
       db.commit()
       
    except:
       # Rollback in case there is any error
       db.rollback()
       print "error"

    cursor.close()
    # disconnect from server
    db.close()
