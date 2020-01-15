require 'rails_helper'

RSpec.describe Piece, type: :model do
  let!(:game) do 
    FactoryBot.create(
      :game,
      pieces: [FactoryBot.create(
        :piece,
        x_position: 0,
        y_position: 1
      )]
    )
  end

  describe "is_obstructed?" do

    context 'piece is not obstructed' do
      it "should return false if there's no vertical obstruction" do
        piece = Piece.first
        expect(piece.is_obstructed?(0,2)).to be false
      end
    end

    context 'piece is obstructed' do
      let!(:piece2) do 
        FactoryBot.create(
          :piece,
          game_id: game.id,
          x_position: 0,
          y_position: 1
        )
      end
      it "should return true if there is vertical obstruction" do
        piece = Piece.create!(x_position: 0, y_position: 3, game_id: game.id)
        piece = Piece.create!(x_position: 0, y_position: 5, game_id: game.id)
        expect(piece.is_obstructed?(0,1)).to be true
      end
    end
  end

  describe "prevent moving yourself into check" do
    it "should not allow you to move into check" do
      king = King.create!(x_position: 4, y_position: 1, game_id: game.id, white?: true)
      rook = Rook.create!(x_position: 0, y_position: 0, game_id: game.id, white?: false)
      expect(king.would_be_in_check?(4,0)).to be true
    end
  end


end
