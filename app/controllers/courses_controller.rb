class CoursesController < ApplicationController
  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      redirect_to root_path, :notice => "You successfully made a course"
    else
      redirect_to root_path, :alert => "There was an error making your course"
    end
  end

  def new
    @course = Course.new
  end

  private

  def course_params
    params.require(:course).permit(:name, :price)
  end

end
