TravelPal - Project Brief
=============================

## Proposal
This is the final project for Web application and mobile development course 2014 Spring

Though traveling alone sounds good to some students, for most of us, it would be more interesting to travel with companions and share. Our idea is to develop a school-based platform(named FindBuddy) for students to find companions when traveling. Users need to create their profiles by providing their basic personal information, i.e colleges, majors and education level. In order to find a travel partner, the users should provide their preferences, like regions, interests and their demands on partners. Our platform will search the database to find matches and list them. Then users could choose to communicate privately or via our platform. Also users should be able to leave messages on our platform to find companions.

A similar website: http://www.solotraveller.com/


## API Definition

The TravelPal API provides the following JSON endpoints:

-   User Register

-   User Login

-   User Logout

-   Get Trips list by keyword

-   Get Trips list for certain user_id

-   Post a new trip

-   Get trip detail by ID

-   Change trip detail by ID

-   Delete trip by ID

-   Apply to join a trip

-   Retract application for joining a trip

-   Approve application for joining

-   Decline application for joining

-   Post message by Trip ID

The TravelPal API implements a REST-like interface.

###### Host

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Not ready for deployment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### User Register

Register a new user in the system.

###### path

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api/signup/ POST
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###### parameters

-   user : {email:string, password:string, password_confirmation:string, college:string, age:int, gender:boolean, major:string, name:string}

###### sample parameters

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"user": {"email": "yuany11i@gmail.com", "password": "1234", "password_confirmation":"1234", "college":"NYU", "age": 24, "gender": 0, "major" : "MSIS", "name" :"Yuanyi"}}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###### Sample Response

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "meta": {
        "status": 200,
        "msg": "OK"
    },
    "data": {
        "id":2,
        "token":"94ZcE8Otc1Ed_j_85rJ_mw"
    }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### User Login

User login to the system, it will return the token for user further request.

###### path

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api/signin/ POST
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###### parameters

-   session : {email:string, password:string}

###### sample parameters

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"session": {"email": "yuanyi@gmail.com", "password": "1234" } }
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###### Sample Response

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "meta": {
        "status": 200,
        "msg": "OK"
    },
    "data": {
        "id":2,
        "token":"94ZcE8Otc1Ed_j_85rJ_mw"
    }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


### User Logout

User logout the system, it will change the token stored in the system. However, please remove the token stored in cookies as well.

###### path

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api/signout/ DELETE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###### parameters

-   token

###### sample parameters

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"token":"p_SsuF2ig2abo25E6x8nCQ"}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


###### Sample Response

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "meta": {
        "status": 200,
        "msg": "OK"
    }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Get Trips list by keyword

Get the list of trips information by keyword the users specified. Only list the trips that has not been asscociated with this user

###### path

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api/trips/search POST
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###### parameters

-   keywords

-   token

###### sample parameters

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "keywords": {
        "destination": "Alaska"
    },
    "token":"DPLtSPHlqr5w5wLlQ3-17Q"
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###### Sample Response

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "data": [
        {
            "id": 1,
            "destination": "Earth",
            "start_date": "2014-04-29T04:09:52.422Z",
            "end_date": "2014-04-29T04:09:52.422Z",
            "fee": 200,
            "owner": {
                "id": 20,
                "name": "Yiran Mao",
                "email": "ym731@nyu.edu",
                "college": "NYU",
                "age": 26,
                "gender": true,
                "major": "MSCS"
            },
            "participants": [
                {
                    "user_id": 20,
                    "trip_id": 1,
                    "status": true,
                    "user": {
                        "id": 20,
                        "name": "Yiran Mao",
                        "email": "ym731@nyu.edu",
                        "college": "NYU",
                        "age": 26,
                        "gender": true,
                        "major": "MSCS"
                    }
                }
            ],
            "chats": [
                {
	                "content": "Hahaha, I want to play!!",
	                "created_at": "2014-05-07T14:10:35.564Z",
	                "user": {
	                    "id": 20,
	                    "name": "Yiran Mao",
	                    "email": "ym731@nyu.edu",
	                    "college": "NYU",
	                    "age": 26,
	                    "gender": true,
	                    "major": "MSCS"
	                }
	            }
	        ]
        },
        {
            "id": 2,
            "destination": "Isarel",
            "start_date": "2015-10-11T00:00:00.000Z",
            "end_date": "2015-10-31T00:00:00.000Z",
            "fee": 2000,
            "owner": {
                "id": 20,
                "name": "Yiran Mao",
                "email": "ym731@nyu.edu",
                "college": "NYU",
                "age": 26,
                "gender": true,
                "major": "MSCS"
            },
            "participants": [
                {
                    "user_id": 20,
                    "trip_id": 2,
                    "status": true,
                    "user": {
                        "id": 20,
                        "name": "Yiran Mao",
                        "email": "ym731@nyu.edu",
                        "college": "NYU",
                        "age": 26,
                        "gender": true,
                        "major": "MSCS"
                    }
                }
            ],
            "chats": [
	            {
	               "content": "Hahaha, I want to play!!",
	               "created_at": "2014-05-07T14:10:35.564Z",
	               "user": {
	                   "id": 20,
	                   "name": "Yiran Mao",
	                   "email": "ym731@nyu.edu",
	                   "college": "NYU",
	                   "age": 26,
	                   "gender": true,
	                   "major": "MSCS"
	                }
	            }
	        ]
	   }
    ],
    "meta": {
        "status": 200,
        "msg": "OK"
    }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Post a new trip

