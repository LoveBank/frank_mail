module LoveReportHelper

  def average_rating(user)
    @user = user
    @user.partners_entries.average(:rating)
  end

  def last_weeks_average_rating(user)
    @user = user
    @entries = @user.partners_entries#.group_by_week(:created_at, last: 2, current: false)#.count.average(:rating)
    @result = @entries.group_by_week(:created_at, last: 1, current: false).average(:rating)
    @result.first[1]
  end


end