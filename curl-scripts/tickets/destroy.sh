#!/bin/bash

TICKET_ID="61437ff6c262e7d0265a8e14"

TOKEN="799d43b03a1c29ca79ca529c00be7961"
CAR_ID="61437eeac262e7d0265a8e13"

API="http://localhost:4741"
URL_PATH="/tickets"

curl "${API}${URL_PATH}/${CAR_ID}/${TICKET_ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo
