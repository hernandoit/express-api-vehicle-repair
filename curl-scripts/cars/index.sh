#!/bin/sh

TOKEN="aaa6f3752d584a24e931b81616d5e64f"

API="http://localhost:4741"
URL_PATH="/cars"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
