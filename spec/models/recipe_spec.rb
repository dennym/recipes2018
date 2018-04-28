require "rails_helper"

describe Recipe, type: :model do

  before do
    @recipe = FactoryBot.build(:recipe)
  end

    it "should not be valid without a user" do
      @recipe.user_id = nil
      expect(@recipe).not_to be_valid
    end

    it "should have valid image" do
      @recipe.image_url = nil
      expect(@recipe).not_to be_valid
    end

  describe "name" do

    it "should be present" do
      @recipe.name = nil
      expect(@recipe).not_to be_valid
    end
  end

  describe "description" do

    it "should be present" do
      @recipe.description = nil
      expect(@recipe).not_to be_valid
    end

    it "should not be less than 5 characters" do
      @recipe.description = " " * 3
      expect(@recipe).not_to be_valid
    end

    it "should not be greater than 100 characters" do
      @recipe.description = " " * 101
      expect(@recipe).not_to be_valid
    end

  end

end
