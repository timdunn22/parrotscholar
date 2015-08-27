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


  private
    def student_params
      params.require(:student).permit(:self_description,
      :course_type,:counselor_interest)
    end

end
