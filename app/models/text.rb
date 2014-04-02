class Text < ActiveRecord::Base
  attr_accessible :date, :message, :datetime, :title
  belongs_to :user

  default_scope order('created_at DESC')
end
