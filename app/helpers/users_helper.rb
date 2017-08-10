module UsersHelper
  def user_picture
    current_user.facebook_picture_url || "no-avatar.gif"
  end

  def current_user_shares_waiting_on_donor
    @shares_waiting = Share.where(taker_id: current_user.id)
  end

  def current_users_shares_to_approve
    @shares_to_approve = Share.where(taker_id: current_user.id)
  end
end
