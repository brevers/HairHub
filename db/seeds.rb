puts "Seding database..."

User.find_or_create_by(email: "john@example.com") do |user|
  user.name = "John Doe"
  user.password = "123123"
  user.password_confirmation = "123123"
end

jane = User.find_or_create_by(email: "jane@example.com") do |user|
  user.name = "Jane Doe"
  user.password = "123123"
  user.password_confirmation = "123123"
  user.owner!
end

grace = User.find_or_create_by(email: "grace@example.com") do |user|
  user.name = "Grace Doe"
  user.password = "123123"
  user.password_confirmation = "123123"
  user.owner!
end

elon = User.find_or_create_by(email: "elon@example.com") do |user|
  user.name = "Elon Musk"
  user.password = "123123"
  user.password_confirmation = "123123"
  user.owner!
end

# HERE: Use places in Europe :)
Agency.find_or_create_by(name: "Jane's Co") do |agency|
  agency.owner = jane
  agency.pitch = "Best company in town"
  agency.latitude = -34.595255
  agency.longitude = -58.37235390000001
end

Agency.find_or_create_by(name: "Grace's Co") do |agency|
  agency.owner = grace
  agency.pitch = "Far away but way the better :)"
  agency.latitude = -34.5992496
  agency.longitude = -58.3747789
end

Agency.find_or_create_by(name: "Tesla") do |agency|
  agency.owner = elon
  agency.pitch = "We make electric cars"
  agency.latitude = -34.6005397
  agency.longitude = -58.36730120000001
end
