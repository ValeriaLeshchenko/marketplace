module ApplicationHelper
  def navbar_links
    if current_seller
      raw("<li>#{link_to "Logout", destroy_seller_session_path, method: :delete, :data => {:confirm => 'Are you sure?'}}</li>")
    else
      raw("<li>#{link_to "Login", new_seller_session_path} </li><li>#{link_to "Register", new_seller_registration_path}</li>")
    end
  end
end
