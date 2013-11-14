# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.destroy_all

articles = Article.create([
  {
      title: "My First Article",
      body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat aperiam nam quod architecto totam reprehenderit non exercitationem magnam a ratione.",
      published: false
  },
  {
      title: "My Second Article",
      body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat aperiam nam quod architecto totam reprehenderit non exercitationem magnam a ratione.",
      published: true
  }
])

Comment.create([
  {
    author: "Sophia",
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit, suscipit, fuga, corporis, iure iusto minus quisquam voluptatem eos et tempore qui in cumque officia dolore officiis nihil harum voluptate sed.",
    article: articles[0]
  },
  {
    author: "Bono",
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit, suscipit, fuga, corporis, iure iusto minus quisquam voluptatem eos et tempore qui in cumque officia dolore officiis nihil harum voluptate sed.",
    article: articles[0]
  },
  {
    author: "Madonna",
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit, suscipit, fuga, corporis, iure iusto minus quisquam voluptatem eos et tempore qui in cumque officia dolore officiis nihil harum voluptate sed.",
    article: articles[1]
  }
])