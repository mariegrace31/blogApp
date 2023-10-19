require 'rails_helper'

RSpec.describe 'User show method ', type: :feature do
  before(:example) do
    @user = User.create(name: 'Moha',
                        photo: 'https://images.unsplash.com/photo-1594897030264-ab7d87efc473?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80',
                        bio: 'Teacher from Yemen.', posts_count: 5)

    @posts = [Post.create(author: @user, title: 'Hello', content: 'This is my first post', likes_count: 0,
                          commentsCounter: 0),
              Post.create(author: @user, title: 'Hi', content: 'This is my second post', likes_count: 0,
                          commentsCounter: 0),
              Post.create(author: @user, title: 'What"s up', content: 'This is my third post', likes_count: 0,
                          commentsCounter: 0)]

    @comments = [
      Comment.create(user: @user, post: @posts[0], text: 'Hi Tom!'),
      Comment.create(user: @user, post: @posts[0], text: 'how are you!'),
      Comment.create(user: @user, post: @posts[1], text: 'What are you doing tonight')
    ]
    visit user_posts_path(@user, @posts)
  end

  it 'shows the user\'s profile picture' do
    expect(page.html).to include('user-photo')
    find("img[src='#{@user.photo}']")
  end

  it 'shows the name of username' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the number of posts' do
    expect(page).to have_content("Number of posts: #{@user.posts_count}")
  end

  it 'shows a post title' do
    @posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it 'shows a post content' do
    @posts.each do |post|
      expect(page).to have_content(post.content)
    end
  end

  it 'shows recent comments' do
    @posts[0].recent_comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  it 'shows a comments count' do
    expect(page).to have_content(@posts[0].commentsCounter)
  end

  it 'shows a likes count' do
    expect(page).to have_content(@posts[0].likes_count)
  end

  it 'shows the Pagination button' do
    expect(page).to have_content('Pagination')
  end

  it 'redirects to the post page' do
    post = @posts.first
    click_link(post.title)
    expect(page).to have_current_path(user_post_path(@user, post))
  end
end
