import mysql.connector

def store (trend):

    # Open database connection
    db = mysql.connector.connect(user='root', password='',
                              host='localhost',
                              database='trendack')

    # prepare a cursor object using cursor() method
    cursor = db.cursor()

    # Prepare SQL query to store records
    sql = "INSERT IGNORE INTO trends (trend) VALUES ('" + trend + "')"

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
