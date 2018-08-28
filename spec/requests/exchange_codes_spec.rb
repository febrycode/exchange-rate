require 'rails_helper'

RSpec.describe 'Exchange Code API', type: :request do

  describe 'GET /exchange_codes' do

    before do
      create_list(:exchange_code, 10)
      get '/exchange_codes'
    end

    it 'returns exchange codes' do
      expect(json).to_not be_empty
      expect(json.size).to eq(10)
    end
  end
end