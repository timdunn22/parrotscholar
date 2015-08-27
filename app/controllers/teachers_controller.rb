class TeachersController < ApplicationController
  def new
    $user_type = "teacher"
    @teacher = Teacher.new
  end
  def create
    @user = current_user
    @teacher = Teacher.new(teacher_params)
    @user.teacher = @teacher
    if current_user.present?
      @user = current_user
    end

    if @teacher.save
      redirect_to new_users_interest_path
      #flash[:notice] = "Comment was created."
    else
      flash[:error] = "There was an error with the information you provided. Please try again."
    end
  end

  private
    def teacher_params
      params.require(:teacher).permit(:hire_description,
      :course_type,:price_negotiation)

    end
end
