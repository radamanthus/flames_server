module ApplicationHelper
  
  def flash_message
    content_tag(:div) do
      content_tag(:div, flash[:notice]) if flash[:notice]
      content_tag(:div, flash[:warning]) if flash[:warning]
      content_tag(:div, flash[:error]) if flash[:error]
    end
  end
  
  def require_login
    redirect_to root_path unless current_user
  end
end
