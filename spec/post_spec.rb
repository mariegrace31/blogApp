require 'rails_helper'
RSpec.describe Post, type: :model do
  subject { Post.new(title: 'My first post', content: 'This is my first post') }
  before { subject.save }
  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title length should be less than or equal to 250' do
    subject.title = 'a' * 300
    expect(subject).to_not be_valid
  end

  it 'comments_counter  should be a integer' do
    subject.comments_counter = 'not an integer'
    expect(subject).to_not be_valid
  end

  it 'comments_counter  should be greater than or equal to 0' do
    subject.comments_counter = -3
    expect(subject).to_not be_valid
  end

  it 'likes_counter  should be a integer' do
    subject.likes_counter = 'not an integer'
    expect(subject).to_not be_valid
  end

  it 'likes_counter  should be greater than or equal to 0' do
    subject.likes_counter = -3
    expect(subject).to_not be_valid
  end

  it 'update_posts_counter should to function' do
    expect { subject.send(:update_user_post_counter) }
  end
end