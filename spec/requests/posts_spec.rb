require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before do
      get user_posts_path(user_id: 1)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template('posts/index')
    end

    it 'responds with the correct body' do
      expect(response.body).to include('These are the Posts of the user!')
    end
  end

  describe 'GET /show' do
    before do
      get user_post_path(user_id: 1, id: 1)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template('posts/show')
    end

    it 'responds with the correct body' do
      expect(response.body).to include('This is an individual post')
    end
  end
end
