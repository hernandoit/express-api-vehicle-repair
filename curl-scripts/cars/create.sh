#!/bin/bash

TOKEN="0223c55679cb8c36340e9e7b9c996b94"

YEAR=2001
MAKE="Nissan"
MODEL="GTR"

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
