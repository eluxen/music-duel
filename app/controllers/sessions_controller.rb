class SessionsController < ApplicationController

  def create
    user = User.from_auth(omnihash) || User.create_from_auth(omnihash)

    if user.save
      session[:user_id] = user.id
      redirect_to duels_path
    elsif user.not_invited?
      redirect_to login_path, :alert => "You are not invited!"
    else
      raise "Failed to login"
    end
  end

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => "Signed out!"
  end

  private

  def omnihash
    request.env["omniauth.auth"]
  end
end
