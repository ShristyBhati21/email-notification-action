#!/bin/sh -l

USERNAME="bhati.shristy@gmail.com"
PASSWORD="abc"
SMTP_PORT=465
SMTP_SERVER="smtp.gmail.com"
message = """\
          Subject: GitHub Email Report
          This is your daily email report.
          """

context = ssl.create_default_context()
with smtplib.SMTP_SSL(smtp_server, port, context=context) as server:
    server.login(USERNAME,PASSWORD)
    server.sendmail(USERNAME,USERNAME,message)