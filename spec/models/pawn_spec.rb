require 'rails_helper'

RSpec.describe Pawn, type: :model do
  let!(:game) do 
    FactoryBot.create(:game)
  end

  describe "valid move" do

    it "should be able to make a step move" do
      pawn = Pawn.create(game_id: game.id, x_position: 3, y_position: 6, white?: true)
      expect(pawn.valid_move?(3, 5)).to eq true
    end
    it "should be able to make a jump move" do
      pawn = Pawn.create(game_id: game.id, x_position: 3, y_position: 6, white?: true)
      expect(pawn.valid_move?(3, 4)).to eq true
    end
    it "should not be able to make a jump move if has moved" do
      pawn = Pawn.create(game_id: game.id, x_position: 3, y_position: 2, moved: true, white?: true)
      expect(pawn.valid_move?(3, 4)).to eq false
    end

    it "White piece should not be able to move backwards" do
      pawn = Pawn.create(game_id: game.id, x_position: 3, y_position: 2, white?: true)
      expect(pawn.valid_move?(3, 1)).to eq false
    end
    
    it "black piece should not be able to move backwards" do
      pawn = Pawn.create(game_id: game.id, x_position: 3, y_position: 5, white?: false)
      expect(pawn.valid_move?(3, 6)).to eq false
    end
    it "should not be able to move off the board" do
      pawn = Pawn.create(game_id: game.id, x_position: 3, y_position: 0, white?: true)
      expect(pawn.valid_move?(3, -1)).to eq false
    end
  end

  describe "En_passant" do
    it "should allow en_passant capture" do
      pawn = Pawn.create(game_id: game.id, x_position: 7, y_position: 1, white?: true)
      pawn = Pawn.create(game_id: game.id, x_position: 6, y_position: 3, white?: false)

    end
  end
end