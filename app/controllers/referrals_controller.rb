class ReferralsController < ApplicationController
  # before_filter :require_login
  before_filter :set_user

  def index
    @referrals = @user.referrals
  end

  def new
    @referral = @user.referrals.build
  end

  def create
    @referral = @user.referrals.build(params[:referral])
    @referral.user_id = current_user.id
    if @referral.save
      ReferralMailer.invite_email(@referral).deliver
      redirect_to user_path(current_user.id), 
      :notice => "Invite sent to #{@referral.first_name}"
    else
      render :new, :notice => "Please fill in all the required fields"
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end
