[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# express-api-vehicle-repair
This is the Express API (Server) to our vehicle repair app.  

This app will allow a user to add their `vehicle` and add a `ticket` for service repairs to be done.  This is a way for the user to keep track of what services have been done to their vehicle.

An explanation of the what the app does and how it works

## `Setup Steps`
1. Fork and clone this repository into your projects location 
   - `git clone git@github.com:<your github account name here>/react-material-design.git`
2. Create a new branch, and name it after your project. 
2. Checkout to your newly created branch.
   - `git checkout -b <your projects name here>`
4. Install dependencies with ```npm install```.

## `Important Links`
[Deployed Client](https://hernandoit.github.io/vehicle-repair-client/)

[Deployed Server](https://salty-river-98460.herokuapp.com/)

[Client Repo](https://github.com/hernandoit/vehicle-repair-client)

[Server Repo](https://github.com/hernandoit/express-api-vehicle-repair)


## `Tasks`

This project uses `npm` as a task runner. This is more
conventional for modern Express apps, and it's handy because we'll definitely
use `npm` anyway. These are the commands available:

| Command                | Effect                                                                                                      |
|------------------------|-------------------------------------------------------------------------------------------------------------|
| `npm run server`       | Starts a development server with `nodemon` that automatically refreshes when you change something.                                                                                         |
| `npm test`             | Runs automated tests.                                                                                       |
| `npm run debug-server` | Starts the server in debug mode, which will print lots of extra info about what's happening inside the app. |


## `API`

Use this as the basis for your own API documentation. Add a new third-level
heading for your custom entities, and follow the pattern provided for the
built-in user authentication documentation.

Scripts are included in [`curl-scripts`](curl-scripts) to test built-in actions.
Add your own scripts to test your custom API.

### `Authentication`

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/` | `users#changepw`  |
| DELETE | `/sign-out/`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl --include --request POST http://localhost:4741/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password",
      "password_confirmation": "an example password"
    }
  }'
```

```sh
curl-scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

#### POST /sign-in

Request:

```sh
curl --include --request POST http://localhost:4741/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'
```

```sh
curl-scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "33ad6372f795694b333ec5f329ebeaaa"
  }
}
```

#### PATCH /change-password/

Request:

```sh
curl --include --request PATCH http://localhost:4741/change-password/ \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "super sekrit"
    }
  }'
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa curl-scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/

Request:

```sh
curl --include --request DELETE http://localhost:4741/sign-out/ \
  --header "Authorization: Bearer $TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa curl-scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### `Car`

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| GET    | `/cars`             | `cars#index`    |
| GET    | `/cars/:id`         | `cars#show`  |
| POST   | `/cars`             | `cars#create`    |
| PATCH  | `/cars/:id`         | `carss#update`   |
| DELETE | `/cars/:id`         | `carss#delete`   |

#### GET /cars

Request:

```sh
TOKEN="0223c55679cb8c36340e9e7b9c996b94"

API="http://localhost:4741"
URL_PATH="/cars"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
```

```sh
curl-scripts/cars/index.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "car": {
    ...
  },
  "car": {
    ...
  },
  "car": {
    ...
  }
}
```

#### GET /cars/:id

Request:

```sh
ID="614372b5efe964c111986501"
TOKEN="0223c55679cb8c36340e9e7b9c996b94"

API="http://localhost:4741"
URL_PATH="/cars"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
```

```sh
curl-scripts/cars/show.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "car": {
    "_id":"614518dd2a202440057125e8",
    "year":2001,
    "make":"Nissan",
    "model":"GTR",
    "owner":"6142438f4420822e591d17c7",
    "tickets":[],
    "createdAt":"2021-09-17T22:38:21.914Z","updatedAt":"2021-09-17T22:38:21.914Z",
    "__v":0
  }
}
```

#### POST /cars

Request:

```sh
TOKEN="0223c55679cb8c36340e9e7b9c996b94"

YEAR=2001
MAKE="Nissan"
MODEL="GTR"

API="http://localhost:4741"
URL_PATH="/cars"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "car": {
      "year": "'"${YEAR}"'",
      "make": "'"${MAKE}"'",
      "model": "'"${MODEL}"'"
    }
  }'

echo
```

```sh
curl-scripts/cars/create.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "car": {
    "_id":"614518dd2a202440057125e8",
    "year":2001,
    "make":"Nissan",
    "model":"GTR",
    "owner":"6142438f4420822e591d17c7",
    "tickets":[],
    "createdAt":"2021-09-17T22:38:21.914Z","updatedAt":"2021-09-17T22:38:21.914Z",
    "__v":0
  }
}
```

#### PATCH /cars/:id

Request:

```sh
ID="614279cfbfd78d56eb0a7c71"
TOKEN="0223c55679cb8c36340e9e7b9c996b94"

YEAR=2021
MAKE="Dodge"
MODEL="Charger Hell Cat"

API="http://localhost:4741"
URL_PATH="/cars"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "car": {
      "year": "'"${YEAR}"'",
      "make": "'"${MAKE}"'",
      "model": "'"${MODEL}"'"
    }
  }'

echo
```

```sh
curl-scripts/cars/update.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /cars/:id

Request:

```sh
ID="614279cfbfd78d56eb0a7c71"
TOKEN="e40a45c252d07b1e2203c518fb2aa8d6"

API="http://localhost:4741"
URL_PATH="/cars"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo
```

```sh
curl-scripts/cars/destroy.sh
```

Response:

```md
HTTP/1.1 204 No Content
```


### `Tickets`

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| GET    | `/tickets/:carId/:ticketId`         | `tickets#show`      |
| POST   | `/tickets/:carId`                   | `tickets#create`    |
| PATCH  | `/tickets/:carId/:ticketId`         | `ticketss#update`   |
| DELETE | `/tickets/:carId/:ticketId`         | `ticketss#delete`   |

#### GET /tickets/:carId/:ticketId

Request:

```sh
CAR_ID="6143a0130253e0f8d3c75de7"
TICKET_ID="614387e10aeee4db33184d5"

TOKEN="9a6ae7d05e8088e610f6d9d0add4fefe"

API="http://localhost:4741"
URL_PATH="/tickets"

curl "${API}${URL_PATH}/${CAR_ID}/${TICKET_ID}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
```

```sh
curl-scripts/tickets/show.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
 "car": {
   "_id":"6143a0130253e0f8d3c75de7",
   "year":2001,
   "make":"Nissan",
   "model":"GTR",
   "owner":"6142438f4420822e591d17c7",
   "tickets":[{"isComplete":false,
              "_id":"6143b33d5f627e07ea4933e2",
              "job":"Brakes",
              "labor":2,
              "createdAt":"2021-09-16T21:12:29.515Z",
              "updatedAt":"2021-09-16T21:12:29.515Z"
              }]
      ,"createdAt":"2021-09-16T19:50:43.596Z",
      "updatedAt":"2021-09-16T21:12:29.515Z",
      "__v":1
    }
  }
```

#### POST /tickets/:carId

Request:

```sh
CAR_ID="6143a0130253e0f8d3c75de7"
TOKEN="9a6ae7d05e8088e610f6d9d0add4fefe"

JOB="Brakes"
LABOR=2
ISCOMPLETE=false

API="http://localhost:4741"
URL_PATH="/tickets"

curl "${API}${URL_PATH}/${CAR_ID}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "ticket": {
      "job": "'"${JOB}"'",
      "labor": "'"${LABOR}"'",
      "isComplete": "'"${ISCOMPLETE}"'"
    }
  }'

echo
```

```sh
curl-scripts/tickets/create.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{ 
  "ticket": {
    "_id":"6143a0130253e0f8d3c75de7",
    "year":2001,
    "make":"Nissan",
    "model":"GTR",
    "owner":"6142438f4420822e591d17c7",
    "tickets":[{
        "isComplete":false,
        "_id":"6143b33d5f627e07ea4933e2",
        "job":"Brakes",
        "labor":2,
        "createdAt":"2021-09-16T21:12:29.515Z",
        "updatedAt":"2021-09-16T21:12:29.515Z"
        },
        {"isComplete":true,
        "_id":"614534342a202440057125e9",
        "job":"Tune Up",
        "labor":4,
        "createdAt":"2021-09-18T00:35:00.749Z",
        "updatedAt":"2021-09-18T00:35:00.749Z"
        }],
    "createdAt":"2021-09-16T19:50:43.596Z",
    "updatedAt":"2021-09-18T00:35:00.749Z",
    "__v":2
    }
  }
```

#### PATCH /tickets/:carId/:ticketId

Request:

```sh
CAR_ID="61439d63ebb7d8ee8dd86422"
TICKET_ID="614387e10aeee4db33184d5"

TOKEN="9a6ae7d05e8088e610f6d9d0add4fefe"

JOB="OIL CHANGE"
LABOR="2"
ISCOMPLETE=true

API="http://localhost:4741"
URL_PATH="/tickets"

curl "${API}${URL_PATH}/${CAR_ID}/${TICKET_ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "ticket": {
      "job": "'"${JOB}"'",
      "labor": "'"${LABOR}"'",
      "isComplete": "'"${ISCOMPLETE}"'"
    }
  }'

echo
```

```sh
curl-scripts/tickets/update.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /tickets/:carId/:ticketId

Request:

```sh
TICKET_ID="61437ff6c262e7d0265a8e14"

TOKEN="799d43b03a1c29ca79ca529c00be7961"
CAR_ID="61437eeac262e7d0265a8e13"

API="http://localhost:4741"
URL_PATH="/tickets"

curl "${API}${URL_PATH}/${CAR_ID}/${TICKET_ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo
```

```sh
curl-scripts/tickets/destroy.sh
```

Response:

```md
HTTP/1.1 204 No Content
```
## `Planning Story`

#### `Auth Specifications`
 - Signup with email, password, and password confirmation.
 - Login with email and password.
 - Logout when logged in.
 - Change password with current and new password.
 - Signup and Signin must only be available to not signed in users.
 - Logout and Change password must only be available to signed in users.
 - Give feedback to the user after each action's success or failure.
 - All forms must clear after submit success and user sign-out
 - (Optional) Reset form to initial state on failure

#### `Client Specifications`
 - Use a front-end Javascript app to communicate with your API (both read and write) and render data that it receives in the browser.
 - Have semantically clean HTML and CSS
 - User must be able to create a new resource
 - User must be able to update a resource
 - User must be able to delete a resource
 - User must be able to view a single or multiple resource(s)
 - All resource actions that change data must only be available to a signed in user.
 - Give feedback to the user after each action's success or failure.
 - All forms must clear after submit success or failure
 - Protect against Cross-site Scripting

#### `API Specifications`
 - Use Express or Django to build an API.
 - Create at least 4 RESTful routes for handling GET, POST, PUT/PATCH, and DELETE requests for a resource other than User.
 - Have at least 1 resource that has a relationship to User
 - Any actions which change data must be authenticated and the data must be "owned" by the user performing the change or a user determined by an access control list

#### `User stories`
- As an unregistered user, I would like to sign up with email and password.
- As a registered user, I would like to sign in with email and password.
- As a signed in user, I would like to change password.
- As a signed in user, I would like to sign out.
- As a signed in user, I would like to add my vehicles information.
- As a signed in user, I would like to create a service ticket for my vehicle(s) 
based on the service(s) I choose.
- As a signed in user, I would like to see the service ticket(s) I have created.
- As a signed in user, I would like to update or delete my service ticket(s).
- As a signed in user, I would like to know if the service(s) have been complete.


#### `Technologies Used`
- GitHub
- Express
- Heroku
- MongoDB

#### `Unsolved Problems`
1. I would like to have clients be able to add more services to an invoice.
2. would like to add a parts schema.

## `Images`
## ERD
![ERD](https://i.imgur.com/YJj5bCe.png)