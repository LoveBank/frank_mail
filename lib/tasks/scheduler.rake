desc "This task is called by the Heroku scheduler add-on"

task :send_daily => :environment do
  user = Frank::Profile.where(email: 'jaredljennings@gmail.com')
  puts "Sending daily love report to #{user.email}"
  LoveReport.send_daily_report(user)
end