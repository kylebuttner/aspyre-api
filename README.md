# Aspyre API
This project is the backend portion of the [Aspyre Chrome extension](https://github.com/kylebuttner/aspyre). It is a RESTful API built using the rails-api gem. A live version is hosted [ here](http://goalbuster-api.herokuapp.com/) (requires user authentication).

## Endpoints
### Users
#### POST /auth
Creates a new user. Requires email, password, and password_confirmation params. A verification email will be sent to the email address provided.
#### PUT /auth
Account updates. This route will update an existing user's account settings. The default accepted params are password and password_confirmation.
#### DELETE /auth
Account deletion. This route will destroy users identified by their uid and auth_token headers.
### Sessions
#### POST /auth/sign_in
Starts a new user session. Requires email and password as params. This route will return a JSON representation of the User model on successful login along with the access-token and client in the header of the response.
#### DELETE /auth/sign_out
Ends the user's current session. Will invalidate the user's authentication token. Requires uid, client, and access-token in the request headers.
### Goals
#### GET /goals
Returns a list of all current user goals (requires uid to be passed).
#### GET /goals/:id
Returns individual current user goal (requires uid to be passed).
#### POST /goals
Creates a new user goal.
#### PUT /goals/:id
#### DELETE /goals/:id
### Tasks
#### GET /tasks
#### GET /tasks/:id
#### POST /tasks
#### PUT /tasks/:id
#### DELETE /tasks/:id

## Installation

Clone the repo and install dependencies
```
git clone https://github.com/kylebuttner/aspyre-api.git
cd aspyre-api
bundle install
```

You will also need to create a development and testing database with PostgreSQL. If you don't have Postgres, use [Homebrew](http://brew.sh/) to run `brew install postgresql`. Then, from the command line, use psql to create the following databases:
```
$ psql

psql (9.5.1)
Type "help" for help.

kylebuttner=# create database goals-api_development;
CREATE DATABASE
kylebuttner=# create database goals-api_test;
CREATE DATABASE
```

## Testing
This app was built with RSpec. To run the test suite, simply type `rspec` into the command line from the root directory.

## Contributors
[Caspar Fischer-Zernin](https://github.com/ccfz)<br>
[Claudia Green](https://github.com/claudiagreen)<br>
[Han Fakira](https://github.com/hanfak)<br>
[Kyle Buttner](https://github.com/kylebuttner)
