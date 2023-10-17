require 'rails_helper'

RSpec.describe 'User show method ', type: :feature do
  # rubocop:disable Layout/LineLength
  before(:example) do
    @user = User.create(name: 'Moha',
                        photo: 'https://images.unsplash.com/photo-1594897030264-ab7d87efc473?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80',
                        bio: 'Teacher from Yemen.', posts_count: 8)

    @posts = [Post.create(author: @user, title: 'Hi', content: 'This is my first post', commentsCounter: 0, likes_count: 0),
              Post.create(author: @user, title: 'Hey', content: 'This is my second post', commentsCounter: 0, likes_count: 0),
              Post.create(author: @user, title: 'What\'s up', content: 'This is my third post', commentsCounter: 0, likes_count: 0)]
    # rubocop:enable Layout/LineLength
    visit user_path(@user)
  end

  it 'shows the user\'s profile' do
    expect(page.html).to include('user-photo')
    find("img[src='#{@user.photo}']")
  end

  it 'shows the name of user' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the user\'s bio' do
    expect(page).to have_content(@user.bio)
  end

  it 'show the number of posts' do
    expect(page).to have_content("Number of posts: #{@user.posts_count}")
  end

  it 'shows the first three posts' do
    @posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it 'shows the "See all posts" button' do
    find_button('See all Posts')
  end

  it 'redirects me to that post\'s show page' do
    click_link('See all Posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end

  it 'redirects to the the clicked post link' do
    post = @posts.first
    click_link(post.title)
    expect(page).to have_current_path(user_post_path(@user, post))
  end
end
