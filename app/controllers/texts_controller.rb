class TextsController < ApplicationController

  def index
    @texts = Text.all
  end

  def show
    @text = Text.find(params[:id])
  end

  def new
    @text = Text.new
  end

  def create
    @text = Text.new(params[:text])
    if @text.save
      TextMailer.delay(run_at: @text.datetime).text_message(@text)#delay(run_at: 2.minutes.from_now).text_message(@text)
      flash[:notice] = "New text message created."
      redirect_to @text
    else
      flash[:error] = "There was a problem saving your text message, please try again."
      render :new
    end
  end

  def edit
    @text = Text.find(params[:id])
  end

  def update
    @text = Text.find(params[:id])
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
