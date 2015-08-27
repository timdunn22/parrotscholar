class LinksController < ApplicationController
  #  skip_before_action :verify_authenticity_token
  def new
    @link = Link.new
  end
  def create
    @link = current_user.links.build(link_params)
    @link.user = current_user

    if @link.save
      flash[:notice] = "The links were created"
      @link = Link.new
    else
      flash[:notice] = "There was an error saving the links"
    end
    respond_to  do |format|
      format.html
      format.js
    end
  end
  def add_other
    @link = Link.new
    respond_to  do |format|
      format.html
      format.js
    end
  end

  private
    def link_params
      params.require(:link).permit(:name,:link_content)
    end
end
