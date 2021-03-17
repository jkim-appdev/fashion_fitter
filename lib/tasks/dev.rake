desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  names = ["Michelle", "Lily", "Mary"]
  id = [2,3,4]
    3.times do |count|
    user = User.new
    user.username = names.at(count)
    user.id = id.at(count)
    user.password = "my_password"
    user.save
  end
  p "Added #{User.count} Users"
  # require 'faker'
  # 99.times do
  #   user = User.new 
  #   user.id = Faker::Number.number(digits: 2)
  #   user.username = Faker::Name.first_name 
  #   user.password = "my_password"
  #   user.save
  # end
  # p "Added #{User.count} Users"
  # 30.times do
  #   top = Top.new
  #   top.id = Faker::Number.number(digits: 2)
  #   top.brand = Faker::GreekPhilosophers.name
  #   top.image = Faker::Company.logo
  #   top.price = Faker::Number.decimal(l_digits: 2)
  #   top.user_id = Faker::Number.number(digits: 2)
  #   top.save
  # end
  # p "Added #{Top.count} Tops"

end
