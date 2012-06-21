module ReportsHelper
  def ago( created_at )
    i = (Date.today - created_at.to_date).to_i
    if i < 0 then
      i = 0
    end
    "#{i}d ago"
  end
end
