from api import create_workspace, login, create_user, create_conversation, send_message

emma_email= "emma@example.com"
kitty_email = "kitty@example.com"
workspace = '1717076668746'



emma_token = login(emma_email, workspace)
print("emma logged in")
print("emma token", emma_token)
# kitty_id = create_user(emma_token, workspace, kitty_email, "external", "kitty forever", "+33688550315")
kitty_id = 4


#
# withKitty = create_conversation(emma_token, workspace, kitty_id)
# print("created conversation with kitty", withKitty)

kitty_token = login("kitty@example.com", workspace)
print("kitty token", kitty_token)