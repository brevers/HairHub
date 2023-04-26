
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

Agency.find_or_create_by(name: "Jane's Co") do |agency|
  agency.owner = jane
  agency.pitch = "Best company in town"
  agency.latitude = 53.350140
  agency.longitude = -6.266155
end

Agency.find_or_create_by(name: "Grace's Co") do |agency|
  agency.owner = grace
  agency.pitch = "Far away but the better"
  agency.latitude = 53.350140
  agency.longitude = -6.266155
end
