class King < Piece
	def valid_move?(to_x, to_y) 
		(x_position - to_x).abs <= 1 && (y_position - to_y).abs <= 1
	end

  def can_castle?
    if self.piece_color == "white"
  
      white_king = Piece.where(type: "King", game_id: game_id, piece_color: "white").first
      return white_king.has_moved != true && 
      white_king.is_obstructed?(self.coordinate_x, self.coordinate_y) == false && 
      self.has_moved != true
    elsif self.piece_color == "black"
      black_king = Piece.where(type: "King", game_id: game_id, piece_color: "black").first
      return black_king.has_moved != true && black_king.is_obstructed?(self.coordinate_x, self.coordinate_y) == false && self.has_moved != true
    else
      return false
    end
  end

    
  def castle_queenside!
    if can_castle?
      if self.piece_color == "white"
        # move rook queenside
        self.update_attributes(x_position: 3, y_position: 7)
        # move king
        white_king = Piece.where(type: "King", game_id: game_id, x_position: 4, y_position: 7, has_moved: false).first
        white_king.update_attributes(x_position: 2, y_position: 7)
      else
        # move rook queenside
        self.update_attributes(x_position: 3, y_position: 0)
        # move king
        black_king = Piece.where(type: "King", game_id: game_id, x_position: 4, y_position: 0, has_moved: false).first
        black_king.update_attributes(x_position: 2, y_position: 0)
      end
    end
  end
        
  def castle_kingside!
    if can_castle?
      if self.piece_color == "white"
        # move rook queenside
        self.update_attributes(x_position: 5, y_position: 7)
        # move king
        white_king = Piece.where(type: "King", game_id: game_id, x_position: 4, y_position: 7, has_moved: false).first
        white_king.update_attributes(x_position: 6, y_position: 7)
      else
        # move rook queenside
        self.update_attributes(x_position: 5, y_position: 0)
        # move king
        black_king = Piece.where(type: "King", game_id: game_id, x_position: 4, y_position: 0, has_moved: false).first
        black_king.update_attributes(x_position: 6, y_position: 0)
      end
    end
  end
end