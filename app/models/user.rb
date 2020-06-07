class User < ApplicationRecord
  
  has_many :sites

  enum role: {:developer  => 0, :owner => 1, :maintainer => 2}


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  mount_uploader :photoavatar, PhotoavatarUploader

  # Pesquisa todos os usuarios cadastros no site do usuario corrente menos o usuario corrente em ordem decrescente com limitação
  scope :admins_for_any_sites, -> (param, site, user_id) { all.where("name LIKE ? OR email LIKE ?", "%#{param}%", "%#{param}%").where(site: site).where.not(id: user_id).order(created_at: :desc) }

  # Pesquisa a quantidade de usuarios do site do usuario logado
  scope :admins_count_for_site, -> (site) { where(site: site).size }

end
