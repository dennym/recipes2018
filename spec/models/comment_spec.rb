require "rails_helper"

describe Comment, type: :model do

  before do
    @comment = FactoryBot.build(:comment)
  end

  describe "description" do

    it "should be valid" do
      expect(@comment).to be_valid
    end

    it "should be present" do
      @comment.description = nil
      expect(@comment).not_to be_valid
    end

    it "should not be less than 4 characters" do
      @comment.description = " " * 3
      expect(@comment).not_to be_valid
    end

    it "should not be greater than 140 characters" do
      @comment.description = " " * 141
      expect(@comment).not_to be_valid
    end

  end

  describe "comment" do

    it "should have user" do
      @comment.user_id = nil
      expect(@comment).not_to be_valid
    end

    it "should have recipe" do
      @comment.recipe_id = nil
      expect(@comment).not_to be_valid
    end

  end

end
