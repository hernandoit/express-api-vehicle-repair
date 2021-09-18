#!/bin/sh

CAR_ID="6143a0130253e0f8d3c75de7"
TICKET_ID="614387e10aeee4db33184d5"

TOKEN="0223c55679cb8c36340e9e7b9c996b94"

API="http://localhost:4741"
URL_PATH="/tickets"

curl "${API}${URL_PATH}/${CAR_ID}/${TICKET_ID}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