Create the trip information and also build the relationship between user and this trip. 

###### path

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/api/trips/ POST
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###### parameters

-   trip : {destination:string, start_date:datetime, end_date:datetime, fee:int} (All listed parameters are MANDATORY)

-   token

###### sample parameters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"trip":{ "destination":"Heaven", "start_date": "2014-04-29 04:09:52.422460", "end_date":"2014-04-29 04:09:52.422460", "fee":200 }, "token":"94ZcE8Otc1Ed_j_85rJ_mw" }
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Sample Response

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "meta": {
        "status": 200,
        "msg": "OK"
    }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Get trip detail by ID

Give the detail information about a single trip. 

###### path

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/api/trips/[trip_id] GET
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###### parameters

-   token

###### sample parameters

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"token":"94ZcE8Otc1Ed_j_85rJ_mw"}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Sample Response

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "data": {
        "id": 1,
        "destination": "Earth",
        "start_date": "2014-04-29T04:09:52.422Z",
        "end_date": "2014-04-29T04:09:52.422Z",
        "fee": 200,
        "owner": {
            "id": 20,
            "name": "Yiran Mao",
            "email": "ym731@nyu.edu",
            "college": "NYU",
            "age": 26,
            "gender": true,
            "major": "MSCS"
        },
        "participants": [
            {
                "user_id": 20,
                "trip_id": 1,
                "status": true,
                "user": {
                    "id": 20,
                    "name": "Yiran Mao",
                    "email": "ym731@nyu.edu",
                    "college": "NYU",
                    "age": 26,
                    "gender": true,
                    "major": "MSCS"
                }
            }
        ],
        "chats": [
            {
                "content": "Hahaha, I want to play!!",
                "created_at": "2014-05-07T14:10:35.564Z",
                "user": {
                    "id": 20,
                    "name": "Yiran Mao",
                    "email": "ym731@nyu.edu",
                    "college": "NYU",
                    "age": 26,
                    "gender": true,
                    "major": "MSCS"
                }
            }
        ]
    },
    "meta": {
        "status": 200,
        "msg": "OK"
    }
}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Change trip detail by ID

Edit the detail information about a single trip. 

###### path

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/api/trips/[trip_id] PUT
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###### parameters

-   trip : {destination:string, start_date:datetime, end_date:datetime, fee:int} (Ensure one parameters is updated)

-   token

###### sample parameters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"trip":{ "destination":"Earth", "fee":2000 }, "token":"94ZcE8Otc1Ed_j_85rJ_mw" }
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Sample Response

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "meta": {
        "status": 200,
        "msg": "OK"
    }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Delete trip by ID

Delete the detail information about a single trip.

### path

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/api/trips/[trip_id] DELETE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Parameters

-   token

###### sample parameters

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"token":"94ZcE8Otc1Ed_j_85rJ_mw"}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Sample Response

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "meta": {
        "status": 200,
        "msg": "OK"
    }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Get Trips list for certain user_id

Get the list of trips information that the user has either initiated or applied

###### path

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/api/users/[user_id]/trips GET
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###### parameters

-   token

