# import module
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
import pandas as pd

## read csv data
try:
    churn = pd.read_csv("churn.csv")
except:
    print("File not found")

churn.head(2)

# check and aggregate data
## churn.isnull().sum()

churn["totalminutes"] = churn["totaldayminutes"] + churn["totaleveminutes"] + churn["totalnightminutes"] + churn["totalintlminutes"]

churn["totalcalls"] = churn["totaldaycalls"] + churn["totalevecalls"] + churn["totalnightcalls"] + churn["totalintlcalls"]

churn["totalcharge"] = churn["totaldaycharge"] + churn["totalevecharge"] + churn["totalnightcharge"] + churn["totalintlcharge"]

churn = churn[["churn", "accountlength", "totalminutes", "totalcalls", "totalcharge"]]

# ML Workflow
## 4 steps: split > train > score > evaluate

y = churn["churn"]
X = churn[["accountlength", "totalminutes", "totalcalls", "totalcharge"]]

## 1. Split data
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.20, random_state=19
)

## 2. Train model
model = LogisticRegression()
model.fit(X_train, y_train)

## 3. Score
train_error = model.score(X_train, y_train)

## 4. Evaluate
test_error = model.score(X_test, y_test)

print(train_error, test_error)
