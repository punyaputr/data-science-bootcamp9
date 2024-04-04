# import module
from requests import get
from time import sleep
import pandas as pd

# create url and data structure
sw_url = "https://swapi.dev/api/people/"
starwars = []

## get data in url with for loop
for i in range(5):
  sw_index = i + 1
  new_sw_url = sw_url + str(sw_index)
  sw_resp = get(new_sw_url).json()
  # extract data
  sw_data = {
       "name": sw_resp["name"],
       "height": sw_resp["height"],
       "weight": sw_resp["mass"],
       "gender": sw_resp["gender"]  if resp["gender"] != "n/a" else "unknown",
       "homeworld": get(sw_resp["homeworld"]).json()["name"]
   }

  starwars.append(sw_data)

  sleep(1)

#load data into a DataFrame
starwars_df = pd.DataFrame(starwars)

print(starwars_df)

# download to csv
starwars_df.to_csv("starwars.csv")
