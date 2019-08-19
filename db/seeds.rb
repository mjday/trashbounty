require 'open-uri'
require 'json'

10.times do |i|
  user_collector = User.create!(
    email: Faker::Internet.email,
    password: "123456",
    username: Faker::Name.first_name,
    phone_number: Faker::PhoneNumber.phone_number,
    bitcoin_address: "1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa"
  )
end

10.times do |i|
  user_bank = User.create!(
    email: Faker::Internet.email,
    password: "123456",
    username: Faker::Name.first_name,
    phone_number: Faker::PhoneNumber.phone_number,
    business: true,
    bitcoin_address: "1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa"
  )
end

filepath = File.join(Rails.root, 'seeds.json')
serialized_banks = File.read(filepath)

banks = JSON.parse(serialized_banks)

rates = [0.35, 0.3, 0.25, 0.2, 0.15, 0.27, 0.18, 0.22, 0.32 ]
# materials_accepted = ["ABS", "HDPE", "HIPS", "LDPE", "LLDPE", "PA",
#   "PC", "PE", "PET", "PP", "PS", "PVC", "WastePlastic"]
plastic_type = [ "PET", "HDPE", "LDPE", "PP" ]

banks.first(10).each do |bank|
  bk = Bank.create!(
    name: bank["name"],
    address: bank["address"],
    phone_number: bank["phone_number"],
    website: bank["website"],
    country: bank["country"],
    products_accepted: bank["products_accepted"],
    user: User.find(rand(11..20)),
  )
  # create 1..4 materials (plastic_types)
  (1..4).to_a.sample.times do
    Plastic.create!(
      name: plastic_type.sample,
      price_per_kg: rates.sample,
      bank: bk
    )
  end
end

types = ["Bitcoin", "Cash"]
10.times do |i|
  collection = Collection.new(
    date: Date.today + rand(1..5),
    total_kg: rand(1..50),
    payment_type: types.sample,
    user: User.find(rand(1..10)),
    bank: Bank.find(rand(Bank.first.id..Bank.count))
  )
  collection.total_amount = collection.total_kg * rates.sample
  collection.save!
end

ratings = [1, 2, 3, 4, 5]
comments = ["Great", "Good", "Okay", "Poor", "Terrible"]
10.times do |i|
  review = Review.create!(
    rating: ratings.sample,
    comment: comments.sample,
    collection: Collection.find(rand(1..10))
  )
end
