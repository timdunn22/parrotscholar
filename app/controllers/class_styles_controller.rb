class ClassStylesController < ApplicationController

  def new
    @user = current_user
    if $user_type != "student" || $user_type != "teacher" || $user_type !=
      "entrepreneur"
      $user_type = "student"
    end
    if $user_type == "student"
      @other_user = "teacher"

    elsif $user_type == "teacher"
      @other_user = "student"
    end
    if $user_type == "teacher" || $user_type == "student"
      @heading_styles = "I am interested in classes where I would be"
      @types_string ||= ["alone with one #{@other_user}","alone with many #{@other_user}s",
        "with other #{$user_type}s and one #{@other_user}",
       "with many students and many teachers", "with an institute"]
    elsif $user_type == "entrepreneur"
      @heading_styles = "I am interested in providing classes that would consist of the following at my institute:"
      @types_string ||= ["one student and one teacher","one student and many teachers","many students and one teacher","many students and many teachers"]
    end
    @types_hash = Hash[$types.zip @types_string]


  end

  def create
    redirect_to new_attachment_path
  end
  def index
  end
end
