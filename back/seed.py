import requests
import json

# Define the base URL
base_url = "http://localhost:8080"


# Function to create a user
def create_user(messaging_address):
    headers = {"Content-Type": "application/json"}
    data = {"messaging_address": messaging_address}
    response = requests.post(f"{base_url}/users", headers=headers, json=data)
    if response.status_code != 201:
        raise Exception(f"Failed to create user {response.status_code}, {response.text}")
    response_data = response.json()
    user_id = response_data.get("id")
    return user_id


# Function to create a conversation
def create_conversation(recipient_phone):
    headers = {"Content-Type": "application/json"}
    data = {"recipient_messaging_address": recipient_phone}
    response = requests.post(f"{base_url}/conversations", headers=headers, json=data)
    if response.status_code != 201:
        raise Exception(f"Failed to create conversation {response.status_code}, {response.text}")
    response_data = response.json()
    conversation_id = response_data.get("id")
    return conversation_id


# Function to send a message
def send_message(sender_id, conversation_id, message):
    headers = {"Content-Type": "application/json"}
    data = {
            "sender_id": sender_id,
            "message": message,
            }

    response = requests.post(f"{base_url}/conversations/{conversation_id}/messages", headers=headers,
                             json=data)
    if response.status_code != 201:
        raise Exception(f"Failed to send message {response.status_code}, {response.text}")


# Function to retrieve messages
def get_messages(user_id, conversation_id):
    headers = {"Content-Type": "application/json"}
    response = requests.get(f"{base_url}/conversations/{conversation_id}/messages", headers=headers)
    messages = response.json()
    return messages


# Create a user
user1_id = create_user("1234567890")
print("created user", user1_id)

# Create a conversation
conv1_id = create_conversation("1234567890")
print("created conversation", conv1_id)

# Send messages in a loop
for i in range(1, 21):
    send_message(user1_id, conv1_id, str(i))

# Retrieve messages
messages = get_messages(user1_id, conv1_id)
print(messages)
