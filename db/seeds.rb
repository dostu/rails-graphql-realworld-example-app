# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

eric = User.create!(
  username: 'Eric Simons',
  email: 'eric@example.com',
  bio: "Cofounder @GoThinkster, lived in Aol's HQ for a few months, kinda looks like Peeta from the Hunger Games",
  password: 'secret',
  image: 'http://i.imgur.com/Qr71crq.jpg'
)

albert = User.create!(
  username: 'Albert Pai',
  email: 'albert@example.com',
  password: 'secret',
  image: 'http://i.imgur.com/N4VcUeJ.jpg'
)

dostu = User.create!(
  username: 'dostu',
  email: 'donatas.stundys@gmail.com',
  bio: 'GraphQL enthusiast',
  password: 'secret',
  image: 'https://image.ibb.co/gH6AUo/dostu.jpg'
)

eric.followees << dostu
eric.followees << albert

10.times { |i|
  Article.create!(
    title: "Eric article ##{i}",
    description: 'This is the description for the post.',
    body: "Web development technologies have evolved at an incredible clip over the past few years.\n\n## Introducing RealWorld.\n\nIt's a great solution for learning how other frameworks work.",
    tag_list: 'graphql',
    author: eric
  )
}

10.times { |i|
  Article.create!(
    title: "Albert article ##{i}",
    description: 'This is the description for the post.',
    body: "Web development technologies have evolved at an incredible clip over the past few years.\n\n## Introducing RealWorld.\n\nIt's a great solution for learning how other frameworks work.",
    tag_list: 'graphql',
    author: albert
  )
}

article = Article.create!(
  title: 'How to build webapps that scale',
  description: 'This is the description for the post.',
  body: "Web development technologies have evolved at an incredible clip over the past few years.\n\n## Introducing RealWorld.\n\nIt's a great solution for learning how other frameworks work.",
  tag_list: ['rails', 'graphql'],
  author: dostu
)

eric.favorite_articles << article
albert.favorite_articles << article
