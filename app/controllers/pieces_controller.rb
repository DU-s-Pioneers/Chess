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

		errors = []

		@piece.update(x_position: to_x, y_position: to_y)

		if @piece.player_id != current_user.id 
			errors << "Invalid move. It's NOT your piece. Try another piece"
		elsif @piece.white? == false && @piece.game.turn.even? || @piece.white? == true && @piece.game.turn.odd? 
			#even=black && odd=white
			errors << "It's NOT your turn Please wait." 
		elsif @piece.move?(to_x, to_y) #trakcing turns
			@piece.update_attributes(piece_params) #if the move is valid, update the attributes
			game = @piece.game #game has turns, pieces don't
			if game.turn == 1 #1 == white && 2 == black
				game.turn = 2 #if it is 1's turn, change to 2
				game.save #save the turn to database
			else
				game.turn = 1
				game.save
			end

			redirect_to game_path(current_game)
			
		else
			errors << "Move is invalid. Try again."
		end

	end

	def castle_queen
    @piece = Piece.find(params[:rookid])
    @piece.castle_queenside!
    render :json => {}
  end

  def castle_king
    @piece = Piece.find(params[:rookid])
    @piece.castle_kingside!
    render :json => {}
  end

private

	def piece_params
		params.require(:piece). permit(:game_id, :player_id, :piece_type, :white?, :x_position, :y_position)
	end

end

