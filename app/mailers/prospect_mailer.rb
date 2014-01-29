class ProspectMailer < ActionMailer::Base
  default from: "cleartime@website.com"

  def new_email(message)
    @message = message
    mail(:to => "cleartimetv@mail.com", 
      :subject => "#{@message.subject}", 
      :body => "#{@message.name} #{@message.company} | #{@message.email} | #{@message.body}" )
  end
end
