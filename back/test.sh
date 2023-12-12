#!/usr/bin/env sh

# show all commands with output
set -x

user1_id=$(curl -X POST http://localhost:8080/users \
-H "Content-Type: application/json" \
-d '{
  "phone": "1234567890"
}' 2>/dev/null | jq -r '.id')

echo $user1_id

curl -X POST http://localhost:8080/users \
-H "Content-Type: application/json" \
-d '{
  "phone": "0234567890"
}'


conv1_id=$(curl -X POST http://localhost:8080/users/$user1_id/conversations \
-H "Content-Type: application/json" \
-d '{
  "recipient_phone": "0234567890"
}' 2>/dev/null | jq -r '.id')

# do this in a loop

curl -X POST http://localhost:8080/users/$user1_id/conversations/$conv1_id/messages \
-H "Content-Type: application/json" \
-d '{
  "message": "1"
}'

for i in {1..20}; do
  curl -X POST http://localhost:8080/users/$user1_id/conversations/$conv1_id/messages \
  -H "Content-Type: application/json" \
  -d "{
    \"message\": \"$i\"
}"

done


curl http://localhost:8080/users/$user1_id/conversations/$conv1_id/messages \
  -H "Content-Type: application/json"
set +x
