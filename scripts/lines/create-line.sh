#!/bin/bash

TOKEN=BAhJIiUwYjRhZGY0NDA1MDY2MjVmNmM5YTBkZWIxMmVlZjM4OAY6BkVG--ad92f4b24de71e2593b4469c23f249cf43eb8c40

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/lines"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "line": {
      "text": "Hey whats up"
    }
  }'

echo
