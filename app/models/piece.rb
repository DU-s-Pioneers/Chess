class Piece < ApplicationRecord
  belongs_to :game

  def can_be_taken?
    game.pieces_for_color(!color).any? { |piece| piece.valid_move?(x_position, y_position) }
  end

  def check_path(x1, y1, x2, y2)
    if y1 == y2
      return 'horizontal'
    elsif x1 == x2
      return 'vertical'
    else 
      @slope = (y2-y1).to_f/(x2-x1).to_f
    end
  end

  def is_obstructed?(x_dest, y_dest)
    if x_position == x_dest && y_position < y_dest
      (y_position + 1).upto(y_dest - 1) do |y|
        return true if game.is_occupied?(x_position, y)
      end
    end

    if x_position == x_dest && y_position > y_dest
      (y_position - 1).downto(y_dest + 1) do |y|
        return true if game.is_occupied?(x_position, y)
      end
    end

    if y_position == y_dest && x_position < x_dest
      (x_position + 1).upto(x_dest - 1) do |x|
        return true if game.is_occupied?(x_position, y)
      end
    end

    if y_position == y_dest && x_position > x_dest
      (x_position - 1).downto(x_dest + 1) do |x|
        return true if game.is_occupied?(x_position, y)
      end
    end

    if @slope == 1.0 && x_position < x_dest
      (x_position + 1).upto(x_dest - 1) do |x|
        delta_y = x - x_position
        y = y_dest > y_position ? y_position + delta_y : y_position - delta_y
        return true if game.is_occupied?(x, y)
      end
    end

    if @slope == 1.0 && x_position > x_dest
      (x_position - 1).downto(x_dest + 1) do |x|
        delta_y = x_position - x
        y = y_dest > y_position ? y_position + delta_y : y_position - delta_y
        return true if game.is_occupied?(x, y)
      end
    end

    # if y_position == y_dest || x_position == x_dest
    #   fail 'not a move'
    # end

    # if (slope.abs != 1.0)  
    #   fail 'not a stright line'
    # end


  def move_to!(to_x, to_y)
    game.piece_at(to_x, to_y)&.capture!
    update_atributes(x_position: to_x, y_position: to_y, moved: true)
    game.update_atributes(en_passant_pawn: nil)
    game.pieces.reload
  end

  def capture!
    update_atributes(x_position: nil, y_position: nil)
  end  

  def enemy_piece_at?(to_x, to_y)
    game.piece_at(to_x, to_y)&.piece_color == opposite_piece_color
  end

  def piece_color
    color == true ? 'white' : 'black'
  end

  def opposite_piece_color
    color == true ? 'black' : 'white'
  end

  def at_position?(to_x, to_y)
    x_position == to_x && y_position == to_y
  end

end
