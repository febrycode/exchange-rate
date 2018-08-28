class DailyExchangeRatesController < ApplicationController

  def index
    if params[:date].present?
      ex_rates = DailyExchangeRate.where(date_input: params[:date])
    else
      ex_rates = DailyExchangeRate.all
    end

    render json: { ex_rates: ex_rates, error: false }, status: :ok
  end

  def create
    exchange_code = ExchangeCode.find_by(
      code_from: ex_rate_params["code_from"],
      code_to: ex_rate_params["code_to"]
    )

    exchange_rate = DailyExchangeRate.new(
      exchange_code_id: exchange_code.id,
      date_input: ex_rate_params["date_input"],
      rate_value: ex_rate_params["rate_value"]
    )

    if exchange_rate.save
      render json: { message: "Data successfully created", error: false }, status: :created
    else
      render json: { message: "Data failed", error: true }, status: :ok
    end
  end

  private

  def ex_rate_params
    params.permit(
      :code_from,
      :code_to,
      :date_input,
      :rate_value
    )
  end
end
