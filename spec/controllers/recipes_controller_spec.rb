require 'spec_helper'

RSpec.describe RecipesController, type: :controller do

  before do
    @user = FactoryBot.build(:user)
    @user.save

    @admin = FactoryBot.create(:admin)
    @recipe = FactoryBot.create(:recipe)
    @recipe1 = FactoryBot.create(:recipe)
  end

  describe "GET #index" do
    #for the next two tests also could be done in one implementation
    it "renders the index template" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template("index")
    end

    it "should get recipes listing" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:recipes)).to match_array([@recipe, @recipe1])
    end
  end

  describe "GET #show" do
    it "should render the recipe show page" do
      get :show, params: { id: @recipe.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template("show")
      expect(assigns(:recipe)).to eq(@recipe)
    end
  end

end
