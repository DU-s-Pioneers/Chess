class Pawn < Piece
	def valid_move?(x_dest, y_dest) 
		x_coord == x_dest
		if y_coord == y_dest #first_move
			(y_dest - y_coord).abs <= 2
		elsif y_dest > y_coord
			(y_dest - y_coord).abs ==1
		end
	end
end