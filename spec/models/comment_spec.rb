require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(author_id: user.id, title: 'Hi', content: 'This is my post')
  subject { Comment.new(post_id: post.id, user_id: user.id, text: 'Hi Tom!') }

  before { subject.save }

  it 'should validate it\'s text' do
    expect(subject.text).to eq 'Hi Tom!'
    expect(subject.post_id).to eq post.id
    expect(subject.user_id).to eq user.id
  end
end
