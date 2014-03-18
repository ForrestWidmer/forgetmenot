class TextMailer < ActionMailer::Base
  default from: "from@example.com"

  def text_message(text)
    @text = text
    mail(:to => "6233021566@tmomail.net", :body => "#{text.message}" )
  end
end
