require 'rails_helper'

RSpec.describe Piece, type: :model do
  let!(:game) do 
    FactoryBot.create(
      :game,
      pieces: [FactoryBot.create(
        :piece,
        x_coord: 0,
        y_coord: 0
      )]
    )
  end

  describe "is_obstructed?" do

    context 'piece is not obstructed' do
      it "should return false if there's no vertical obstruction" do
        piece = Piece.first
        expect(piece.is_obstructed?(0,0)).to be false
      end
    end

    context 'piece is obstructed' do
      let!(:piece2) do 
        FactoryBot.create(
          :piece,
          game_id: game.id,
          x_coord: 0,
          y_coord: 1
        )
      end
      it "should return true if there is vertical obstruction" do
        piece = Piece.first
        expect(piece.is_obstructed?(0,3)).to be true
      end
    end



  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
