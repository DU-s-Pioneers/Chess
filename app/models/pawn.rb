class Pawn < Piece
	def valid_move?(to_x, to_y) 
		if x_position != to_x
			return false
		end 
		
		if y_position == to_y #first_move
			(to_y - y_position).abs <= 2
		elsif to_y > y_position
			(to_y - y_position).abs ==1
		end
	end
end