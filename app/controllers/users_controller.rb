class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    return redirect_to action: :new unless @user.confirmed_at
  end

  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      if @user = User.find_by_email(user_params[:email])
        format.html { return redirect_to @user }
      else
        user = User.new(user_params)
        user.ip_address = request.remote_ip
        user.token = Devise.friendly_token
        user.inviter = User.find_by_token(user_params[:ref])
        user.save
        format.html { redirect_to action: :new }
      end
    end
  end

  def confirm
    @user = User.find_by_token(params[:token])
    if !@user.confirmed_at and @user.confirmed_at = DateTime.now
      respond_to { |format| format.html { redirect_to @user } if @user.save }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :token, :ref, :ip_address)
  end
end
