class Rook < Piece
	def valid_move?(x_dest, y_dest) 
		if x_coord == x_dest
			y_dest =! y_coord
		elsif y_coord == y_dest
			x_dest =! x_coord
		end
	end
end
