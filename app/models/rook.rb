class Rook < Piece
	def valid_move?(x_dest, y_dest) 
		if x_position == x_dest
			y_dest =! y_position
		elsif y_coord == y_dest
			x_dest =! x_position
		end
	end
end
