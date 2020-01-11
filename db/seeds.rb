# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts "Cadastrando o Sites Padrão..."

Site.create( name: 'Site Padrão', description: 'Site com layout padrão para lanchonete' )

puts "Site cadastrados com sucesso!"


puts "Cadastrando o ADMINISTRADOR Padrão..."

User.create(
  email: "admin@admin.com",
  password: "123456",
  password_confirmation: "123456",
  site_id: 1,
  name: "Admin",
  role: 0
)

User.create(
  email: "user@admin.com",
  password: "123456",
  password_confirmation: "123456",
  site_id: 1,
  name: "Admin",
  role: 1
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
