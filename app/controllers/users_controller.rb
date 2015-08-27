class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def create
     User.create!(user_params)
    #  @user = User.new(user_params)
    # if @user.save
    #   redirect_to @survey, :notice => "Successfully created user."
    # else
    #   render :action => 'new'
    # end
  end
  def show

    @attachments = Attachment.where(user_id:current_user.id)
    @user = User.find(params[:id])
    @users_preferences = @user.profile_preferences
    if current_user.present? && @user == current_user
      if (Teacher.find_by_user_id(current_user.id) != nil) || (Student.find_by_user_id(current_user.id) != nil) || (Counselor.find_by_user_id(current_user.id) != nil) || (Entrepreneur.find_by_user_id(current_user.id) != nil)
        @all_signed_up = true
      else
        @all_signed_up = false
      end
    end
    @types = user_types(@user)


  end

  def update

    if params[:user][:user_type] == 'Student'
      $user_type = 'student'
      redirect_to new_student_path
    elsif params[:user][:user_type] == 'Teacher'
      $user_type = "teacher"
      redirect_to new_teacher_path
    elsif params[:user][:user_type] == 'Entrepreneur'
      redirect_to new_entrepreneur_path
    end
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to @user, :notice  => "Successfully updated user."
    else
      redirect_to @user, :notice => "Couldn't update the user"
    end

  end


  private

  def user_params
    params.require(:user).permit(:name, :avatar, :avatar_cache,
    :skill_description, :degree, :gender, :birthday, :provider, :uid,
    attachments_attributes: [:file_name, :file_description, :file_type,:_destroy],
    class_styles_attributes: [$styles, :_destroy],
    class_types_attributes: [$types, :_destroy],
    profile_policies_attributes: [$param_preferences, :_destroy],
    users_interests_attributes: [:subject, :competency, :active,:user_type, :_destroy])
  end
end
