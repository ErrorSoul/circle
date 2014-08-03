class SessionsController < ApplicationController
  respond_to :json
  
  def create 
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      sign_in user
      render json: {  user: user, authorized: 'true' }
    else
      #raise StandardError
      render json: { authorized: 'false' }
    end
  end



end