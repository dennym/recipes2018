require 'spec_helper'

RSpec.describe PagesController do

  describe 'GET #home' do
    it 'renders the home template' do
      get :home
      expect(response).to have_http_status(:success)
      expect(response).to render_template('home')
    end
  end
end
