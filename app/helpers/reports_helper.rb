module ReportsHelper
  include ActsAsTaggableOn::TagsHelper

  def avatar_url( user_id)
    user = User.find_by_id(user_id)
    if user
      return user.avatar.url(:thumb)
    else
      return ""
    end
  end

  def email( user_id )
    user = User.find_by_id(user_id)
    if user
      return user.email
    else
      return ""
    end
  end
end
