import requests

from login import interactive_login

# Define the base URL
base_url = "http://localhost:8080/api/v1"


def create_workspace(name, owner_email, owner_password, first, last):
    headers = {"Content-Type": "application/json"}
    data = {
        "name": name,
        "email": owner_email,
        "password": owner_password,
        "first_name": first,
        "last_name": last,
    }

    response = requests.post(f"{base_url}/workspaces", headers=headers, json=data)
    if response.status_code != 201:
        raise Exception(f"Failed to create workspace {response.status_code}, {response.text}")
    response_data = response.json()
    workspace_id = response_data.get("workspace").get("id")
    user_id = response_data.get("user").get("id")
    return workspace_id, user_id


def login(email, workspace, use_cache=True):
    print(f'Please login to {email} to {workspace} continue')
    # try to read the token from file
    token_file_name = f'.token.{email}.{workspace}.txt'
    if use_cache:
        try:
            with open(token_file_name, "r") as file:
                token = file.read()
                return token
        except FileNotFoundError:
            pass

    token = interactive_login()
    with open(token_file_name, "w") as file:
        file.write(token)
    return token


# Function to create a user
def create_user(token, workspace_id, email, user_type, phone=None):
    assert user_type in ["internal", "external"]

    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {token}",
    }
    data = {
        "email": email,
        "user_type": user_type,
        "phone": phone or "",
    }
    response = requests.post(f"{base_url}/{workspace_id}/users", headers=headers, json=data)
    if response.status_code != 201:
        raise Exception(f"Failed to create user {response.status_code}, {data} {response.text}")
    response_data = response.json()
    user_id = response_data.get("id")
    return user_id


# Function to create a conversation
def create_conversation(token, workspace_id, recipient_id:int):
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {token}",
    }
    data = {"user_id": recipient_id}
    response = requests.post(f"{base_url}/{workspace_id}/conversations", headers=headers, json=data)
    if response.status_code != 201:
        raise Exception(f"Failed to create conversation {response.status_code}, {data} {response.text}")
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
