class LoveReport < ApplicationMailer
  default :from => 'report@treasury.love'

  # send a daily report
  def send_daily_report(user)
    @user = user
    mail( :to => @user.email,
          :subject => 'Your daily LoveBank report' )
  end
end
