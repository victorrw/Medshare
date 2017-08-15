module UsersHelper
  def user_picture
    current_user.facebook_picture_url || "no-avatar.gif"
  end

  def current_user_meds_available
    meds_available = @meds.where(share_id: nil)
    sort_reverse(meds_available)
  end

  def current_user_shares_waiting_on_donor
    shares_waiting = Share.where(taker_id: current_user.id).where(status: "requested")
    sort_reverse(shares_waiting)
  end

  def current_users_shares_to_approve
    shares_to_approve = []
    @shares.each do |share|
      if share.giver == current_user && share.status == "requested"
      shares_to_approve << share
      end
    end
    sort_reverse(shares_to_approve)
  end

  def current_users_shares_sent
    shares_sent = []
    @shares.each do |share|
      if share.giver == current_user && share.status == "sent" || share.status == "received"
      shares_sent << share
      end
    end
    sort_reverse(shares_sent)
  end

  def current_users_meds_sent
    meds_sent = Share.where(taker_id: current_user.id).where(status: "sent")
    sort_reverse(meds_sent)
  end

  def current_users_meds_received
    meds_received = Share.where(taker_id: current_user.id).where(status: "received")
    sort_reverse(meds_received)
  end

  private

    def sort_reverse(shares)
      shares.sort.reverse
    end

end
