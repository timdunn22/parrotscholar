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
  def user_types_route(user_type)
    if user_type == "student"
      new_student_path
    elsif user_type == "teacher"
      new_teacher_path
    elsif user_type == "entrepreneur"
      new_entrepreneur_path
    end      
  end
end
