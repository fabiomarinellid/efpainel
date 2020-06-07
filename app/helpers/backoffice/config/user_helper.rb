module Backoffice::Config::UserHelper
	OptionsForRoles = Struct.new(:id, :description)

	def options_for_roles
	  options = []

	  User.roles_i18n.each do |key, value|

		if key != "developer"
			options.push(OptionsForRoles.new(key, value))
		end
	  end

	  options
	end
end
