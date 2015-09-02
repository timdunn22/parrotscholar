class UsersInterestsController < ApplicationController
#   $subjects = ["Technology", "Business & Entrepreneurship",
#      "Finance & Economics", "Humanities and Social Sciences",
# "Mathematics", "Fine Arts", "Biology and Medicine",
# "Agriculture and Environment", "Language and Culture", "Astronomy"]
@interests_count = 0
  def create

    @users_interest = current_user.users_interests.build(users_interests_params)
    if @users_interest.save
      flash[:notice] = "You have added new subjects to your interests."
    else
      flash[:error] = "There was an error adding subjects to your interests."
    end

    redirect_to new_class_style_path
  end

  def new
    $interests_count = 0


    @levels = [1..10]
    if $user_type == "student"
      @user_process_type = "learning"
    elsif $user_type == "teacher"
      @user_process_type = "teaching"
    elsif $user_type == "entrepreneur"
      @user_process_type ="providing at the institute you want to start"
    end

    $subjects.each do | sub|
      current_user.users_interests.build(subject: sub, user_type: $user_type)
    end
  end

  def add_level
    # $interests_count += 1
    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  def index
  end

  def users_interests_params
    params.require(:users_interest).permit(:subject,:competency, :user_type)
  end

end
