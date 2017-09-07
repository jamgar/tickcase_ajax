module ApplicationHelper
  def get_path
     if user_signed_in? && current_user.provider == 'google_oauth2'
       #flash.now[:notice] = "You do not have a profile page"
     else
       edit_user_registration_path(current_user)
     end
  end

  def panel_color(user, technician)
    user == technician ? 'default' : 'primary'
  end
end
