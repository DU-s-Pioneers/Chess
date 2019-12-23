require 'rails_helper'

RSpec.describe Game, type: :model do
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
end
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