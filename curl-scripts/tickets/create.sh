#!/bin/bash

CAR_ID="6143a0130253e0f8d3c75de7"
TOKEN="0223c55679cb8c36340e9e7b9c996b94"

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
