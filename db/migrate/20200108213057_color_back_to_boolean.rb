class ColorBackToBoolean < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :color, :boolean
    remove_column :games, :color, :integer
  end
end
