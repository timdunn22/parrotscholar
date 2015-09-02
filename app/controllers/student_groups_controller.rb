class StudentGroupsController < ApplicationController
  def new
    @student_group = StudentGroup.new
    @group_action = "Create"
    @student_group_member = current_user.student_group_members.build
  end
  def create
    @student_group = StudentGroup.new(student_group_params)

    if @student_group.save
      flash[:notice] = "You are now signed up for a new student group!"
      redirect_to current_user
    else
      flash[:error] = "There was an error making your student group"
      redirect_to :back
    end
  end

  def edit
    @student_group = StudentGroup.find(params[:id])
    @student_group_member = StudentGroupMember.find_by(student_group_id: @student_group.id)
    @group_action = "Update"
  end

  def show
  end

  def update
    @student_group = StudentGroup.find(params[:id])

    if @student_group.update_attributes(student_group_params)
      redirect_to current_user, :notice => "Successfully updated the student group"
    else
      flash[:alert] = "There was an error updating the group"
      render :edit
    end

  end
  private
    def student_group_params
      params.require(:student_group).permit(:name,:preferred_size,:expectations_description,:price_range,
      student_group_members_attributes: [:role, :role_description, :user_id, :_destroy])
    end
end
