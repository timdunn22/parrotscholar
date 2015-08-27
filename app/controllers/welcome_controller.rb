class WelcomeController < ApplicationController
  def index
    redirect_to controller: "users", action: "show", id: current_user.id if current_user.present?
  end
  def about
  end
  def faq
  end
end
