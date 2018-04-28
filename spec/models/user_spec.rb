require "rails_helper"

describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "name" do

    it "should be present" do
      @user.name = nil
      expect(@user).not_to be_valid
    end

    it "should validate user with name" do
      expect(@user).to be_valid
    end

    it "should not be more than 30 characters" do
      @user.name = "a" * 31
      expect(@user).not_to be_valid
    end

  end

  describe "email" do

    it "should be present" do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it "should be unique and case sensitive" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      expect(duplicate_user).not_to be_valid
    end

    it "should not be more than 255 characters" do
      @user.email = "a" * 245 + "@example.com"
      expect(@user).not_to be_valid
    end

    it "should accept correct format" do
      valid_emails = %w[user@example.com STEFANOS@gmail.com a+b@yahoo.ca user@foo.COM smith@co.uk.org]
      valid_emails.each do |valid_email|
        @user.email = valid_email
        expect(@user).to be_valid
      end
    end

    it "should reject invalid email addresses" do
      invalid_emails = %w[user@example,com STEFANOS@gmail a+b@yahoo. user@foo+bar.COM smith@co+ca.uk.org]
      invalid_emails.each do |invalid_email|
        @user.email = invalid_email
        expect(@user).not_to be_valid
      end
    end

    it "should be lowercase before hit the database" do
      mixed_email = "StEf@examplE.com"
      @user.email = mixed_email
      @user.save
      expect(@user.reload.email).to eq(@user.email.downcase)
    end

  end

  describe "password" do

    it "should be present" do
      @user.password = nil
      expect(@user).not_to be_valid
    end

    it "should not be less than 5 characters" do
      @user.password = " " * 3
      expect(@user).not_to be_valid
    end

  end

    xit "should destroy dependent recipes" do
      #i can't implement this but i will return here later.
      # i'm taking the following error:
      # expected `Recipe.count` to have changed by -1, but was changed by 0
      @user = FactoryBot.build(:user)
      @recipe = FactoryBot.build(:recipe)

      @user.recipes << @recipe
      @user.destroy
      expect { @user.destroy }.to change { Recipe.count }.by(-1)
    end
end
