class Game < ApplicationRecord
  has_many :pieces
	after_create :populate_board!

	has_many :users	
	scope :available, -> {where(black_player_id: nil)}
  
	def is_occupied?(x, y)
		!piece_at(x, y).nil?
	end

  def piece_at(x, y)
    pieces.each do |piece|
      if piece.x_position == x && piece.y_position == y
        return piece 
      end
    end

    return nil
  end

	def populate_board!
		create_white_pieces
		create_black_pieces
		pieces.reload
	end

	def check?
		kings = pieces.where(type: 'King')
		kings.any?(&:can_be_taken?)

	end

	def pieces_for_color(color)
		pieces.where(color: color)
	end


	def set_pieces_user(color, user_id)

	end

	def create_piece(type, x_position, y_position, color, player_id = nil)
		type.create(
			x_position: x_position,
			y_position: y_position,
			color: color,
			player_id: player_id,
			game_id: id
			)
	end

	def create_white_pieces
		8.times do |i|
			create_piece(Pawn, i, 1, true, white_player_id)
		end

		create_piece(Rook,   0, 0, true, white_player_id)
		create_piece(Knight, 1, 0, true, white_player_id)
		create_piece(Bishop, 2, 0, true, white_player_id)
		create_piece(Queen,  3, 0, true, white_player_id)
		create_piece(King,   4, 0, true, white_player_id)
		create_piece(Bishop, 5, 0, true, white_player_id)
		create_piece(Knight, 6, 0, true, white_player_id)
		create_piece(Rook,   7, 0, true, white_player_id)
	end

	def create_black_pieces
		8.times do |i|
			create_piece(Pawn, i, 6, false, black_player_id)
		end

		create_piece(Rook,   0, 7, false, black_player_id)
		create_piece(Knight, 1, 7, false, black_player_id)
		create_piece(Bishop, 2, 7, false, black_player_id)
		create_piece(Queen,  3, 7, false, black_player_id)
		create_piece(King,   4, 7, false, black_player_id)
		create_piece(Bishop, 5, 7, false, black_player_id)
		create_piece(Knight, 6, 7, false, black_player_id)
		create_piece(Rook,   7, 7, false, black_player_id)
	end

	def on_board?
    Piece.on_board?(x_position, y_position)
  end

	def pieces_for(color)
    pieces.filter { |p| p.color == color && p.on_board? }
  end

	def turn_color
    return :white if white_turn?
    return :black if black_turn?
  end

	def stalemate?
    pieces_for(turn_color).all? { |p| p.valid_moves.empty? }
  end
end
