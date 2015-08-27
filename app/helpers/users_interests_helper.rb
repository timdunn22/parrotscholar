module UsersInterestsHelper
  def get_levels

      "<option>not sure</option><option>1</option><option>2</option><option>3</option>
      <option>4</option><option>5</option><option>6</option>
      <option>7</option><option>8</option><option>9</option>
      <option>10</option>"
  end
  def user_type(user_type)
    if user_type == "student"
      new_student_path
    elsif user_type == "teacher"
      new_teacher_path
    elsif user_type == "entrepreneur"
      new_entrepreneur_path
    end
  end
end
