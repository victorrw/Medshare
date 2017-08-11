module UsersHelper
  def user_picture
    current_user.facebook_picture_url || "no-avatar.gif"
  end

  def current_user_meds_available
    meds_available = @meds.where(share_id: nil)
  end

  def current_user_shares_waiting_on_donor
    shares_waiting = Share.where(taker_id: current_user.id).where(status: "requested")
  end

  def current_users_shares_to_approve
    shares_to_approve = []
    @shares.each do |share|
      if share.giver == current_user && share.status == "requested"
      shares_to_approve << share
      end
    end
    shares_to_approve
  end

  def current_users_shares_sent
    shares_sent = []
    @shares.each do |share|
      if share.giver == current_user && share.status == "sent"
      shares_sent << share
      end
    end
    shares_sent
  end

  def current_users_meds_received
    meds_received = Share.where(taker_id: current_user.id).where(status: "sent")
  end
end
