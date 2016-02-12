class LoveReport < ApplicationMailer
  default :from => 'report@treasury.love'

  # send a daily report
  def send_daily_report(user)
    Rails.logger.info "Processing daily report for #{user.email}"
    @user = user
    mail( :to => @user.email,
          :subject => 'Your daily LoveBank report' )
  end
end
