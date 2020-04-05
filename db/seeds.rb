# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando o Sites Padrão..."

Site.create( name: "Site Padrão", description: "Site com layout padrão para lanchonete" )

puts "Site cadastrados com sucesso!"

puts "Cadastrando o ADMINISTRADOR Padrão..."

User.create(
  email: "admin@admin.com",
  password: "123456",
  password_confirmation: "123456",
  name: "Admin",
  role: 0,
  site: 1
)

puts "ADMINISTRADOR cadastrado com sucesso!"

puts "Cadastrando os TITULOS..."

Title.create( title: 'LANCHONETE DA BARRA', subtitle: 'O melhor lanche de Barra Bonita', text: 'Não deixe de conhecer nossos deliciosos lanches Sempre agradando o seu paladar Aceitamos cartões e entregamos até você', bestsellername: 'Novidades', principalbuttondescription: 'Peça agora mesmo', site: Site.first )

puts "TITULOS cadastrados com sucesso!"

puts "Cadastrando as CATEGORIAS..."

Category.create(description: 'Lanches', site: Site.first)
Category.create(description: 'Bebidas', site: Site.first)
Category.create(description: 'Porções', site: Site.first)
Category.create(description: 'Combo', site: Site.first)

puts "CATEGORIAS cadastradas com sucesso!"

puts "Cadastrando os RÓTULOS..."

Label.create(name: '', description: 'Não adicionar rótulos', site: Site.first)
Label.create(name: 'Novo', description: 'Produtos novos', site: Site.first)
Label.create(name: 'Promoção', description: 'Produtos em promoção', site: Site.first)

puts "RÓTULOS cadastradas com sucesso!"


puts "Cadastrando o Perfil para os módulos do primeiro usuario..."

Profile.create( code: 1, description: 'Principal', father: nil ,route: nil ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 1 ,icon: nil ,user_id: 1 ,site_id: 1, level: 1, controller_name: 'main' )
Profile.create( code: 2, description: 'Dashboard', father: 1 ,route: 'backoffice_dashboard_index_path' ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 2 ,icon: 'fas fa-chart-line' ,user_id: 1 ,site_id: 1, level: 2, controller_name: 'dashboard'  )
Profile.create( code: 3, description: 'Sites', father: 1 ,route: 'backoffice_config_site_index_path' ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 3 ,icon: 'icon-website' ,user_id: 1 ,site_id: 1, level: 2, controller_name: 'site'  )
Profile.create( code: 4, description: 'Admins', father: 1 ,route: 'backoffice_config_user_index_path' ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 4 ,icon: 'icon-user-1' ,user_id: 1 ,site_id: 1, level: 2, controller_name: 'user'  )
Profile.create( code: 5, description: 'Cadastros', father: nil ,route: nil ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 5 ,icon: nil ,user_id: 1 ,site_id: 1, level: 1, controller_name: 'register'  )
Profile.create( code: 6, description: 'Info', father: 5 ,route: nil ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 6 ,icon: 'fas fa-info' ,user_id: 1 ,site_id: 1, level: 3, controller_name: 'info'  )
Profile.create( code: 7, description: 'Titulos', father: 6 ,route: 'backoffice_config_title_index_path' ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 7 ,icon: 'fas fa-heading' ,user_id: 1 ,site_id: 1, level: 4, controller_name: 'title'  )
Profile.create( code: 8, description: 'Sobre', father: 6 ,route: 'backoffice_config_about_index_path' ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 8 ,icon: 'fas fa-address-card' ,user_id: 1 ,site_id: 1, level: 4, controller_name: 'about'  )
Profile.create( code: 9, description: 'Cardápio', father: 5 ,route: nil ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 9 ,icon: 'fas fa-list' ,user_id: 1 ,site_id: 1, level: 3, controller_name: 'menu'  )
Profile.create( code: 10, description: 'Categoria', father: 9 ,route: 'backoffice_product_category_index_path' ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 10 ,icon: 'icon-list' ,user_id: 1 ,site_id: 1, level: 4, controller_name: 'category'  )
Profile.create( code: 11, description: 'Etiquetas', father: 9 ,route: 'backoffice_product_label_index_path' ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 11 ,icon: 'fas fa-tags' ,user_id: 1 ,site_id: 1, level: 4, controller_name: 'label'  )
Profile.create( code: 12, description: 'Produtos', father: 9 ,route: 'backoffice_product_product_index_path' ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 12 ,icon: 'fas fa-hamburger' ,user_id: 1 ,site_id: 1, level: 4, controller_name: 'product'  )
Profile.create( code: 13, description: 'Obs', father: 9 ,route: 'backoffice_product_observation_index_path' ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 13 ,icon: 'fas fa-exclamation' ,user_id: 1 ,site_id: 1, level: 4, controller_name: 'observation'  )
Profile.create( code: 14, description: 'Contatos', father: 5 ,route: nil ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 14 ,icon: 'fas fa-address-book' ,user_id: 1 ,site_id: 1, level: 3, controller_name: 'contact'  )
Profile.create( code: 15, description: 'Telefone', father: 14 ,route: 'backoffice_contact_phone_index_path' ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 15 ,icon: 'fas fa-mobile-alt' ,user_id: 1 ,site_id: 1, level: 4, controller_name: 'phone'  )
Profile.create( code: 16, description: 'Endereço', father: 14 ,route: 'backoffice_contact_address_index_path' ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 16 ,icon: 'fas fa-map-marked' ,user_id: 1 ,site_id: 1, level: 4, controller_name: 'address'  )
Profile.create( code: 17, description: 'Links', father: nil ,route: nil ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 17 ,icon: nil ,user_id: 1 ,site_id: 1, level: 1, controller_name: 'link'  )
Profile.create( code: 18, description: 'Link do Site', father: 17 ,route: 'root_path' ,read: 1 ,create: 1 ,edit: 1 ,erase: 1 ,active: 1 ,order: 18 ,icon: 'fas fa-link' ,user_id: 1 ,site_id: 1, level: 2, controller_name: 'site_link'  )


puts "Módulos cadastrados com sucesso!"
