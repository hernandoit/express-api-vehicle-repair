#!/bin/bash

API="http://localhost:4741"
URL_PATH="/tickets"

curl "${API}${URL_PATH}/${TICKET_ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"
  --data '{
    "ticket": {
      "carId": "'"${CAR_ID}"'",      
    }
  }'

echo
