require 'rails_helper'
RSpec.describe Like, type: :model do
  subject { Like.new(user_id: 1, post_id: 1) }
  before { subject.save }
  it 'update_likes_counter should  function' do
    expect { subject.send(:update_post_like_counter) }
  end
end