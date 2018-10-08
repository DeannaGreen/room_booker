class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_validation :downcase_subdomain
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :roombookings
  
  
	private
  def downcase_subdomain
            self.subdomain = subdomain.try(:downcase) 
  end 
  
end
