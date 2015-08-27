class AttachmentsController < ApplicationController
  def index
    @attachments = Attachment.all
    redirect_to root_path
  end

  def new
    $user_type = "teacher" if Teacher.find_by_user_id(current_user.id) != nil
    gon.file_types = ["test","competency","resume",
      "highschool-transcript","college-transcript","letter-of-recommendation","other"]
    gon.file_types.insert(-2, "free-course","paid-for-course")   if $user_type == "teacher"
    @file_types = gon.file_types
    # respond_to do |format|
    #   format.html
    #   format.js
    # end

  end

  def create

    current_user.update(avatar: params[:avatar])
    # ActionController::Parameters.permit_all_parameters = true

    @attachment = current_user.attachments.build(resume_params)

    if @attachment.save
      redirect_to attachments_path, notice: "The file #{@attachment.file_name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    redirect_to new_link_path, notice:  "The file #{@attachment.file_name} has been deleted."
  end
  def add_file
    respond_to  do |format|
        format.html
        format.js
    end
  end

private
  def resume_params
    params.require(:attachment).permit(:file_name, :file_description, :file_type)
  end

end
