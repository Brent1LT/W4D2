# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



ActiveRecord::Base.transaction do 
  Cat.destroy_all

  cat1 = Cat.create!(name: "Mittens", birth_date: '1981/01/01', color: "Calico", sex: "M", description: "Mittens is a cat that likes long walks on the beach.")
  cat2 = Cat.create!(name: "Tama", birth_date: '2019/01/28', color: "Tabby", sex: "F", description: "Tama can be lazy but loves to eat.")
  cat3 = Cat.create!(name: "Cynthia", birth_date: '2010/05/07', color: "Black", sex: "F", description: "Cynthia teaches other cats how to be better cats.")
  

end 