#!/bin/bash

TOKEN="40eeabe0e9280d510dd41338d92f4f3b"

YEAR=2021
MAKE="Dodge"
MODEL="Charger"

API="http://localhost:4741"
URL_PATH="/cars"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "car": {
      "year": "'"${YEAR}"'",
      "make": "'"${MAKE}"'",
      "model": "'"${MODEL}"'"
    }
  }'

echo
