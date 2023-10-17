RSpec.describe 'User index method which is also homepage', type: :feature do
  before(:example) do
    @users = [
      User.create(name: 'Me', photo: 'user1.jpg', bio: 'Teacher from Yemen.', posts_count: 10),
      User.create(name: 'You', photo: 'user2.jpg', bio: 'Teacher from Sanaa.', posts_count: 5),
      User.create(name: 'He', photo: 'user3.jpg', bio: 'Teacher from Here.', posts_count: 7),
      User.create(name: 'She', photo: 'user4.jpg', bio: 'Teacher from There.', posts_count: 2)
    ]
    visit root_path
  end
  it 'Displays usernames of all users' do
    @users.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'Displays the profile picture of each' do
    expect(page).to have_selector(:xpath, '/html/body/section/article[1]/img')
    expect(page).to have_selector(:xpath, '/html/body/section/article[2]/img')
    expect(page).to have_selector(:xpath, '/html/body/section/article[3]/img')
    expect(page).to have_selector(:xpath, '/html/body/section/article[4]/img')
  end

  it 'shows the number of posts each user has' do
    @users.each do |user|
      expect(page).to have_content("Number of posts: #{user.posts_count}")
    end
  end

  it 'can redirect to the user"s show page when click on the username' do
    user = @users.first
    click_link(user.name)
    expect(page).to have_current_path(user_path(user))
  end
end
