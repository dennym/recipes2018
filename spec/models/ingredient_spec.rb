require "spec_helper"

describe Ingredient do
  it { is_expected.to have_many :recipe_ingredients }
  it { is_expected.to have_many(:recipes).through(:recipe_ingredients) }

  before do
    @ingredient = FactoryBot.build(:ingredient)
  end

  context "name" do
    it "should be present" do
      @ingredient.name = nil
      expect(@ingredient).not_to be_valid
    end

    it "should not be less than 3 characters" do
      @ingredient.name = " " * 2
      expect(@ingredient).not_to be_valid
    end

    it "should not be greater than 25 characters" do
      @ingredient.name = " " * 26
      expect(@ingredient).not_to be_valid
    end

    it "should be unique" do
      duplicate_ingredient = @ingredient.dup
      duplicate_ingredient.name = @ingredient.name
      @ingredient.save
      expect(duplicate_ingredient).not_to be_valid
    end
  end

end
