class Post < ActiveRecord::Base
  resourcify
  include Authority::Abilities

  acts_as_taggable

  belongs_to :category
  belongs_to :user

  has_many :comments, dependent: :destroy

  scope :published_posts, -> { where( published: true ).order( created_at: :desc ) }
  scope :myposts, -> (user) { where( user_id: user.id ).order( created_at: :desc) }
  scope :recent, -> { published_posts.limit(10) }
  scope :uncategorized_posts, -> { published_posts.where(category_id: nil) }
end
