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
