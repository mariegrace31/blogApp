require 'rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico') }
  before { subject.save }
  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post_counter should be be greater than 0' do
    subject.post_counter = -30
    expect(subject).to_not be_valid
  end

  it 'post_counter should- be an integer' do
    subject.post_counter = 'not an integer'
    expect(subject).to_not be_valid
  end

  it 'expect recent posts to be 0 ' do
    expect(subject.recent_posts.length).to eq(0)
  end
end