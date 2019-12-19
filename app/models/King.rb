class King < Piece
	def valid_move?(to_x, to_y) 
		(c_x - to_x).abs <= 1 && (c_y - to_y).abs <= 1
		#c_x = current x  
		#c_y = current y 
	end
end
