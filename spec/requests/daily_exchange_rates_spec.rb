require 'rails_helper'

RSpec.describe 'Daily Exchange Rate API' do

  describe 'GET /daily_exchange_rates' do

    context 'when contains params date input' do

      before do
        exchange_codes = create_list(:exchange_code, 2)
        params_1 = { exchange_code_id: exchange_codes.first.id,
                date_input: '2018-07-01',
                rate_value: 0.75709
              }
        DailyExchangeRate.create(params_1)

        params_2 = { exchange_code_id: exchange_codes.second.id,
                date_input: '2018-07-01',
                rate_value: 0.75809
              }
        DailyExchangeRate.create(params_2)

        get '/daily_exchange_rates', params: { date: "2018-07-01" }
      end

      it 'returns exchange rate' do
        expect(json).to_not be_empty
        expect(json["error"]).to be(false)
        expect(json["ex_rates"].size).to eq(2)
      end
    end
  end

  describe 'POST /daily_exchange_rates' do

    before do
      exchange_code = create(:exchange_code)
      params = { code_from: exchange_code.code_from,
                code_to: exchange_code.code_to,
                date_input: '2018-07-01',
                rate_value: 0.75709
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