desc "Send the daily Love Bank reports"
task :send_daily => :environment do
  Frank::Profile.all.each do |user|
    LoveReport.send_daily_report(user).deliver_later
  end
end