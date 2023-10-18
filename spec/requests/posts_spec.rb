require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before :each do
      get "/users/#{user.id}/posts"
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
    let(:post) { create(:post, author: user) }
    before :each do
      get "/users/#{user.id}/posts/#{post.id}"
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
