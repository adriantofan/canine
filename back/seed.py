import requests
import json

# Define the base URL
base_url = "http://localhost:8080"


def create_workspace(name, owner_email, owner_password):
    headers = {"Content-Type": "application/json"}
    data = {
        "name": name,
        "messaging_address": owner_email,
        "password": owner_password
    }

    response = requests.post(f"{base_url}/workspaces", headers=headers, json=data)
    if response.status_code != 201:
        raise Exception(f"Failed to create workspace {response.status_code}, {response.text}")
    response_data = response.json()
    workspace_id = response_data.get("workspace").get("id")
    user_id = response_data.get("user").get("id")
    return workspace_id, user_id


def login(workspace_id, messaging_address, password):
    headers = {"Content-Type": "application/json"}
    data = {
        "username": messaging_address,
        "password": password,
        "workspace_id": workspace_id,
    }

    response = requests.post(f"{base_url}/login", headers=headers, json=data)
    if response.status_code != 200:
        raise Exception(f"Failed to login {response.status_code}, {response.text}")
    response_data = response.json()
    token = response_data.get("token")
    return token


# Function to create a user
def create_user(token, workspace_id, messaging_address, user_type, password):
    assert user_type in ["internal", "external"]

    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {token}",
    }
    data = {
        "messaging_address": messaging_address,
        "user_type": user_type,
        "password": password,
    }
    response = requests.post(f"{base_url}/{workspace_id}/users", headers=headers, json=data)
    if response.status_code != 201:
        raise Exception(f"Failed to create user {response.status_code}, {response.text}")
    response_data = response.json()
    user_id = response_data.get("id")
    return user_id


# Function to create a conversation
def create_conversation(token, workspace_id, recipient_phone):
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {token}",
    }
    data = {"recipient_messaging_address": recipient_phone}
    response = requests.post(f"{base_url}/{workspace_id}/conversations", headers=headers, json=data)
    if response.status_code != 201:
        raise Exception(f"Failed to create conversation {response.status_code}, {response.text}")
    response_data = response.json()
    conversation_id = response_data.get("id")
    return conversation_id


# Function to send a message
def send_message(token, workspace_id, conversation_id, message):
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {token}", }
    data = {
        "message": message,
    }

    response = requests.post(f"{base_url}/{workspace_id}/conversations/{conversation_id}/messages", headers=headers,
                             json=data)
    if response.status_code != 201:
        raise Exception(f"Failed to send message {response.status_code}, {response.text}")


# Function to retrieve messages
def get_messages(user_id, conversation_id):
    headers = {"Content-Type": "application/json"}
    response = requests.get(f"{base_url}/conversations/{conversation_id}/messages", headers=headers)
    messages = response.json()
    return messages


emma_email, emma_password = "emma@example.com", "emma forever"
canine_id, emma_id = create_workspace("canine", emma_email, emma_password)
print(f"created emma {emma_id} owning workspace {canine_id}")

emma_token = login(canine_id, emma_email, emma_password)
print("emma logged in")

# Create a user
ava_email, ava_password = "ava@example.com", "ava forever"
ava_id = create_user(emma_token, canine_id, ava_email, "internal", ava_password)
print("created ava", ava_id)

kitty_email = "kitty@example.com"
kitty_id = create_user(emma_token, canine_id, kitty_email, "external", "kitty forever")
print("created ava", kitty_id)

whiskers_email = "whiskers@example.com"
whiskers_id = create_user(emma_token, canine_id, whiskers_email, "external", "whiskers forever")
print("created whiskers", whiskers_id)

# Login as ava
ava_token = login(canine_id, ava_email, ava_password)
print("ava logged in")

withKitty = create_conversation(ava_token, canine_id, kitty_email)
print("created conversation with kitty", withKitty)

withWhiskers = create_conversation(emma_token, canine_id, whiskers_email)
print("created conversation with whiskers", withWhiskers)

send_message(emma_token, canine_id, withKitty, "hello kitty, here emma")
print("to kitty: hello kitty, here emma")
send_message(ava_token, canine_id, withKitty, "hello kitty, here ava")
print("to kitty: hello kitty, here ava")
