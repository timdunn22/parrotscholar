module ApplicationHelper
  def simple_date(date)
    date.strftime("%B %d, %Y")
  end
  def columns_to_string(column)
    new_column = column.split('_')
    new_column.each do |col|
      col.capitalize!
    end
    new_column.join(" ")
  end
  def user_types_route(user_type,action="new",user=nil)
     
    if action != "new"
      user_pass_in = user.send(user_type).id
      eval("#{action}_#{user_type}_path(#{user_pass_in})")
    else
      self.send("#{action}_#{user_type}_path")
    end
  end
end
