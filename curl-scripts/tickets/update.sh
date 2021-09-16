#!/bin/bash

CAR_ID="61439d63ebb7d8ee8dd86422"
TICKET_ID="614387e10aeee4db33184d5"

TOKEN="9a6ae7d05e8088e610f6d9d0add4fefe"

JOB="OIL CHANGE"
LABOR="2"
ISCOMPLETE=true

API="http://localhost:4741"
URL_PATH="/tickets"

curl "${API}${URL_PATH}/${CAR_ID}/${TICKET_ID}" \
  --include \
  --request PATCH \
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
