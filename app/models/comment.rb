class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post

  after_create :update_post_comments_counter

  private

  def update_post_comments_counter
    post.update(commentsCounter: post.comments.count)
  end
end
