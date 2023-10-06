class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_post_like_counter

  private

  def update_post_like_counter
    post.update(likes_count: post.likes.count)
  end
end
