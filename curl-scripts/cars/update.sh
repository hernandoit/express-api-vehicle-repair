#!/bin/bash

ID="614279cfbfd78d56eb0a7c71"
TOKEN="0223c55679cb8c36340e9e7b9c996b94"

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
