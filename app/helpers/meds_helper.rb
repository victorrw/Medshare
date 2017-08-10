module MedsHelper
  def donator_picture
    @med.user.facebook_picture_url || "no-avatar.gif"
  end
end
