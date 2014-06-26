class CategoryAuthorizer < ApplicationAuthorizer

  # :admin 권한이 있는 사용자만 카테고리를 작성/수정/삭제할 수 있음.
  def self.default(adjective, user)
    user.has_role?(:admin)
  end

end