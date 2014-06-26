class CommentAuthorizer < ApplicationAuthorizer

  # :user, :author, :admin 권한이 있는 사용자만 댓글을 작성할 수 있음.
  def self.creatable_by?(user)
    user.has_role?(:admin) || user.has_role?(:author) || user.has_role?(:user)
  end

end