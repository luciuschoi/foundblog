class Post < ActiveRecord::Base
  resourcify
  include Authority::Abilities

  belongs_to :category
  belongs_to :user

  has_many :comments, dependent: :destroy

  scope :published_posts, -> { where( published: true ).order( created_at: :desc ) }
  scope :myposts, -> (user) { where( user_id: user.id ).order( created_at: :desc) }
  scope :recent, -> { published_posts.limit(10) }
end
