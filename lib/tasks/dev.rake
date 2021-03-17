desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  User.destroy_all
  
  Top.destroy_all
  # p "Added #{User.count} Users"
  # p "Added #{Top.count} Tops"
  # names = ["Michelle", "Lily", "Mary"]
  # id = [2,3,4]
  #   3.times do |count|
  #   user = User.new
  #   user.username = names.at(count)
  #   user.id = id.at(count)
  #   user.password = "my_password"
  #   user.save
  # end
  # p "Added #{User.count} Users"
  require 'faker'
  10.times do
    user = User.new 
    # user.id = Faker::Number.number(digits: 4)
    user.username = Faker::Name.first_name 
    user.email = Faker::Internet.email
    user.password = "my_password"
    user.save
    
    p user.errors.full_messages
  end
  p "Added #{User.count} Users"
  p User.first.email
  50.times do
    top = Top.new
    # top.id = Faker::Number.number(digits: 4)
    top.brand = Faker::GreekPhilosophers.name
    top.image = Faker::Company.logo
    top.price = Faker::Number.decimal(l_digits: 2)
    top.user_id = User.all.sample.id
    top.save
    p top.errors.full_messages
  end
  p "Added #{Top.count} Tops"

end
