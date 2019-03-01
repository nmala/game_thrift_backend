class Api::V1::GamesController < ApplicationController
  before_action :find_game, only: [:update, :show, :destroy]

  def index
    @games = Game.all
    render json: @games, status: :ok
  end

  def update
    @game.update(game_params)
    if @game.save
      render json: @game, status: :ok
    else
      render json: {errors: @game.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def create
    @game = Game.create(game_params)
    render json: @game, status: :ok
  end

  def show
    render json: @game, status: :ok
  end

  def destroy
    @game.destroy
  end


  private

  def game_params
    params.require(:game).permit(:name, :seller_id, :price, :image, :console, :is_game)
  end

  def find_game
    @game = Game.find(params[:id])
  end

end
