require 'rails_helper'

RSpec.describe Game, type: :model do
  let!(:game) do 
    FactoryBot.create(
      :game,
      pieces: [FactoryBot.create(
        :piece,
        x_position: 0,
        y_position: 0
      )]
    )
  end

  describe "is_occupied?" do
    context 'space is occupied' do
      it "returns true" do
        expect(game.is_occupied?(0,0)).to be true
      end
    end
    context 'space is not occupied' do
      it "returns nil" do
        expect(game.is_occupied?(3,4)).to be false
      end
    end
  end


  describe "create pieces" do
    it "passes" do 
      expect(true).to be true
    end

    it "should create a game" do
      game = Game.create!
    end

    it "should populate game with 32 pieces" do
      game = Game.create!
      expect(game.pieces.size).to eq 32 
   end
	end

  describe "check checks" do
    it "should detrmine if game is in check" do
      game.pieces << FactoryBot.create(
        :piece,
        x_position: 4,
        y_position: 4,
        type: 'King',
        color: true
        )

      game.pieces << FactoryBot.create(
        :piece,
        x_position: 6,
        y_position: 4,
        type: 'Rook',
        color: false
        )
      expect(game.check?).to be true

     
    end
  end

end 