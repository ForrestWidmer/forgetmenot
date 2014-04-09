class TextsController < ApplicationController

  def index
    if current_user
      @texts = current_user.texts.all
    else
      flash[:notice] = "You must be signed in to view your texts."
      redirect_to root_path
    end
  end

  def show
    @text = Text.find(params[:id])
  end

  def new
    @text = Text.new
    authorize! :create, Text, message: "You need to sign up for a free account to submit texts!"
  end

  def create
    @user = current_user
    @text = current_user.texts.build(params[:text])
    authorize! :create, @text, message: "You need to be signed up to do that!"
    if @text.save
      TextMailer.delay(run_at: @text.datetime).text_message(@text)
      flash[:notice] = "New text message created."
      redirect_to texts_path
    else
      flash[:error] = "There was a problem saving your text message, please try again."
      render :new
    end
  end

  def edit
    @text = Text.find(params[:id])
    authorize! :edit, @text, message: "You need to own the text to access it."
  end

  def update
    @text = Text.find(params[:id])
    authorize! :update, @text, message: "You need to own the text to access it."
    if @text.update_attributes(params[:text])
      flash[:notice] = "Text message updated"
      redirect_to @text
    else
      flash[:error] = "There was a problem updating your text message, please try again."
      render :edit
    end
  end

  def destroy
    @text = Text.find(params[:id])
    @text.destroy
    if @text.destroy
      flash[:notice] = "Text deleted!"
      redirect_to texts_path
    end
  end
end
