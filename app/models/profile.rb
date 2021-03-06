class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :site

  scope :profile, -> (user, site) { all.where(user_id: user, site_id: site, active: 1) }
  scope :profile_views, -> (user, site) { all.where(user_id: user, site_id: site, active: 1, read: 1) }

  scope :read_permit, -> (profile, user, site) { where(code: profile, user_id: user, site_id: site, active: 1, read: 1).size }
  scope :create_permit, -> (profile, user, site) { where(active: 1, create: 1, code: profile, user_id: user, site_id: site ).size }
  scope :edit_permit, -> (profile, user, site) { where(active: 1, edit: 1, code: profile, user_id: user, site_id: site ).size }
  scope :erase_permit, -> (profile, user, site) { where(active: 1, erase: 1, code: profile, user_id: user, site_id: site ).size }

  scope :route_current_site, -> (site, user) { where(site_id: site, user_id: user, code: 18) }

  
  def self.insert_profiles(read, create, edit, erase, user, site, dominio)

    Profile.create(
      [
        { :code =>  1, :description =>  'Principal', :father =>  nil ,:route =>  nil ,:read =>  read ,:create =>  0 ,:edit =>  0 ,:erase =>  0 ,:active =>  1 ,:order =>  1 ,:icon =>  nil ,:user_id =>  user ,:site_id =>  site, :level =>  1, :controller_name =>  'main' },
        { :code =>  2, :description =>  'Dashboard', :father =>  1 ,:route =>  'backoffice_dashboard_index_path' ,:read =>  read ,:create =>  0 ,:edit =>  0 ,:erase =>  0 ,:active =>  1 ,:order =>  2 ,:icon =>  'fas fa-chart-line' ,:user_id =>  user ,:site_id =>  site, :level =>  2, :controller_name => 'dashboard'  },
        { :code =>  3, :description =>  'Sites', :father =>  1 ,:route =>  'backoffice_config_site_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  3 ,:icon =>  'icon-website' ,:user_id =>  user ,:site_id =>  site, :level =>  2, :controller_name => 'site'  },
        { :code =>  4, :description =>  'Admins', :father =>  1 ,:route =>  'backoffice_config_user_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  4 ,:icon =>  'fas fa-users' ,:user_id =>  user ,:site_id =>  site, :level =>  2, :controller_name => 'user'  },
        { :code =>  5, :description =>  'Cadastros', :father =>  nil ,:route =>  nil ,:read =>  read ,:create =>  0 ,:edit =>  0 ,:erase =>  0 ,:active =>  1 ,:order =>  5 ,:icon =>  nil ,:user_id =>  user ,:site_id =>  site, :level =>  1, :controller_name =>  'register'  },
        { :code =>  6, :description =>  'Info', :father =>  5 ,:route =>  nil ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  6 ,:icon =>  'fas fa-info' ,:user_id =>  user ,:site_id =>  site, :level =>  3, :controller_name =>  'info'  },
        { :code =>  7, :description =>  'Titulos', :father =>  6 ,:route =>  'backoffice_config_title_index_path' ,:read =>  read ,:create =>  0 ,:edit =>  edit ,:erase =>  0 ,:active =>  1 ,:order =>  7 ,:icon =>  'fas fa-heading' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'title'  },
        { :code =>  8, :description =>  'Sobre', :father =>  6 ,:route =>  'backoffice_config_about_index_path' ,:read =>  read ,:create =>  0 ,:edit =>  edit ,:erase =>  0 ,:active =>  1 ,:order =>  8 ,:icon =>  'fas fa-address-card' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'about'  },
        { :code =>  9, :description =>  'Cardápio', :father =>  5 ,:route =>  nil ,:read =>  read ,:create =>  0 ,:edit =>  0 ,:erase =>  0 ,:active =>  1 ,:order =>  9 ,:icon =>  'fas fa-list' ,:user_id =>  user ,:site_id =>  site, :level =>  3, :controller_name =>  'menu'  },
        { :code =>  10, :description =>  'Categoria', :father =>  9 ,:route =>  'backoffice_product_category_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  10 ,:icon =>  'icon-list' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'category'  },
        { :code =>  11, :description =>  'Etiquetas', :father =>  9 ,:route =>  'backoffice_product_label_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  11 ,:icon =>  'fas fa-tags' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'label'  },
        { :code =>  12, :description =>  'Produtos', :father =>  9 ,:route =>  'backoffice_product_product_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  12 ,:icon =>  'fas fa-hamburger' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'product'  },
        { :code =>  13, :description =>  'Obs', :father =>  9 ,:route =>  'backoffice_product_observation_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  13 ,:icon =>  'fas fa-exclamation' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'observation'  },
        { :code =>  14, :description =>  'Contatos', :father =>  5 ,:route =>  nil ,:read =>  read ,:create =>  0 ,:edit =>  0 ,:erase =>  0 ,:active =>  1 ,:order =>  14 ,:icon =>  'fas fa-address-book' ,:user_id =>  user ,:site_id =>  site, :level =>  3, :controller_name =>  'contact'  },
        { :code =>  15, :description =>  'Telefone', :father =>  14 ,:route =>  'backoffice_contact_phone_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  15 ,:icon =>  'fas fa-mobile-alt' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'phone'  },
        { :code =>  16, :description =>  'Endereço', :father =>  14 ,:route =>  'backoffice_contact_address_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  16 ,:icon =>  'fas fa-map-marked' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'address'  },
        { :code =>  17, :description =>  'Links', :father =>  nil ,:route =>  nil ,:read =>  read ,:create =>  0 ,:edit =>  0 ,:erase =>  0 ,:active =>  1 ,:order =>  17 ,:icon =>  nil ,:user_id =>  user ,:site_id =>  site, :level =>  1, :controller_name =>  'link'  },
        { :code =>  18, :description =>  'Link do Site', :father =>  17 ,:route =>  dominio ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  18 ,:icon =>  'fas fa-link' ,:user_id =>  user ,:site_id =>  site, :level =>  2, :controller_name =>  'site_link'  }
      ]
    )

  end

end
