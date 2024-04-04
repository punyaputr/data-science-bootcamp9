# import module
from requests import get
from time import sleep
import pandas as pd

# create url and data structure
rm_url = "https://rickandmortyapi.com/api/character/"
rm =[]

## get data in url with for loop
for i in range(10):
  rm_index = i + 1
  new_rm_url = rm_url + str(rm_index)
  rm_resp = get(new_rm_url).json()
  rm_data = {
      "name":  rm_resp["name"],
      "status": rm_resp["status"],
      "species": rm_resp["species"],
      "gender": rm_resp["gender"]
  }

  rm.append(rm_data)

  sleep(1)

#load data into a DataFrame
rm_df = pd.DataFrame(rm)

print(rm_df)

# download to csv
rm_df.to_csv("RickyandMorty.csv")
