class ColorBackToBoolean2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :pieces, :color, :string
  end
end
