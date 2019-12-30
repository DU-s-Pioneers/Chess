class Rook < Piece
  def valid_move?(x, y)
    if  
      x == (self.to_x + 1) && y == (self.to_y + 2) ||
      x == (self.to_x + 1) && y == (self.to_y - 2) ||
      x == (self.to_x + 2) && y == (self.to_y + 1) ||
      x == (self.to_x + 2) && y == (self.to_y - 1) ||
      x == (self.to_x - 1) && y == (self.to_y + 2) ||
      x == (self.to_x - 1) && y == (self.to_y - 2) ||
      x == (self.to_x - 2) && y == (self.to_y - 1) ||
      x == (self.to_x - 2) && y == (self.to_y + 1)

        true
      else
        false
    end
  end
end

