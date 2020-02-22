class Item < ApplicationRecord
  belongs_to :category
  belongs_to :label
  belongs_to :site

  enum active: {:disable => 0, :enable => 1}
  enum bestseller: {:not_highlight => 0, :highlight => 1}

  mount_uploader :photoitem, PhotoitemUploader

  # gem money-rails
  monetize :price_cents

  # Pesquisa a quantidade de produtos
  scope :products_count, -> { all.size }  

  # Pesquisa a quantidade de produtos do site do usuario logado
  scope :products_count_for_site, -> (site_id) { all.where(site_id: site_id).size }  
end
