class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_user_by_token, only: [:confirm]
  before_action :user_access, only: [:show]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(user_params[:email])

    respond_to do |format|
      return redirect_to @user if @user
      @user = User.new(user_params)
      @user.ip_address = request.remote_ip
      @user.token = Devise.friendly_token
      @user.inviter = User.find_by_token(user_params[:ref])

      if @user.save
        if @user.inviter
          next_milestone = Milestone.find_by_referals_count(@user.inviter.referals.size)
          @user.inviter.milestones << next_milestone if next_milestone
        end
        format.html { redirect_to @user }
      else
        format.html { render :new }
      end
    end
  end

  def confirm
    if !@user.confirmed_at && @user.confirmed_at = DateTime.now
      respond_to { |format| format.html { redirect_to @user } if @user.save }
    end
  end

  private

  def user_access
    return redirect_to action: :new unless @user.confirmed_at
  end

  def user_params
    params.require(:user).permit(:email, :token, :ref, :ip_address)
  end

  def set_user_by_token
    @user = User.find_by_token(params[:token])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
