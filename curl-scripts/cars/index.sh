#!/bin/sh

TOKEN="e40a45c252d07b1e2203c518fb2aa8d6"

API="http://localhost:4741"
URL_PATH="/cars"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
