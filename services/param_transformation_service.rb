class ParamTransformationService
  MAPPING = {
    property_adress: :adress,
    apartment_no: :apartment_number,
    zip_code: :postal_code,
    town: :city,
    country: :country,
    property_description: :description,
    bedrooms_no: :number_of_bedrooms,
    max_people: :max_guests,
    source_id: :internal_id
  }

  def self.transform(incoming_hash)
    hash          = Hash.new { |hash, key| hash[key] = {} }
    outgoing_hash = hash[:room]
    MAPPING.keys.each do |key|
      outgoing_hash[MAPPING[key]] = incoming_hash[key]
    end
    hash
  end
end