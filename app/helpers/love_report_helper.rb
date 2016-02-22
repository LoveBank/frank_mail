module LoveReportHelper

  def average_rating(user)
    @user = user
    @user.partners_entries.average(:rating).round(2)
  end

  def last_weeks_average_rating(user)
    @user = user
    @entries = Frank::Entry.where('linked_profile_id =? and received = true and private != true', @user.id)
    # TODO: This query could get really big since all results are being loaded.
    # we should only load last weeks results.
    @result = @entries.group_by_week(:created_at, last: 1, current: false).average(:rating)
    @result.first[1].round(2)
  end


end