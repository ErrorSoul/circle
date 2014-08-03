include ApplicationHelper
def sign_in(user, options={})
  
    # Sign in when not using Capybara.
    remember_token = "1111"
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, remember_token)
  
end
