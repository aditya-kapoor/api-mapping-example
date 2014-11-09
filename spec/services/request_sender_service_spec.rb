require 'spec_helper'

describe RequestSenderService do
  let(:transformed_params) { 
    { 
      room: {
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
    } 
  }

  describe 'Constants' do
    it { expect(RequestSenderService::HOST_URL).to eq('http://localhost:9393') }
    it { expect(RequestSenderService::ENDPOINT).to eq('/api/v1/room') }
    it { expect(RequestSenderService::AUTH_SECRET).to eq('Aditya999') }
  end

  describe 'Class Methods' do
    describe '.deliver' do
      before { 
        stub_request(:post, "#{ RequestSenderService::HOST_URL }#{ RequestSenderService::ENDPOINT }")
        .with(
          body: URI::encode_www_form(transformed_params),
          headers: { 'Authorization' => RequestSenderService::AUTH_SECRET })
        .to_return(
          body: 'Hello World.'
        )
      }
      it { expect(RequestSenderService.deliver(transformed_params)).to be_a_kind_of(Net::HTTPOK) }
      it { expect(RequestSenderService.deliver(transformed_params).response.body).to eq 'Hello World.' }
    end
  end
end