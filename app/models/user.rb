class User < ApplicationRecord
  
  has_many :sites

  enum role: {:full_access => 0, :restricted_access => 1}


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  mount_uploader :photoavatar, PhotoavatarUploader

  # Pesquisa todos os usuarios cadastros no site do usuario corrente menos o usuario corrente em ordem decrescente com limitação
  scope :admins_for_any_sites, -> (quantity, user_id) { limit(quantity).all.joins(:sites).where.not(id: user_id).order(created_at: :desc) }

  # Pesquisa a quantidade de usuarios do site do usuario logado
  scope :admins_count_for_site, -> (user_id) { joins(:sites).where(:id == user_id).size }

end
