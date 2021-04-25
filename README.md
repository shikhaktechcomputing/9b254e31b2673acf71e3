# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Setup Project

1- 
git clone https://github.com/shikhaktechcomputing/9b254e31b2673acf71e3.git

2- select project directory
3- ruby version: 2.6.5 (use rvm command 'rvm use 2.6.5')
4- bundle install
5- rails s
6- open on browser (http://localhost:3000/)

Api Document:

1- open on browser (http://localhost:3000/apipie)
	Username: admin
	Password: password
2- check api document.	



* Call Api from postman:

	I have attached postman screenshot for the api in public folder, with name test_data.png
	
	Method: POST

	Url: http://localhost:3000/api/robot/0/orders

	Request body:

	{
		"input": "PLACE 0,0,NORTH\\nMOVE\\nREPORT"
	}

	Response:

	{
	  "status": 200,
	  "data": {
	      "attachments": "0,1,NORTH"
	  },
	  "message": "Success"
	}

* ...
