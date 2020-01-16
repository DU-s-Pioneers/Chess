class Knight < Piece
  def my_valid_move?(to_x, to_y)
    x_position == (to_x + 1) && y_position == (to_y + 2) ||
    x_position == (to_x + 1) && y_position == (to_y - 2) ||
    x_position == (to_x + 2) && y_position == (to_y + 1) ||
    x_position == (to_x + 2) && y_position == (to_y - 1) ||
    x_position == (to_x - 1) && y_position == (to_y + 2) ||
    x_position == (to_x - 1) && y_position == (to_y - 2) ||
    x_position == (to_x - 2) && y_position == (to_y - 1) ||
    x_position == (to_x - 2) && y_position == (to_y + 1)
  end
end