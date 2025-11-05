---
layout: default1
nav: dsml-ml
title: ML1 - DSML
is_slide: 0
---

# Two Sigma Connect: Rental Listing Inquiries
Kaggle Competition
[(link)](https://www.kaggle.com/c/two-sigma-connect-rental-listing-inquiries)

Create Kaggle account

Join competition

# Get Data

## Mount gdrive
```
from google.colab import drive
drive.mount('/content/drive')
```

## Import / Config
```
import pandas as pd
import os

kaggle_dir = f"/content/drive/My Drive/kaggle"
competition = "two-sigma-connect-rental-listing-inquiries"
target_dir = f"{kaggle_dir}/rent-two-sigma"

!mkdir -p  "{kaggle_dir}"

os.environ['KAGGLE_CONFIG_DIR'] = kaggle_dir
```

## Data Preparation 
- only done once

- Open Kaggle API doc [(link)](https://www.kaggle.com/docs/api)
- Goto section authentication
- Create kaggle.json
- Upload kaggle.json to kaggle directory on your gdrive



```
!kaggle competitions download -c "{competition}"
!unzip {competition}.zip -d "{target_dir}"
!unzip "{target_dir}/train.json.zip" -d "{target_dir}"

df = pd.read_json(f"{target_dir}/train.json")
df.to_parquet(f"{target_dir}/rent.parquet")

df = df[(df.price>1_000) & (df.price<10_000)]
df = df[(df.longitude!=0) | (df.latitude!=0)]
df = df[(df['latitude']>40.55) & (df['latitude']<40.94) &
        (df['longitude']>-74.1) & (df['longitude']<-73.67)]
df_num = df[['bedrooms','bathrooms','latitude','longitude','price']]
df_num.to_parquet(f"{target_dir}/rent-ideal.parquet")

!rm "{target_dir}/images_sample.zip"
!rm "{target_dir}/Kaggle-renthop.torrent"
!rm "{target_dir}/sample_submission.csv.zip"
!rm "{target_dir}/test.json.zip"
!rm "{target_dir}/train.json"
!rm "{target_dir}/train.json.zip"
```
- Remove runtime
- Save notebook
- Close notebook

# Training a random forest model
- Create a new Notebook

## Install
```
!pip install -q rfpimp
```


## Mount gdrive
```
from google.colab import drive
drive.mount('/content/drive')
```

## Import / Config
```
import numpy as np
import pandas as pd
```
## Load Data
```
rent = pd.read_parquet(f"{target_dir}/rent-ideal.parquet")
rent.sample(5)
```
## Hands-On
Link to ML book at explained.ai [(link)](https://mlbook.explained.ai/first-taste.html#sec:3.2.2)



# Exploring and Denoising Your Data Set
Link to ML book at explained.ai [(link)](https://mlbook.explained.ai/prep.html)
```
df = pd.read_parquet(f"{target_dir}/rent.parquet")
df
```

# Categorically Speaking
Link to ML book at explained.ai [(link)](https://mlbook.explained.ai/catvars.html)
```
df = pd.read_parquet(f"{target_dir}/rent.parquet")
df
```
