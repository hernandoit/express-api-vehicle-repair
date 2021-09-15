#!/bin/bash

ID="614279cfbfd78d56eb0a7c71"
TOKEN="e40a45c252d07b1e2203c518fb2aa8d6"

YEAR=2021
MAKE="Dodge"
MODEL="Charger Hell Cat"

API="http://localhost:4741"
URL_PATH="/cars"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
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
