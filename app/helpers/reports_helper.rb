module ReportsHelper
  include ActsAsTaggableOn::TagsHelper

  def email( user_id )
    user = User.find_by_id(user_id)
    if user
      return user.email
    else
      return ""
    end
  end
end
