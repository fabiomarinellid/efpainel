class Lanchonetedotrom::HomeController < ApplicationController
  layout "lanchonetedotrom"

  
  def index

    Site.all.each do |site|

      if request.subdomain == site.url
       CarregarSite(site.id)
       return
      else
        CarregarSite(Site.first)
      end

    end

  end

  private

  def CarregarSite(siteParam)
    session[:current_site_id] = siteParam

    @titulos = Title.all.where(site_id: siteParam)
    @phones = Phone.all.where(site_id: siteParam)
    @addresses = Address.all.where(site_id: siteParam)
    @bestproducts = Item.all.where(bestseller: :highlight, site_id: siteParam)
    @categories = Item.all.where(active: :enable, site_id: siteParam).group("category_id")
    @products = Item.all.where(active: :enable, site_id: siteParam)
    @observations = Observation.all.where(active: :enable, site_id: siteParam)
  end

end
