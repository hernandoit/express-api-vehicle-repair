#!/bin/bash

TOKEN="607771571c9d716bc8482298144b58e6"

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
