class OmniauthCallbacksController < Devise::OmniauthCallbacksController


    def provider
       user = User.process_omniauth(request.env["omniauth.auth"])
       if user.persisted?
         flash.notice = "Signed in!"
         sign_in user

         redirect_to root_url
       else
         session["devise.user_attributes"] = user.attributes
         redirect_to new_user_registration_url
       end
     end

     alias_method :twitter, :provider
     alias_method :facebook, :provider
     alias_method :linkedin, :provider
     alias_method :google_oauth2, :provider

     def after_sign_in_path_for(resource)
       root_url
     end
end
