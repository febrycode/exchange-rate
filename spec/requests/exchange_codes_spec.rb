require 'rails_helper'

RSpec.describe 'Exchange Code API', type: :request do

  describe 'GET /exchange_codes' do

    before do
      create_list(:exchange_code, 10)
      get '/exchange_codes'
    end

    it 'returns exchange codes' do
      expect(json).to_not be_empty
      expect(json["error"]).to be(false)
      expect(json["exchange_codes"].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end