class SessionsController < ApplicationController
  def new
    @user = LoginDetails.new('example@gmail.com', 'password')
  end

  def create
    user_details = params[:user]
    user = User.find_by_email(user_details[:email])
    if user && user.authenticate(user_details[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'You are logged out'
  end
end

class LoginDetails
  attr_accessor :email, :password
  def initialize(email = 'example@gmail.com', password = 'password')
    @email = email
    @password = password
  end
end
