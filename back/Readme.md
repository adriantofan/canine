A backend of a messaging app that allows clients to send and receive text messages in private 1:1 chats:
- Clients identified by with a phone number (without authentication)
- Clients send messages to other clients via their phone numbers
- Clients list  their chats
- Clients efficiently list all messages in a chat

## Assumptions:
- read write ration 1:1 (according to industry literature)
- 2 Mil DAU
- users send in average 50 messages a day 
- 1000 sent messages per second


## Non-functional requirement highlights:
- highly available
- durable message storage
- efficient message delivery
- efficient offline/online synchronization


## High level design

- clients use a RESTfull API to connect to stateful backend API servers that handle message sending & synchronization, 
  user and conversation management, login etc
- load balancer/ api gateway distributes HTTP requests to API servers (also handles things such as rate limiting etc)
- messages and conversations are stored in a relational database (PostgreSQL)


## High level API design

1. `POST /users` to create a new user using phone number
2. `POST /users/{user_id}/conversations` to create a new conversation between the user having `user_id` and another 
    already registered recipient. Both user can create the same conversation concurrently, only one is created and returned 
    to both.
3. `POST /users/{user_id}/conversations/{conversation_id}/messages` to send a message from `user_id` in the conversion
4. `GET /users/{user_id}/conversations/{conversation_id}/messages` to receive a paginated list of messages. It is possible 
    to supply a `last_id` and a sorting parameter to facilitate synchronization as follows:
   - if the conversation is not completely downloaded to the client, the user would want to
     download backwards messages sorted reversed chronologically starting with `last_id`
   - when the user wants to new un-synchronized messages starting `last_id` and sorted chronologically
The pagination metadata is lacking atm, as such the client must make multiple paginated requests up to dataset exhaustion.

## Database design:

Given the assumed 1:1 write ratio, hot/cold storage and dataset size, a distributed key value store would probably scale better. 
Nevertheless, a relational database such as Postgres can also do the job. The design is as follows, with some details omitted:

```SQL
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
	  phone VARCHAR(15) NOT NULL UNIQUE,
    created_at TIMESTAMP
);

CREATE TABLE conversations(
    id SERIAL PRIMARY KEY,
    user1_id INTEGER NOT NULL,
    user2_id INTEGER NOT NULL,
    created_at TIMESTAMP
);

CREATE TABLE messages(
    id SERIAL PRIMARY KEY,
    conversation_id INTEGER NOT NULL,
    sender_id INTEGER NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP
);
```

Two party chat support in `conversations` are by design to simplify prototype implementation. Multiple party conversation 
would require a slightly different approach.  For the prototype message ids are 32 bit which is obviously not enough.

## New message delivery

At the moment new message delivery must be done by making multiple requests. This is obviously incomplete. 

To make it work even suboptimally it would probably require a better mean to synchronize multiple conversation in a 
single http request.

A better way to move forward, is for the clients to connect to stateful websocket servers that deliver new messages 
to them. This design requires a queuing component that would allow API clients to enqueue new messages to a per 
recipient inbox. The inbox would be consumed in parallel :
- a consumer that writes the message to database (avoid distributed transactions that must reliably enqueue message and 
  write to database). Probably also requires a different way of handling of message ids who need to be generated before 
  being written to database.
- to either send websocket messages or deliver offline notifications (SMS, push etc.) The online/offline delivery should 
  be mutually exclusive. 

To make this work correctly requires a rather sophisticated approach to guarantee notification delivery and durable 
enqueuing (messages are now saved to db in a consumer). Moreover, for clients to connect to websocket servers, either 
a websocket capable load balancer is required or a web socket server service discovery component queried with the restfull API.

### idempotent message send
Two main options exist that requires the client to supply a unique idempotency key, server checks if it has already 
processed a message with that key:
1. idempotency key is a UUID, server stores the key in messages table with a unique constraint
2. idempotency key is a UUID, server stores the key redis with ttl

Options 2 requires less storage as keys eventually expire, but requires a redis instance while idempotency is limited 
to the key expiration time (extra complexity on the client)

## Code

With respect to the code, some general remarks:
- there are a few scattered constants, which should be moved centrally to a config file
- errors conditions are only communicated via http status codes, no json error messages
- deletion is not implemented or clearly defined
- migrations are really simple, just a few create table statements. The bare minimal to get started, that are run at startup
- could drop some foreign key constraints for better speed, as it might be so that data is not actually deleted from 
  the database, but only marked as deleted. The constraints at create time would be implemented by the application logic.
- timeouts for db ops are not implemented
- get conversation messages pagination lacks metadata
- get conversation messages returns ids, which is not very user friendly - needs more thought, also `conversation_id` is 
  probably not necessary on each message
- tests - there are a few unit tests and integration tests for database, obviously not enough. Dependency injection is 
  used to facilitate testing.
- with respect to API handlers, at the moment there is no consideration to separating domain logic from http handling 
  logic. This is a design decision that should be made based on the complexity of the domain logic.  


## Thoughts about scaling:
### Chat database
From start the database should be run in a highly available leader/follower configuration. The application connects to 
the leader. The leader replicates writes synchronously to the follower. If the leader fails, the follower replica is 
promoted leader and a new follower is created from backup.

Normally, read throughput can be increased by adding read only followers that process writes asynchronously. 
The approach would require designing workarounds around synchronization lag.

In theory, a partitioning scheme by conversation id could be used for messages table  with multiple databases, while 
different conversations for the same user might end up on different partitions which adds a new layer of complexity.

### ids 
Autoincrementing ids are not scalable in a distributed system. It would be better to
generate ids on the fly. They could be monotonically increasing, for each conversation in principle. Nevertheless, 
it is possible to use something like a Snowflake id generator, which is a distributed id generator.
Using UUIDs would be an alternative, but they are not sortable, which is a requirement for the current API.



## How to run

There is a docker-compose supplied that starts a postgres database and the application. In `test.sh` there are a few
curl commands that can be used to test the API. 
The following command starts the api server assuming postgres is running on localhost:5432 with chat database created.
```python
go run cmd/chat/main.go api -addr "localhost:8080" -dsn "postgres://postgres:postgres@localhost:5432/chat?sslmode=disable"
```