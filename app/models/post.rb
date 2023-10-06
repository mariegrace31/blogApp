class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_user_post_counter

  private

  def update_user_post_counter
    author.update(posts_count: author.posts.count)
  end

  public

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
