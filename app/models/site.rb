class Site < ApplicationRecord

    scope :names_users_from_site, -> (site) { joins("INNER JOIN users ON users.site = sites.id").select('users.name, sites.id') }
    

end
