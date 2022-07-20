class UsersController < ApplicationController
  def show
    require "pry"; binding.pry
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/dashboard"
    else
      redirect_to '/register'
      flash[:error] = user.errors.full_messages
    end
  end

  def discover
    @user = User.find(params[:id])
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to "/dashboard"
    else
      flash[:error] = "Incorrect Credentials"
      render :login_form
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
