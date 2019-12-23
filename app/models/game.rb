class Game < ApplicationRecord
  has_many :pieces

  def is_occupied?(x, y)
    pieces.each do |piece|
      if piece.x_coord == x && piece.y_coord == y
        return true 
      end
    end

    return false
  end
end

  after_create :populate_board!

	has_many :users
	has_many :pieces
	
	scope :available, -> {where(black_player_id: nil)}


	def populate_board!
		create_white_pieces
		create_black_pieces
		pieces.reload
	end

	def set_pieces_user(color, user_id)

	end

	def create_piece(type, x_position, y_position, player_id = nil)
		type.create(
			x_position: x_position,
			y_position: y_position,
			player_id: player_id,
			game_id: id
			)
	end

	def create_white_pieces
		8.times do |i|
			create_piece(Pawn, i, 1, white_player_id)
		end

		create_piece(Rook,   0, 0, white_player_id)
		create_piece(Knight, 1, 0, white_player_id)
		create_piece(Bishop, 2, 0, white_player_id)
		create_piece(Queen,  3, 0, white_player_id)
		create_piece(King,   4, 0, white_player_id)
		create_piece(Bishop, 5, 0, white_player_id)
		create_piece(Knight, 6, 0, white_player_id)
		create_piece(Rook,   7, 0, white_player_id)
	end

	def create_black_pieces
		8.times do |i|
			create_piece(Pawn, i, 6, black_player_id)
		end

		create_piece(Rook,   0, 7, black_player_id)
		create_piece(Knight, 1, 7, black_player_id)
		create_piece(Bishop, 2, 7, black_player_id)
		create_piece(Queen,  3, 7, black_player_id)
		create_piece(King,   4, 7, black_player_id)
		create_piece(Bishop, 5, 7, black_player_id)
		create_piece(Knight, 6, 7, black_player_id)
		create_piece(Rook,   7, 7, black_player_id)
	end
end
