module ReportsHelper
  def ago( created_at )
    i = (Date.today - created_at.to_date).to_i
    if i < 0 then
      i = 0
    end
    "#{i}d ago"
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
