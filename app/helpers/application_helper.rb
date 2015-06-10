module ApplicationHelper
  def profile_data
    current_user.profile.to_json.html_safe
  end

  def current_user_data
    "{'name': '#{current_user.name}', 'age': '#{current_user.age}'}".html_safe
  end
end
