require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe '#index' do
    it "should redirect if user not logged in" do
     	get :index
      expect(response).to have_http_status(302)
    end
  end
end

