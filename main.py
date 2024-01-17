# -*- coding: utf-8 -*-

import psycopg2
import smtplib
from email.message import EmailMessage
import creds

def connect_and_fetch():
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

        # assumption that there are 2 inspection levels
        for level in range(1, 3):
            # Open sql file and pass query to a variable
            with open(f'upcoming_lvl_{level}_inspection.sql') as sql_f:
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
    return 1


def email_me():
    # Aux variable
    smtpObj = None

    try:
        # Establish TLS connection with the Google server
        smtpObj = smtplib.SMTP('smtp.gmail.com', 587)  # creating an SMTP object
        smtpObj.ehlo()  # tell server that I am a SMTP client
        smtpObj.starttls()  # start tls
        smtpObj.ehlo()  # double-check
        smtpObj.login(creds.google_mail,
                    creds.google_pwd)  # log on the account

        # E-mail content
        msg_body = '''Hi,\nI'm enclosing a summary of the equipment units with the upcoming OO-1 and OO-2 inspections.\n \
        Best regards\n\n\
        E-mail automatically generated'''

        # Add attachments
        with open('List of equipment for level 1 inspection.txt', 'r') as oo_1, open('List of equipment for level 2 inspection.txt') as oo_2:
            oo_1_data = oo_1.read()
            oo_2_data = oo_2.read()

        # E-mail addressing
        msg = EmailMessage()
        msg['From'] = creds.google_mail
        msg['Subject'] = 'Upcoming OO-1 and OO-2'
        msg['TO'] = creds.google_mail
        msg.set_content(msg_body)
        msg.add_attachment(oo_1_data,
                        filename = 'List of equipment for level 1 inspection.txt')
        msg.add_attachment(oo_2_data,
                        filename = 'List of equipment for level 2 inspection.txt')

        # Send e-mail
        smtpObj.send_message(msg)
    
    except Exception as error:
        print(error)
    
    finally:
        # Close the connection
        smtpObj.quit()
    return 1
