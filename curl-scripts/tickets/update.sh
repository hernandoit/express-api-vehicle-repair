#!/bin/bash

API="http://localhost:4741"
URL_PATH="/examples"

curl "${API}${URL_PATH}/${TICKET_ID}" \
  --include \
  --request PATCH \
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
