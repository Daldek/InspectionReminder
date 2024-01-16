# -*- coding: utf-8 -*-

import smtplib
from email.message import EmailMessage
import creds

msg_body = '''Hi,\nI'm enclosing a summary of the equipment units with the upcoming OO-1 and OO-2 inspections.\m \
Best regards\n\n\
E-mail automatically generated'''

with open('List of equipment for level 1 inspection.txt', 'r') as oo_1, open('List of equipment for level 2 inspection.txt') as oo_2:
    oo_1_data = oo_1.read()
    oo_2_data = oo_2.read()

msg = EmailMessage()
msg['From'] = creds.google_mail
msg['Subject'] = 'Upcoming OO-1 and OO-2'
msg['TO'] = creds.google_mail
msg.set_content(msg_body)
msg.add_attachment(oo_1_data,
                   filename = 'List of equipment for level 1 inspection.txt')
msg.add_attachment(oo_2_data,
                   filename = 'List of equipment for level 2 inspection.txt')

# Establish secured connection with Google server
smtpObj = smtplib.SMTP('smtp.gmail.com', 587)
smtpObj.ehlo()
smtpObj.starttls()
smtpObj.ehlo()
smtpObj.login(creds.google_mail,
              creds.google_pwd)
smtpObj.send_message(msg)
smtpObj.quit()
