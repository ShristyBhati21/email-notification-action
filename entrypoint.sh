#!/bin/sh -l

sendemail -f "rathoredigpalsingh@gmail.com" \
          -t "rathoredigpalsingh@gmail.com" \
          -s "smtp.gmail.com:587" \
          -v -v \
          -o tls=yes \
          -u "Test" \
          -xu "bhati.shristy@gmail.com" \
          -xp "ilnhkebrjbfuawkh" \
          -m "this is the test text"