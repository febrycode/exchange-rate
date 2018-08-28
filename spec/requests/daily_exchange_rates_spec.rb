require 'rails_helper'

RSpec.describe 'Daily Exchange Rate API' do

  describe 'POST /daily_exchange_rates' do

    before do
      exchange_code = create(:exchange_code)
      params = {
          daily_exchange_rate:
            { exchange_code_id: exchange_code.code_from,
              code_to: exchange_code.code_to,
              date_input: '2018-07-01',
              rate_value: 0.75709
            }
        }

      post '/daily_exchange_rates', params: params
    end

    it 'creates a daily exchange rate' do
      expect(json["error"]).to be(false)
      expect(json["message"]).to eq("Data successfully created")
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end
end