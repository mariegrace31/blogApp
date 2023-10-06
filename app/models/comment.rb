class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_post_comments_counter

  private

  def update_post_comments_counter
    post.update(commentsCounter: post.comments.count)
  end
end
