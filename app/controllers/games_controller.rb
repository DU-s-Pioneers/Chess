class GamesController < ApplicationController
  helper_method :current_game

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.create(game_params.merge(white_player_id: current_user.id)) 
    redirect_to root_path
  end

  def show
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    render "show"
    #head :no_content
  end

  def join
    game = Game.find(params[:id])
    return unless game.black_player_id.nil?
    game.update_attributes(black_player_id: current_user.id)
    redirect_to game_path(game)
  end

  def destroy
    redirect_to root_path
  end

  def turn
  end

  private

  helper_method :current_game
  def current_game
    @current_game ||= Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name)
  end

end
