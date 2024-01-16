# -*- coding: utf-8 -*-

import psycopg2
import creds

# Auxiliary variables
cur = None
conn = None

try:
    # Establish connection with the database
    conn = psycopg2.connect(
        host = creds.db_hostname,
        dbname = creds.db_name,
        user = creds.db_user,
        password = creds.db_pwd,
        port = creds.db_port)

    # Create cursor
    cur = conn.cursor()

    for level in range(1, 3):
        # Open sql file and pass query to a variable
        with open(f'upcoming_oo_{level}.sql') as sql_f:
            sql_query = sql_f.read()
        
        # Fetch data from database
        cur.execute(sql_query)
        db_data = cur.fetchall()

        # Save OO-1 data to file
        summary = f'List of equipment for level {level} inspection.txt'
        with open(summary, 'w') as summary_output:
            summary_output.write(f'Equipment\tExpiry date of level {level} inspection\n')
            for record in db_data:
                str_record = f"{record[0]}\t{record[1]}\n"
                summary_output.write(str_record)

except Exception as error:
    print(error)

finally:
    # Close everything
    cur.close()
    conn.close()
