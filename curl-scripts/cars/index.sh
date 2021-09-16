#!/bin/sh

TOKEN="607771571c9d716bc8482298144b58e6"

API="http://localhost:4741"
URL_PATH="/cars"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
