Write a simple library that would map the following structure and would also be able to send the API request along with an Authorization header.

{
  properties: [
    {
      property_adress: "72 Central Park W",
      apartment_no:    "7",
      zip_code:        "8002",
      town:            "Zurich",
      country:         "Swiss",
      property_description: "fake description of the property",
      bedrooms_no:     "1",
      max_people:      "2",
      source_id:       "68123"
    }
  ]
}

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
