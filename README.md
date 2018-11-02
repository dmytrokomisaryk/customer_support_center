# Customer Support Center

### Introduction
3 Roles: Customer, Support employee, Admin

Customer:
- has an ability visits customer support page and fills in the form where he provides his name and email address along with the department the issue relates to, the subject of his inquiry and text of the request (he does not need to login to submit an inquiry).

Support employee:
- able to login management area using username and password.
- can view a list of all tickets.
- can search ticket by query: author, subject, message, reference.
- able to reply to the ticket by simply entering their response into a text field.

reference - generate by gem https://github.com/dmytrokomisaryk/reference

Admin:
- able to login to (/admin) page and manage support users(create, delete)

To check emails use link [https://mysterious-refuge-53354.herokuapp.com/letter_opener](https://mysterious-refuge-53354.herokuapp.com/letter_opener)

### Usage
Go to admin page, to create user(employee) [https://mysterious-refuge-53354.herokuapp.com/admin](https://mysterious-refuge-53354.herokuapp.com/admin) with credentials:
```
email: admin@example.com
password: password
```

With created employee you will be able to login to the `Staff area` [https://mysterious-refuge-53354.herokuapp.com/](https://mysterious-refuge-53354.herokuapp.com/).

### Setup on local environment

##### Should be installed: `docker` with `docker-compose`.

##### Clone the repo and then run few bash files:

```
$ cd customer_support_center
```

Build and up application:
```
$ ./start.sh
```

Go to: [http://localhost:3000/](http://localhost:3000/)

After, start.sh need to setup DB (only first time):
```
$ ./initialize.sh
```

Run the test suite to verify that everything is working correctly:

```
$ ./run_test.sh
```
