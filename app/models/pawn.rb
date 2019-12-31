class Pawn < Piece
	def valid_move?(x_dest, y_dest) 
		x_position == x_dest
		if y_position == y_dest #first_move
			(y_dest - y_position).abs <= 2
		elsif y_dest > y_position
			(y_dest - y_position).abs ==1
		end
	end
end