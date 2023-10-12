require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.create(author_id: user.id, title: 'Hi', content: 'This is my post') }
  subject { Like.new(post_id: post.id, user_id: user.id) }

  before { subject.save }

  it 'author_id is not present' do
    subject.user_id = false
    expect(subject).to_not be_valid
  end

  it 'post_id is not present' do
    subject.post_id = nil
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
