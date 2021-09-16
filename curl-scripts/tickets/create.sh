#!/bin/bash

TOKEN="607771571c9d716bc8482298144b58e6"

JOB="Brakes"
LABOR=1
ISCOMPLETE=true
CAR_ID="61427b2ebfd78d56eb0a7c72"

API="http://localhost:4741"
URL_PATH="/tickets"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "ticket": {
      "job": "'"${JOB}"'",
      "labor": "'"${LABOR}"'",
      "isComplete": "'"${ISCOMPLETE}"'",
      "carId": "'"${CAR_ID}"'"      
    }
  }'

echo
