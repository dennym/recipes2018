require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'Peter', 'valid@example.com', 'password'

    expect(page).to have_content('Log out')
  end

  scenario 'with invalid email' do
    sign_up_with 'Peter', 'invalid@email', 'password'

    expect(page).to have_content('Email is invalid')
  end

  scenario 'with blank password' do
    sign_up_with 'Peter', 'valid@example.com', ''

    expect(page).to have_content("Password can't be blank")
  end
end
