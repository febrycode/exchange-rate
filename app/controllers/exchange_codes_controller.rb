class ExchangeCodesController < ApplicationController
  def index
    exchange_codes = ExchangeCode.all

    render json: { exchange_codes: exchange_codes, error: false }, status: :ok
  end

  def create
    exchange_code = ExchangeCode.new(exchange_code_params)

    if exchange_code.save
      render json: { message: "Exchange Code successfully created", error: false }, status: :created
    else
      render json: { message: "Exchange Code failed", error: true }, status: :ok
    end
  end

  def destroy
    exchange_code = ExchangeCode.find(params[:id])
    exchange_code.destroy

    head :no_content
  end

  private

  def exchange_code_params
    params.require(:exchange_code).permit(:code_from, :code_to)
  end
end
