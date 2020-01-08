class AddGamesTurn < ActiveRecord::Migration[5.2]
  def change
  	add_column :games, :turn, :integer, default: 1
  end
end
