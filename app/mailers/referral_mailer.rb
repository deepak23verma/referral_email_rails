class ReferralMailer < ActionMailer::Base
  default from: "no-reply@eprof.com"

  def invite_email(referral)
    @referral = referral
    @user = referral.user
    mail(:to => referral.email, :subject => "#{@user.first_name.capitalize} has invited you to eProf")
  end
end
