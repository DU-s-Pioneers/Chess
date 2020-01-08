class Pawn < Piece
	def valid_move?(to_x, to_y) 
		(valid_step_move?(to_x, to_y) ||
			valid_jump_move?(to_x, to_y) ||
			valid_capture_move?(to_x, to_y)) &&
			!is_obstructed?(x_dest, y_dest) &&
			piece_color !=game.piece_at(x, y)&.piece_color
	end

	def valid_step_move?(to_x, to_y)
		to_x == x_position &&
			to_y == y_position + direction &&
				!enemy_piece_at?(x_position, y_position + direction)
	end

	def valid_jump_move?(to_x, to_y)
		!moved? &&
			to_x == x_position &&
				to_y == y_position + 2 * direction &&
					!enemy_piece_at?(x_position, y_position + 2 * direction)
	end

	def valid_capture_move?(to_x, to_y)
		(x_position - to_x).abs == 1 &&
			to_y == y_position + direction &&
				capture_piece_at?(to_x, to_y)
	end

	def capture_piece_at?(to_x, to_y)
		enemy_piece_at?(to_x, to_y) || en_passant_capture?(to_x, to_y)
	end

	def en_passant_capture?(to_x, to_y)
		return false unless game.en_passant_pawn

		Pawn.find(game.en_passant_pawn).at_position?(to_x, to_y - direction)
	end

	def move_to!(to_x, to_y)
		jump_move = valid_jump_move?(to_x, to_y)
		Pawn.find(game.en_passant_pawn).capture! if en_passant_capture?(to_x, to_y)
		super(to_x, to_y)
		game.en_passant_pawn = id if jump_move
	end


	def direction
		white? ? -1 : 1
	end			




end