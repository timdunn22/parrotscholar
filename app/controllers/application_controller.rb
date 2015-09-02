class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # include Variableize
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # $styles = ["instant_messaging", "video_conferencing", "screen_sharing",
  #   "file_sharing", "audio"]
  $types = ["one_one", "one_many", "many_one", "many_many", "institute"]
  $param_preferences = [$preferences, "user_set","user_type"]

  $user_types = ["Nobody","Other students", "Teachers", "Students in my Student Groups",
    "Institutes", "People I specify"]
  $preferences = ["student_groups","schedule","class_enrolled","files_uploaded","profile_details",
    "class_preferences"]
  # $core_user_types = ["teacher", "entrepreneur", "student"]
    # $preferences = ["Nothing","Personal Profile Information", "Files I uploaded",
    # "Kinds of classes I prefer", "Other classes I am enrolled in",
    # "Student groups I am involved in", "my schedule"]
  @user_type
#   @subjects = ["Technology", "Business & Entrepreneurship",
#      "Finance & Economics", "Humanities and Social Sciences",
# "Mathematics", "Fine Arts", "Biology and Medicine",
# "Agriculture and Environment", "Language and Culture", "Astronomy"]
  def user_types(user)
    user_types = []
    types_string = ""
    $core_user_types.each do |type|

      klass = Object.const_get type.capitalize

      if klass.find_by(user_id:user.id) != nil
         user_types << type
      end
    end
    user_types
  end

   protected
     def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_in) {|u| u.permit(:signin, :provider, :uid)}
       ["sign_up","account_update"].each do |par|
         devise_parameter_sanitizer.for(par) {|u| u.permit(:name,:email,
       :username, :password, :password_confirmation, :gender, :avatar,
       :degree, :birthday, :education_level, :skill_description, :provider, :uid,
       attachments_attributes: [:file_name, :file_description, :file_type,:_destroy])}
     end

   end

end
