class Api::V1::ExchangesController < ApplicationController
  before_action :find_exchange, only: [:show]

  def index
    @exchanges = Exchange.all
    render json: @exchanges, status: :ok
  end

  def create
    @exchange = exchange.create(exchange_params)
    render json: @exchange, status: :ok
  end

  def show
    render json: @exchange, status: :ok
  end

  private

  def exchange_params
    params.require(:exchange).permit(:buyer_id, :seller_id, :game_id)
  end

  def find_exchange
    @exchange = exchange.find(params[:id])
  end
end
