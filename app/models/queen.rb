class Queen < Piece
  def valid_move?(to_x, to_y)
    if is_obstructed?(to_x, to_y) == true || 
        x_coord != to_x ||  
        y_coord != to_y || 
        (x_coord - to_x).abs != (y_coord - to_y).abs 
      false
    else
      true
    end
  end
end