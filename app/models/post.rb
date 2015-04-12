class Post < ActiveRecord::Base
  has_one :summary
  has_many :comments
  belongs_to :user
  belongs_to :topic

   

    default_scope { order('created_at DESC') }

  scope :ordered_by_title, -> { order('posts.title ASC') }
  scope :ordered_by_reverse_created_at, -> { order('posts.created_at DESC') }
end
