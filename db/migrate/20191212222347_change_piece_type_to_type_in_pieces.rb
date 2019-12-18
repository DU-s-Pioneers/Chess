class ChangePieceTypeToTypeInPieces < ActiveRecord::Migration[5.2]
  def change
  remove_column :pieces, :piece_type
  add_column :pieces, :type, :string
  end
end
