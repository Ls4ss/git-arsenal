import sys
import urllib
import requests
import time
 
url = "https://breachdirectory.p.rapidapi.com/"

with open(sys.argv[1]) as file:
    for line in file:
        mail = line.rstrip('\n')
        s = urllib.parse.quote(mail)
        print(mail)

        querystring = {"func":"auto","term":"{}".format(s)}

        headers = {
            'x-rapidapi-key': "70478949d4mshece2c49bd2a3429p144b01jsn6606b927935e",
            'x-rapidapi-host': "breachdirectory.p.rapidapi.com"
            }

        response = requests.request("GET", url, headers=headers, params=querystring)

        print(response.text)
        time.sleep(1)

