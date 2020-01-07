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
		to_x = params[:x_position].to_i
		to_y = params[:y_position].to_i

		if @piece.player_id != current_user.id 
			[:error] = "Invalid move. It's NOT your piece. Try another piece"
		elsif @piece.color != @piece.game.turn.odd? 
			[:error] = "It's NOT your turn Please wait." #Add a game method to track the turns!
		elsif @piece.move?(to_x, to_y)
			render json: { success: true }
		else
			[:error] = "Move is invalid. Try again."

		# @piece.update_attributes(piece_params)
		# redirect_to game_path(current_game)
	end

private

	def piece_params
		params.require(:piece). permit(:game_id, :player_id, :piece_type, :color, :x_position, :y_position)
	end

end

