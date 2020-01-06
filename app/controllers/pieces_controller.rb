class PiecesController < ApplicationController
	before_action :authenticate_user!, only: [:update, :show]


	def index
		@pieces = Piece.all
	end


	def create
		@pieces = current_game.pieces.create(piece_params)
	end


	def show
		@piece = @game.pieces.find(params[:id])

	end

	
	def update
		@piece = @game.pieces.find(params[:id])
		@piece.update_attributes(piece_params)
		redirect_to game_path(current_game)
	end

private

	def piece_params
		params.require(:piece). permit(:game_id, :player_id, :piece_type, :color, :x_position, :y_position)
	end

end

