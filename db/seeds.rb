# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando o ADMINISTRADOR Padrão..."

User.create(
  email: "admin@admin.com",
  password: "123456",
  password_confirmation: "123456"
)

puts "ADMINISTRADOR cadastrado com sucesso!"

puts "Cadastrando os Sites..."

Site.create( name: 'Admin', description: 'Painel Administrativo' )
Site.create( name: 'Lanchonete do Trom', description: 'Lanchonete do Trom' )

puts "Sites cadastrados com sucesso!"


puts "Cadastrando os TITULOS..."

Title.create( title: 'LANCHONETE DO TROM', subtitle: '', text: 'Não deixe de conhecer nossos deliciosos lanches Sempre agradando o seu paladar Aceitamos cartões e entregamos até você', bestsellername: 'Novidades', site: Site.last )


puts "TITULOS cadastrados com sucesso!"
