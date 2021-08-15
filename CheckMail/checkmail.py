#!/usr/bin/python3

from verify_email import verify_email
import sys

with open(sys.argv[1]) as file:
    for line in file:
        email = line.rstrip('\n')
        verify = verify_email(email)
        if verify is True:
            print(email)
