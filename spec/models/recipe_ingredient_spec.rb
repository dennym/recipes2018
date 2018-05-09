require "spec_helper"

describe RecipeIngredient do
  it { is_expected.to belong_to :recipe }
  it { is_expected.to belong_to :ingredient }
end
