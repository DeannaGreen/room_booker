class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :roombookings

  after_create :create_tenant

  attr_accessor :admin

	private

		def create_tenant
			Apartment::Tenant.create(subdomain)
		end

end
