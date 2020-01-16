class Bishop < Piece
  def my_valid_move?(to_x, to_y)
    if is_obstructed?(to_x, to_y) == true || 
        (x_position - to_x).abs != (y_position - to_y).abs 
      false
    else
      true
    end
  end
end
