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

		@piece = Piece.find(params[:id])
		to_x = params[:x_position].to_i
		to_y = params[:y_position].to_i


		@piece.update(x_position: to_x, y_position: to_y)

		# if @piece.player_id != current_user.id 
		# 	[:error] = "Invalid move. It's NOT your piece. Try another piece"
		# elsif @piece.color == "black" && @piece.game.turn.even? || @piece.color == "white" && @piece.game.turn.odd? 
		# 	#even=black && odd=white
		# 	[:error] = "It's NOT your turn Please wait." 
		# elsif @piece.move?(to_x, to_y) #trakcing turns
		# 	@piece.update_attributes(piece_params) #if the move is valid, update the attributes
		# 	game = @piece.game #game has turns, pieces don't
		# 	if game.turn == 1 #1 == white && 2 == black
		# 		game.turn = 2 #if it is 1's turn, change to 2
		# 		game.save #save the turn to database
		# 	else
		# 		game.turn = 1
		# 		game.save
		# 	end

		# 	redirect_to game_path(current_game)
			
		# else
		# 	[:error] = "Move is invalid. Try again."
		# end

	end

private

	def piece_params
		params.require(:piece). permit(:game_id, :player_id, :piece_type, :color, :x_position, :y_position)
	end

end

