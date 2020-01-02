class Rook < Piece
	def valid_move?(to_x, to_y) 
		if x_position == to_x
			to_y =! y_position
		elsif y_position == to_y
			to_x =! x_position
		end
	end
end
