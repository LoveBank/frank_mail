desc "This task is called by the Heroku scheduler add-on"

task :send_daily => :environment do
  puts "Sending daily love report"
  user = Frank::Profile.where(email: 'jaredljennings@gmail.com')
  LoveReport.send_daily_report(user)
end