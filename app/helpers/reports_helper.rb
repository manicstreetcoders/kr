module ReportsHelper
  include ActsAsTaggableOn::TagsHelper

  def report_file_extension( report )
    if report && report.document_file_name
      split = report.document_file_name.split(".")
      if split
        extension = split.last
        if extension
          return extension.upcase
        end
      end
    end
    return "Unknown"
  end

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
