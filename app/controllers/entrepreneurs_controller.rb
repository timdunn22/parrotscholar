class EntrepreneursController < ApplicationController
  def new
    @entrepreneur = Entrepreneur.new
    $user_type = "entrepreneur"
  end
  def create
    @user = current_user
    @entrepreneur = Entrepreneur.new(entrepreneur_params)
    @user.entrepreneur = @entrepreneur
    if @entrepreneur.save
      flash[:notice] = "You are now an entrepreneur!"
      redirect_to new_users_interest_path
    else
      redirect :back, notice:  "Please check the information"
    end
  end
  private
    def entrepreneur_params
      params.require(:entrepreneur).permit(:desired_role,:institute_description,:experience_description,
      :institute_policies_interests)
    end

end
