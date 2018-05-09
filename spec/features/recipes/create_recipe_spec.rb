require 'spec_helper'

feature 'User creates recipe' do
  scenario 'User is not logged in' do
    visit '/recipes/new'

    expect(page).to have_content('You must be logged in to perform that action')
  end

  scenario 'User is logged in' do
    sign_in

    visit '/recipes/new'

    expect(page).to have_content('Create new recipe')
  end

  scenario 'with valid information' do
    sign_in

    visit '/recipes/new'

    fill_in 'Name', with: 'Shepards Pie'
    attach_file 'Image', Rails.root + 'spec/support/test_images/beef.jpg'
    fill_in 'Description', with: 'Some information'

    click_button 'Create Recipe'

    expect(page).to have_content('Recipe was created successfully')
  end
end
