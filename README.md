User Story:

As a System I am able to properly map, fetched proeperties request(1) into our internal interface (2): 

Build small lib which can do 2 simple things: 

1. Imagine that you have following input - it can be returned from one method "Fetcher.get_properties" ( it can be useful in your specs, sample of input you can find below under "Resources" )

First step is to have a logic which parse it and make a proper mapping of fields ( below under "Resources", you can see how expected structure looks like ).


2. Second step is to send to internal API, mapped structure 
url: www.example.com/api/v1/room [POST]
include into headers authentication token
["Authorization"] = "secret_token1989"

Make sure to follow OOP principles. 
Use automatic tests, you have mentioned you are using Rspec.
Use git, write explanatory commits messages, you can share solution on the private repository. 

---------------------------------------------------------------------------------------

Resources:
(1) Input: 
"{\"properties\":[{\"property_adress\":\"72 Central Park W\",\"apartment_no\":\"7\",\"zip_code\":\"8002\",\"town\":\"Zurich\",\"country\":\"Swiss\",\"property_description\":\"fake description of the property\",\"bedrooms_no\":\"1\",\"max_people\":\"2\",\"source_id\":\"68123\"}]}"


(2) Internal Interface: 
Structure which is acceptable by internal API  of 
{  
  room: {
    adress:  
    apartment_number:
    postal_code:
    city: city
    country:  
    description:   
    number_of_bedrooms: 
    max_guests:
    internal_id:
  }
 }