class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    Game.create(game_params)
    redirect_to root_path
  end

  def join
    game = Game.find(params[:id])
    return unless game.black_player_id.nil?
    game.update_attributes(black_player_id: current_user.id)
    redirect_to game
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
