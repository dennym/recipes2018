module Features
  module SessionHelpers
    def sign_up_with(chefname, email, password)
      visit '/signup'
      fill_in 'Choose Chefname', with: chefname
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Confirm Password', with: password
      click_button 'Create my account'
    end

    def sign_in(user = nil)
      user ||= create(:user)
      visit '/login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end
  end
end