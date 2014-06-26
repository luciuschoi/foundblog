class ApplicationAuthorizer < Authority::Authorizer

  # :admin 권한이 있는 사용자는 모든 권한을 가짐.
  def self.default(adjective, user)
    user.has_role? :admin
  end

  # :admin 권한이 있거나 :author 권한을 가진 경우 본인이 작성한 리소스만을 수정할 수 있음.
  def updatable_by?(user)
    (user.has_role?(:author) && resource.user == user) || user.has_role?(:admin)
  end

  # :admin 권한이 있거나 :author 권한을 가진 경우 본인이 작성한 리소스만을 삭제할 수 있음.
  def deletable_by?(user)
    (user.has_role?(:author) && resource.user == user) || user.has_role?(:admin)
  end

end