class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user, user_params)
                              @user.update(user_params)
                           else
                              @user.update_without_password(user_params)
                           end
    if successfully_updated
      redirect_to @user, notice: "User was successfully update."
    else
      render :edit
    end
  end

  private
    def needs_password?(user, params)
      params[:password].present?
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation,
                                   :role)
    end
end
