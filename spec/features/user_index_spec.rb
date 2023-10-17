# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User index method', type: :feature do
  before(:example) do
    @users = []
    5.times do |i|
      user = User.create(
        name: "User #{i + 1}",
        photo: "https://example.com/photo#{i + 1}.jpg",
        bio: "Bio for User #{i + 1}",
        posts_count: i + 1
      )
      @users << user
    end

    visit users_path
  end

  it 'displays the user index page' do
    expect(page).to have_css('.user-card')
  end

  it 'displays user information for each user' do
    User.all.each do |user|
      user_card = find(".user-card-#{user.id}")

      within(user_card) do
        expect(page).to have_css("img[src='#{user.photo}']")
        expect(page).to have_content(user.name)
        expect(page).to have_content("Number of posts: #{user.posts_count}")
      end
    end
  end

  it 'provides a link to view each user\'s profile' do
    User.all.each do |user|
      user_card = find(".user-card-#{user.id}")

      within(user_card) do
        expect(page).to have_link('View Profile', href: user_path(user))
      end
    end
  end

  it 'clicking on user name navigates to their profile' do
    user = User.first # Replace with a user from your test data
    user_card = find(".user-card-#{user.id}")

    within(user_card) do
      click_link(user.name)
    end

    expect(page).to have_current_path(user_path(user))
  end

  it 'clicking on "View Profile" navigates to the user\'s profile' do
    user = User.first
    user_card = find(".user-card-#{user.id}")

    within(user_card) do
      click_link('View Profile')
    end

    expect(page).to have_current_path(user_path(user))
  end
end
