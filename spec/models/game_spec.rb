require 'rails_helper'

RSpec.describe Game, type: :model do
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