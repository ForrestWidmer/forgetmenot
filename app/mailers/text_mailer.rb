class TextMailer < ActionMailer::Base
  default from: "from@example.com"

  def text_message(text)
    @number = text.user.mobile_number
    @carrier = text.user.mobile_carrier
    @text = text
    mail(:to => "#{@number}#{@carrier}", :body => "#{text.message}" )
  end
end
