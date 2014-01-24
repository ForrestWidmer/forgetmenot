class Message < ActiveRecord::Base
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::AttributeMethods

  attr_accessible :body, :company, :email, :name, :subject


  validates :name, :email, :subject, :body, :presence => true
  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => false
  
  
end
