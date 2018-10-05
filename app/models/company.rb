class Company < ApplicationRecord

	after_create :create_tenant

	def self.create_with_admin(company_params, user_params)
		company = Company.new(company_params)
		user = User.new(user_params.merge(admin: true , subdomain:company.subdomain ))
		if company.valid? && user.valid?
			company.save
			Apartment::Tenant.switch(company.subdomain) { user.save }
			company , user
		else
			false , false 
		end
	end

	private

	def create_tenant
		Apartment::Tenant.create(subdomain)
	end
	
end

