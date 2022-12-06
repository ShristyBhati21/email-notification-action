#!/bin/sh -l

subject="mail subject"
body="Hello World"
from="bhati.shristy@gmail.com"
to="rathoredigpalsingh@gmail.com"
echo -e "Subject:${subject}\n${body}" | sendmail -f "${from}" -t "${to}"