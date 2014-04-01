class TextSender
  @queue = :texts_queue
  def self.perform(text)
    #text = Text.find(text_id)
    TextMailer.text_message(text).deliver
  end
end