class Game < ApplicationRecord
  has_many :pieces

  def is_occupied?(x, y)
  def occupied?(x, y)

    pieces.each do |piece|
      if piece.x_coordinates == x && piece.y_coordinates == y
        return true
      end
        return true if piece.x_coordinates == x && piece.y_coordinates ==y
      end  
        return false
      end

  def check_path(x1, y1, x2, y2)
    if y1 == y2
      return 'horizontal'
    elsif x1 == x2
      return 'verticle'
    else 
      @slope = (y2-y1).to_f/(x2-x1).to_f
    end
      return false
    end

  def is_obstructed?(piece1_location, destination)
  def obstructed?(piece1_loc, destination)

    x1 = piece1_location[0]
    y1 = piece1_location[1]
    x2 = destination[0]
    y2 = destination[1]

    if y1 ==y2
      horizontal = true
    elsif x1 == x2
      vertical = true
    else
      slope = (y2-y1).to_f/(x2-x1).to_f
    end

    path = check_path(x1, y1, x2, y2)

    if horizontal && x1 < x2
      (x1+1).upto(x2-1) do |x|
        return true if is_occupied?(x, y1)
    if path == 'horizontal' && x1 < x2
      (x1 + 1).upto(x2 - 1) do |x|
        return true if occupied?(x, y1)
      end
    end

    if horizontal && x1 > x2
      (x1-1).downto(x2+1) do |x|
        return true if is_occupied?(x, y1)
    if path == 'horizontal' && x1 > x2
      (x1 - 1).downto(x2 + 1) do |x|
        return true if occupied?(x, y1)
      end
    end

    if vertical && y1 < y2
      (y1+1).upto(y2-1) do |y|
        return true if is_occupied?(x1, y)
    if path == 'vertical' && y1 < y2
      (y1 + 1).upto(y2 - 1) do |y|
        return true if occupied?(x1, y)
      end
    end

    if vertical && y1 > y2
      (y1-1).downto(y2+1) do |y|
        return true if is_occupied?(x1, y)
    if path == 'vertical' && y1 > y2
      (y1 - 1).downto(y2 + 1) do |y|
        return true if occupied?(x1, y)
      end
    end

    if horizontal || vertical
    if path == 'horizontal' || path == 'vertical'
      return false
    end

    if slope.abs == 1.0 && x1 < x2
      (x1+1).upto(x2-1) do |x|
        delta_y = x-x1
    if @slope.abs == 1.0 && x1 < x2
      (x1 + 1).upto(x2 - 1) do |x|
        delta_y = x - x1
        y = y2 > y1 ? y1 + delta_y : y1 - delta_y
        return true if is_occupied?(x, y)
        return true if occupied?(x, y)
      end
    end

    if slope.abs == 1.0 && x1 > x2
      (x1-1).downto(x2+1) do |x|
        delta_y = x1-x
    if @slope.abs == 1.0 && x1 > x2
      (x1 - 1).downto(x2 + 1) do |x|
        delta_y = x1 - x
        y = y2 > y1 ? y1 + delta_y : y1 - delta_y
        return true if is_occupied?(x, y)
        return true if occupied?(x, y)
      end
    end

    if (slope.abs != 1.0)
    if @slope.abs != 1.0
      fail 'not a stright line'
    else return false
    end
  end

end
