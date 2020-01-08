class ChangeColorTypePieces < ActiveRecord::Migration[5.2]
  def change 
  	change_column :pieces, :color, :string
  end
end
