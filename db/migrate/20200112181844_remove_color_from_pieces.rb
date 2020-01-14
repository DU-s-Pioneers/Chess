class RemoveColorFromPieces < ActiveRecord::Migration[5.2]
  def change
  	remove_column :pieces, :color
  	add_column :pieces, :white?, :boolean
  end
end
