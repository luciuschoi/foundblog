module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
        "success"   # Green
      when "error"
        "danger"    # Red
      when "alert"
        "alert"   # Yellow
      when "notice"
        "info"      # Blue
      else
        flash_type.to_s
    end
  end

  def active_menu(target_controller)
    "class=#{controller_name == target_controller ? 'active' : ''}"
  end

  def user_email(post)
    post.user.present? ? post.user.email : "an anonymous user"
  end

  def user_roles(user)
    user.roles.map(&:name).join(', ').titleize
  end

  def published_icon(boolean)
    if boolean
      "<i class='fi-check'></i> 작성완료".html_safe
    else
      "<i class='fi-pencil'></i> 작성중...".html_safe
    end
  end

  def icon(shape)
    "<i class='fi-#{shape}'></i>".html_safe
  end

end