
from api import create_workspace, login, create_user, create_conversation, send_message

emma_email, emma_password = "emma@example.com", "Emma forever1"
canine_id, emma_id = create_workspace("Dr. Emma", emma_email, emma_password, "Emma", "Admin")
print(f"created emma {emma_id} owning workspace {canine_id}")

emma_token = login(emma_email, canine_id)
print("emma logged in")
print("emma token", emma_token)

kitty_email = "kitty@example.com"
kitty_id = create_user(emma_token, canine_id, kitty_email, "external", "kitty forever")
print("kitty", kitty_id)

exit(1)
# Create a user
ava_email, ava_password = "ava@example.com", "ava forever"
ava_id = create_user(emma_token, canine_id, ava_email, "internal", ava_password)
print("created ava", ava_id)


whiskers_email = "whiskers@example.com"
whiskers_id = create_user(emma_token, canine_id, whiskers_email, "external", "whiskers forever")
print("created whiskers", whiskers_id)


# Login as ava
ava_token = login(canine_id, ava_email, ava_password)
print("ava logged in")

withKitty = create_conversation(ava_token, canine_id, kitty_id)
print("created conversation with kitty", withKitty)

withWhiskers = create_conversation(emma_token, canine_id, whiskers_id)
print("created conversation with whiskers", withWhiskers)

send_message(emma_token, canine_id, withKitty, "hello kitty, here emma")
print("to kitty: hello kitty, here emma")
send_message(ava_token, canine_id, withKitty, "hello kitty, here ava")
print("to kitty: hello kitty, here ava")