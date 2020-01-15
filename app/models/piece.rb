class Piece < ApplicationRecord
  belongs_to :game

  def can_be_taken?
    game.pieces_for_color(!white?).any? { |piece| piece.valid_move?(x_position, y_position) }
  end

  def valid_move?(to_x, to_y)
    my_valid_move?(to_x, to_y) &&
      on_board?(to_x, to_y) &&
      game.piece_at(to_x, to_y)&.white? != white? &&
      !is_obstructed?(to_x, to_y)
  end

  def on_board?(x = x_position, y = y_position)
    x && y &&
      x >= 0 &&
      x <=7 &&
      y >= 0 &&
      y <= 7
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

  def is_obstructed?(to_x, to_y)
    if x_position == to_x && y_position < to_y
      (y_position + 1).upto(to_y - 1) do |y|
        return true if game.is_occupied?(x_position, y)
      end
    end

    if x_position == to_x && y_position > to_y
      (y_position - 1).downto(to_y + 1) do |y|
        return true if game.is_occupied?(x_position, y)
      end
    end

    if y_position == to_y && x_position < to_x
      (x_position + 1).upto(to_x - 1) do |x|
        return true if game.is_occupied?(x_position, y)
      end
    end

    if y_position == to_y && x_position > to_x
      (x_position - 1).downto(to_x + 1) do |x|
        return true if game.is_occupied?(x_position, y)
      end
    end

    if @slope == 1.0 && x_position < to_x
      (x_position + 1).upto(to_x - 1) do |x|
        delta_y = x - x_position
        y = to_y > y_position ? y_position + delta_y : y_position - delta_y
        return true if game.is_occupied?(x, y)
      end
    end

    if @slope == 1.0 && x_position > to_x
      (x_position - 1).downto(to_x + 1) do |x|
        delta_y = x_position - x
        y = to_y > y_position ? y_position + delta_y : y_position - delta_y
        return true if game.is_occupied?(x, y)
      end
    end
    false 
  end
    # if y_position == to_y || x_position == to_x
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
    white?? 'white' : 'black'
  end

  def opposite_piece_color
    white?? 'black' : 'white'
  end

  def at_position?(to_x, to_y)
    x_position == to_x && y_position == to_y
  end

  def would_be_in_check?(to_x, to_y)
    
  end
end
