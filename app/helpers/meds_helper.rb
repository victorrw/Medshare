module MedsHelper
  def donator_picture(med)
    med.user.facebook_picture_url || "no-avatar.gif"
  end
end
