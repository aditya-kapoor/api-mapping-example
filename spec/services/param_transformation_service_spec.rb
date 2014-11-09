require 'spec_helper'

describe ParamTransformationService do
  let(:input) { { property_adress: "72 Central Park W",
                  apartment_no: 7,
                  zip_code: 8002,
                  town: "Zurich",
                  country: "Swiss",
                  property_description: "fake description of the property",
                  bedrooms_no: 1,
                  max_people: 2,
                  source_id: 68123
              } }

  describe 'Constants' do
    it { expect(ParamTransformationService::MAPPING.keys).to eq([:property_adress, 
      :apartment_no, :zip_code, :town, :country, 
      :property_description, :bedrooms_no, 
      :max_people, :source_id]) }
    it { expect(ParamTransformationService::MAPPING.values).to eq([:adress, 
      :apartment_number, :postal_code, :city, 
      :country, :description, :number_of_bedrooms, 
      :max_guests, :internal_id]) }
  end

  describe 'Class Methods' do
    describe '.transform' do
      context 'non mapped keys' do
        it { expect(ParamTransformationService.transform(input)).to have_key(:room) }
        it { expect(ParamTransformationService.transform({a: :b, b: :c})).to eq(room: {
            adress: nil,
            apartment_number: nil,
            postal_code: nil,
            city: nil,
            country: nil,
            description: nil,
            number_of_bedrooms: nil,
            max_guests: nil,
            internal_id: nil})
        }
      end

      context 'mapped keys' do
        it { expect(ParamTransformationService.transform(input)).to have_key(:room) }
        it { expect(ParamTransformationService.transform(input)).to eq({room: {
            adress: "72 Central Park W", 
            apartment_number: 7, 
            postal_code: 8002, 
            city: "Zurich", 
            country: "Swiss", 
            description: "fake description of the property", 
            number_of_bedrooms: 1, 
            max_guests: 2, 
            internal_id: 68123 
            }
          }) 
        }
      end
    end
  end
end