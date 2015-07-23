class SessionsController < ApplicationController

  def create
    binding.pry
    user = User.from_auth(omnihash) || User.create_from_auth(omnihash)

    if user.save
      session[:user_id] = user.id
      redirect_to root_path
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
