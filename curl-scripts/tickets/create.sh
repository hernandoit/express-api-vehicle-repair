#!/bin/bash

CAR_ID="6143a0130253e0f8d3c75de7"
TOKEN="9a6ae7d05e8088e610f6d9d0add4fefe"

JOB="Brakes"
LABOR=2
ISCOMPLETE=false

API="http://localhost:4741"
URL_PATH="/tickets"

curl "${API}${URL_PATH}/${CAR_ID}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "ticket": {
      "job": "'"${JOB}"'",
      "labor": "'"${LABOR}"'",
      "isComplete": "'"${ISCOMPLETE}"'"
    }
  }'

echo
