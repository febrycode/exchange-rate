class ExchangeCodesController < ApplicationController
  def index
    exchange_codes = ExchangeCode.all

    render json: { exchange_codes: exchange_codes, error: false }, status: :ok
  end
end
