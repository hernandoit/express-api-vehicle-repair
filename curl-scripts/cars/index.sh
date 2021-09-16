#!/bin/sh

TOKEN="9a6ae7d05e8088e610f6d9d0add4fefe"

API="http://localhost:4741"
URL_PATH="/cars"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
