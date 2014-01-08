module ApplicationHelper
  def activity_checkbox_checked_value_for(activity)
    query = params[:q] || {}
    user_activity_ids = query[:user_activities_activity_id_eq_any] || []

    user_activity_ids.include?(activity.id)
  end
end
