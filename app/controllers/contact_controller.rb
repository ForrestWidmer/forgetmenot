class ContactController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if params[:message]
    ProspectMailer.new_email(@message).deliver
    redirect_to(root_path, :notice => "Message was successfully sent.")
    else
    flash[:alert] = "Please fill all fields."
    render :new
    end
  end
end