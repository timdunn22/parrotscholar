class StudentsController < ApplicationController
  def new

    @student = Student.new
  end

  def create
    @user = current_user
    @student = Student.new(student_params)
    @user.student = @student
    if current_user.present?
      @user = current_user
    end

    if @student.save
      redirect_to new_users_interest_path
      #flash[:notice] = "Comment was created."
    else
      flash[:error] = "There was an error with the information you provided. Please try again."
    end

  end
  def edit
    @student = Student.find(params[:id])
  end
  def update
    @student = Student.find(params[:id])
    @user = @student.user
    if @student.update_attributes(student_params)
      redirect_to @user, :notice => "Your student information was updated successfully!"
    else
      redirect_to @user, :alert => "There was an ERROR updating your student information!"
    end
  end
  private
    def student_params
      params.require(:student).permit(:self_description,
      :course_type,:counselor_interest)
    end

end
