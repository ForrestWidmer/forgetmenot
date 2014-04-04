class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :time_zone, 
                  :mobile_carrier, :mobile_number
  has_many :texts

  before_create :set_member

  ROLES = %w[member paid admin]
  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  CARRIER_OPTIONS =  { :Alltell=>"@message.alltel.com", 
    :ATT=>"@txt.att.net", :"Boost Mobile"=>"@myboostmobile.com", 
    :"Comcast PCS"=>"@comcastpcs.textmsg.com", :Cricket=>"@sms.mycricket.com", 
    :"Metro PCS"=>"@mymetropcs.com", :Nextel=>"@messaging.nextel.com", 
    :Qwest=>"@qwestmp.com", :"Sprint PCS"=>"@messaging.sprintpcs.com", 
    :"T-Mobile"=>"@tmomail.net", :Tracfone=>"@mmst5.tracfone.com", 
    :"Virgin Mobile"=>"@vmobl.net", :"Verizon Wireless"=>"@vtext.com" }

  private

  def set_member
    self.role = "member"
  end
end
