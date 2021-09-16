#!/bin/bash

TOKEN="aaa6f3752d584a24e931b81616d5e64f"

JOB="Brakes"
LABOR=1
ISCOMPLETE=true
CAR_ID=""

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
