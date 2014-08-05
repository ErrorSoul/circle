include ApplicationHelper

  
def sign_in(user, options={})
  
   puts "SIGN_IN HELPER"
  
  # Sign in when not using Capybara.
  remember_token = "1111"
  cookies[:remember_token] = remember_token
  user.update_attribute(:remember_token, remember_token)
  self.current_user = user 
  
  
end

def current_user
=begin
  #for debuf
  remember_token = cookies[:remember_token]
  puts "ZZZZZZZZZZZZZ"
  @current_user ||= User.find_by(remember_token: remember_token)
end
=end
  remember_token = User.encrypt(cookies[:remember_token])
  puts remember_token
  puts @current_user , "@CURRRENU"
  @current_user ||= User.find_by(remember_token: remember_token)
  
end

def current_user=(user)
  @current_user = user
end


def sign_out
  puts "SIGN_OUT"
  cookies.delete(:remember_token)
  self.current_user = nil
  
end
