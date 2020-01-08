class King < Piece
	def valid_move?(to_x, to_y) 
		(x_position - to_x).abs <= 1 && (y_position - to_y).abs <= 1
	end
end