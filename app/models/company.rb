class Company < ApplicationRecord

	after_create :create_tenant

	def self.create_with_admin(company_params, user_params)
		company = Company.new(company_params)
		user = User.new(user_params.merge(admin: true , subdomain:company.subdomain ))
		if company.valid? && user.valid?
			company.save

			Apartment::Tenant.switch(company.subdomain) { user.save }
			room = Room.new(:roomname => 'Meeting Room 1')
			room.roombookings.build(:description => 'Happy Muffin Demo , :user_id => user.id)
			room.save
			
			return company , user
		else
			return false , false 
		end
	end

	private

	def create_tenant
		Apartment::Tenant.create(subdomain)
	end
	
end

