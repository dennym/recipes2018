require 'spec_helper'

feature 'Visitor logs in' do
  scenario 'with valid email and password' do
    sign_in

    expect(page).to have_content('Log out')
  end

  scenario 'with invalid email and password' do
    user = build(:user)
    sign_in user

    expect(page).to have_content('Log in')
  end
end
