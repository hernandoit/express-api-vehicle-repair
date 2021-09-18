#!/bin/sh

ID="614372b5efe964c111986501"
TOKEN="0223c55679cb8c36340e9e7b9c996b94"

API="http://localhost:4741"
URL_PATH="/cars"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
