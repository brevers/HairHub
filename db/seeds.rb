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

Agency.find_or_create_by(name: "Jane's Co") do |agency|
  agency.owner = jane
  agency.pitch = "Best company in town"
  agency.latitude = 41.0082
  agency.longitude = 28.9784
end

grace_agency = Agency.find_or_create_by(name: "Grace's Co") do |agency|
  agency.owner = grace
  agency.pitch = "Far away but way the better :)"
  agency.latitude = 39.9334
  agency.longitude = 32.8597
  agency.phone = "(123) 456 7890"
end

Agency.find_or_create_by(name: "Bronce") do |agency|
  agency.owner = elon
  agency.pitch = "Best hair in town"
  agency.latitude = 38.4237
  agency.longitude = 27.1428
end


Plan.create! \
    title: "Hair Recovery - Express",
    description: "Three months treatment",
    price: 1_200,
    agency_id: grace_agency.id

Plan.create! \
    title: "Hair Recovery - Long Term",
    description: "Six months treatment",
    price: 2_000,
    agency_id: grace_agency.id



