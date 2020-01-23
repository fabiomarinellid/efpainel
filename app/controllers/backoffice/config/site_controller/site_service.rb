class Backoffice::Config::SiteController::SiteService
	attr_accessor :site
    
    def self.create(params_site)
    	@site = Site.new(params_site)

        if @site.valid?
        	@site.save!
        end

        @site
    end
end