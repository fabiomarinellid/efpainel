module Backoffice::Product::ProductHelper
	OptionsForActives = Struct.new(:id, :description)

	def options_for_actives
	  options = []

	  Item.actives_i18n.each do |key, value|
	    options.push(OptionsForActives.new(key, value))
	  end

	  options
	end

	OptionsForBestsellers = Struct.new(:id, :description)

	def options_for_bestsellers
	  options = []

	  Item.bestsellers_i18n.each do |key, value|
	    options.push(OptionsForBestsellers.new(key, value))
	  end

	  options
	end
end
