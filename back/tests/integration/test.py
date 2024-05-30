from api import create_workspace, login, create_user, create_conversation, send_message

emma_email= "emma@example.com"
workspace = '1717076668746'

emma_token = login(emma_email, workspace)
print("emma logged in")
print("emma token", emma_token)