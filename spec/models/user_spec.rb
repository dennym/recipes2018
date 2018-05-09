require "spec_helper"

describe User do
  it { is_expected.to have_many(:recipes).dependent(:destroy) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }

  it 'comes valid from factory' do
    expect(build(:user)).to be_valid
  end

  before do
    @user = build(:user)
  end

  context 'on validation' do
    it 'is invalid without email' do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it 'is invalid without password' do
      @user.password = nil
      expect(@user).to be_invalid
    end

    it 'is invalid when password is shorter than 5' do
      @user.password = ' ' * 3
      expect(@user).not_to be_valid
    end

    it 'is invalid without name' do
      @user.name = nil
      expect(@user).to be_invalid
    end

    it 'is invalid when name is longer than 30' do
      @user.name = "a" * 31
      expect(@user).to be_invalid
    end

    context 'when user with given email exists' do
      it 'is invalid' do
        @user.save
        expect(build(:user, email: @user.email)).to be_invalid
      end
    end

    context 'when email format is not correct' do
      it 'is invalid' do
        invalid_emails = %w(sam@example user@example,com STEFANOS@gmail a+b@yahoo. user@foo+bar.COM smith@co+ca.uk.org)
        invalid_emails.each do |invalid_email|
          @user.email = invalid_email
          expect(@user).to be_invalid
        end
      end

      it 'is invalid when email longer than 255' do
        @user.email = 'a' * 245 + '@example.com'
        expect(@user).to be_invalid
      end
    end

    context 'on_save' do
      it 'is lowercase when its saved' do
        @user.email = 'StEf@examplE.com'
        @user.save
        expect(@user.reload.email).to eq(@user.email.downcase)
      end
    end
  end
end
