class Knight < Piece
  def valid_move?(to_x, to_y)
    if  
      x_position == (self.to_x + 1) && y_position == (self.to_y + 2) ||
      x_position == (self.to_x + 1) && y_position == (self.to_y - 2) ||
      x_position == (self.to_x + 2) && y_position == (self.to_y + 1) ||
      x_position == (self.to_x + 2) && y_position == (self.to_y - 1) ||
      x_position == (self.to_x - 1) && y_position == (self.to_y + 2) ||
      x_position == (self.to_x - 1) && y_position == (self.to_y - 2) ||
      x_position == (self.to_x - 2) && y_position == (self.to_y - 1) ||
      x_position == (self.to_x - 2) && y_position == (self.to_y + 1)

        true
      else
        false
    end
  end
end