###### sample parameters

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"token":"94ZcE8Otc1Ed_j_85rJ_mw"}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###### Sample Response

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "data": [
        {
            "id": 1,
            "destination": "Earth",
            "start_date": "2014-04-29T04:09:52.422Z",
            "end_date": "2014-04-29T04:09:52.422Z",
            "fee": 200,
            "owner": {
                "id": 20,
                "name": "Yiran Mao",
                "email": "ym731@nyu.edu",
                "college": "NYU",
                "age": 26,
                "gender": true,
                "major": "MSCS"
            },
            "participants": [
                {
                    "user_id": 20,
                    "trip_id": 1,
                    "status": true,
                    "user": {
                        "id": 20,
                        "name": "Yiran Mao",
                        "email": "ym731@nyu.edu",
                        "college": "NYU",
                        "age": 26,
                        "gender": true,
                        "major": "MSCS"
                    }
                }
            ],
            "chats": [
	            {
	                "content": "Hahaha, I want to play!!",
	                "created_at": "2014-05-07T14:10:35.564Z",
	                "user": {
	                    "id": 20,
	                    "name": "Yiran Mao",
	                    "email": "ym731@nyu.edu",
	                    "college": "NYU",
	                    "age": 26,
	                    "gender": true,
	                    "major": "MSCS"
	                }
	            }
	        ]
        },
        {
            "id": 2,
            "destination": "Isarel",
            "start_date": "2015-10-11T00:00:00.000Z",
            "end_date": "2015-10-31T00:00:00.000Z",
            "fee": 2000,
            "owner": {
                "id": 20,
                "name": "Yiran Mao",
                "email": "ym731@nyu.edu",
                "college": "NYU",
                "age": 26,
                "gender": true,
                "major": "MSCS"
            },
            "participants": [
                {
                    "user_id": 20,
                    "trip_id": 2,
                    "status": true,
                    "user": {
                        "id": 20,
                        "name": "Yiran Mao",
                        "email": "ym731@nyu.edu",
                        "college": "NYU",
                        "age": 26,
                        "gender": true,
                        "major": "MSCS"
                    }
                }
            ],
            "chats": [
	            {
	                "content": "Hahaha, I want to play!!",
	                "created_at": "2014-05-07T14:10:35.564Z",
	                "user": {
	                    "id": 20,
	                    "name": "Yiran Mao",
	                    "email": "ym731@nyu.edu",
	                    "college": "NYU",
	                    "age": 26,
	                    "gender": true,
	                    "major": "MSCS"
	                }
	            }
	        ]
        }
    ],
    "meta": {
        "status": 200,
        "msg": "OK"
    }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### Apply to join a trip

User apply to join a trip that interest him/her

### path

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/api/users/[user_id]/trips/[trip_id] PUT
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Parameters

-   token

###### sample parameters

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"token":"94ZcE8Otc1Ed_j_85rJ_mw"}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Sample Response

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "meta": {
        "status": 200,
        "msg": "OK"
    }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Retract application for joining a trip

User retract the application for joining a trip

### path

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/api/users/[user_id]/trips/[trip_id] DELETE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Parameters

-   token

###### sample parameters

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"token":"94ZcE8Otc1Ed_j_85rJ_mw"}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Sample Response

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "meta": {
        "status": 200,
        "msg": "OK"
    }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Approve application for joining
The owner of the trip approve the application for another user to join the trip

### path

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/api/trips/[trip_id]/users/[user_id]/ PUT
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Parameters

-   token

###### sample parameters

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"token":"94ZcE8Otc1Ed_j_85rJ_mw"}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Sample Response

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "meta": {
        "status": 200,
        "msg": "OK"
    }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Decline application for joining
The owner of the trip decline the application for another user to join the trip

### path

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/api/trips/[trip_id]/users/[user_id]/ DELETE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Parameters

-   token

###### sample parameters

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"token":"94ZcE8Otc1Ed_j_85rJ_mw"}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Sample Response

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "meta": {
        "status": 200,
        "msg": "OK"
    }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Post message by Trip ID
The owner of the trip approve the application for another user to join the trip

### path

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/api/trips/[trip_id]/chats POST
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Parameters

-   chats: {content:string}

-   token

###### sample parameters

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{"chats":{ "content":"Hi Xiaolu, your trip seems interesting, can you talk a little bit more about your plan?" }, "token":"94ZcE8Otc1Ed_j_85rJ_mw" }
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Sample Response

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
    "meta": {
        "status": 200,
        "msg": "OK"
    }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~