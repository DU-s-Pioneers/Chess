class Piece < ApplicationRecord
  belongs_to :game

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
    if x_coord == x_dest && y_coord < y_dest
      (y_coord + 1).upto(y_dest - 1) do |y|
        return true if game.is_occupied?(x_coord, y)
      end
    end

    if x_coord == x_dest && y_coord > y_dest
      (y_coord - 1).downto(y_dest + 1) do |y|
        return true if game.is_occupied?(x_coord, y)
      end
    end

    if y_coord == y_dest && x_coord < x_dest
      (x_coord + 1).upto(x_dest - 1) do |x|
        return true if game.is_occupied?(x_coord, y)
      end
    end

    if y_coord == y_dest && x_coord > x_dest
      (x_coord - 1).downto(x_dest + 1) do |x|
        return true if game.is_occupied?(x_coord, y)
      end
    end

    if @slope == 1.0 && x_coord < x_dest
      (x_coord + 1).upto(x_dest - 1) do |x|
        delta_y = x - x_coord
        y = y_dest > y_coord ? y_coord + delta_y : y_coord - delta_y
        return true if game.is_occupied?(x, y)
      end
    end

    if @slope == 1.0 && x_coord > x_dest
      (x_coord - 1).downto(x_dest + 1) do |x|
        delta_y = x_coord - x
        y = y_dest > y_coord ? y_coord + delta_y : y_coord - delta_y
        return true if game.is_occupied?(x, y)
      end
    end

    # if y_coord == y_dest || x_coord == x_dest
    #   fail 'not a move'
    # end

    # if (slope.abs != 1.0)  
    #   fail 'not a stright line'
    # end

    return false
  end

  def move_to!(new_x, new_y)
    @game = game
    if is_occupied?(new_x, new_y)
      @piece_at_destination = @game.pieces.find_by(x_coord: new_x, y_coord: new_y)
      if color == @piece_at_destination.color
        fail 'same team'
      else
        @piece_at_destination.update_attributes(x_coord: nil, y_coord: nil, status: 'captured')
        @status = @piece_at_destination.status
        @captured = true
      end
    else @captured = false
    end
  end

end
