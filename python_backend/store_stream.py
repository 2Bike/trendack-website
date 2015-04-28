import mysql.connector
import config

def store(names, woeid):

    #GET the config attributes
    config.config()

    # Open database connection
    db = mysql.connector.connect(user=config.user, password=config.password,
                            host=config.host,
                            database=config.db)


    # prepare a cursor object using cursor() method
    cursor = db.cursor()
    
    woeid = str(woeid)
    
    sql = "SELECT id FROM trends WHERE trend='" + names[0] + "' OR trend='" + names[1] + "' OR trend='" + names[2] + "' OR trend='" + names[3] + "' OR trend='" + names[4] + "' OR trend='" + names[5] + "' OR trend='" + names[6] + "' OR trend='" + names[7] + "' OR trend='" + names[8] + "' OR trend='" + names[9] + "'" 
    cursor.execute(sql)
    row = cursor.fetchall()
    

    # Prepare SQL query to store records
    sql = "INSERT INTO `stream`(`trend_1`, `trend_2`, `trend_3`, `trend_4`, `trend_5`, `trend_6`, `trend_7`, `trend_8`, `trend_9`, `trend_10`, `woeid`) "
    sql2 = "VALUES (" + str(row[0][0]) + ", " + str(row[1][0]) + ", " + str(row[2][0]) + ", " + str(row[3][0]) + ", " + str(row[4][0]) + ", " + str(row[5][0]) + ", " + str(row[6][0]) + ", " + str(row[7][0]) + ", " + str(row[8][0]) + ", " + str(row[9][0]) + ", " + woeid + " ) "

    sql = sql + sql2

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
