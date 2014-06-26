class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :categories, dependent: :nullify
  has_many :posts, dependent: :destroy

  def confirm!
    super
    add_role :user
  end

end
