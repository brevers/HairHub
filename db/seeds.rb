# frozen_string_literal: true

puts 'Seding database...'

SUBSCRIPTION_PLANS = [
  ["Basic", 49],
  ["Pro", 99]
].freeze

SUBSCRIPTION_PLANS.each do |name, price|
  Subscription.find_or_create_by(name: name) do |s|
    s.price = price
  end
end

User.find_or_create_by(email: 'john@example.com') do |user|
  user.name = 'John Doe'
  user.password = '123123'
  user.password_confirmation = '123123'
end

jane = User.find_or_create_by(email: 'jane@example.com') do |user|
  user.name = 'Jane Doe'
  user.password = '123123'
  user.password_confirmation = '123123'
  user.owner!
end

grace = User.find_or_create_by(email: 'grace@example.com') do |user|
  user.name = 'Grace Doe'
  user.password = '123123'
  user.password_confirmation = '123123'
  user.owner!
end

elon = User.find_or_create_by(email: 'elon@example.com') do |user|
  user.name = 'Elon Musk'
  user.password = '123123'
  user.password_confirmation = '123123'
  user.owner!
end

Agency.find_or_create_by(name: "Jane's Co") do |agency|
  agency.owner = jane
  agency.pitch = 'Best company in town'
  agency.latitude = 41.0082
  agency.longitude = 28.9784
  UserAgency.create(user: jane, agency: agency)
end

Agency.find_or_create_by(name: "Grace's Co") do |agency|
  agency.owner = grace
  agency.pitch = 'Far away but way the better :)'
  agency.latitude = 39.9334
  agency.longitude = 32.8597
  UserAgency.create(user: grace, agency: agency)
  agency.phone = "(123) 456 7890"
>>>>>>> 771bce5202c1e6251f10cb3e73e7b5c3e952babc
end

Agency.find_or_create_by(name: 'Bronce') do |agency|
  agency.owner = elon
  agency.pitch = 'Best hair in town'
  agency.latitude = 38.4237
  agency.longitude = 27.1428
  UserAgency.create(user: elon, agency: agency)
end
