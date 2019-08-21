require 'open-uri'
require 'json'

puts "Starting....."

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
plastic_type = [ "PET", "HDPE", "LDPE", "PP" ]
i = 0
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
  plastic_type.each do |p|
    Plastic.create!(
      name: p,
      price_per_kg: rates.sample,
      bank: bk
    )
  end
end

ratings = [3, 4, 5]
comments = ["Great, would recommend", "Good", "Okay", "Could have been better", "Fast and efficient process", "Good, but slow payment", "Superb, my favourite bank"]
types = ["Bitcoin", "Cash"]
40.times do |i|
  verification = Verification.create!(
    date: Date.today + rand(1..5),
    total_kg: rand(1..50),
    payment_type: types.sample,
    bank: Bank.find(rand(Bank.first.id..Bank.count))
  )
  collection = Collection.new(
    date: verification.date,
    total_kg: verification.total_kg,
    payment_type: verification.payment_type,
    user: User.find(rand(1..10)),
    bank: verification.bank,
    verification: verification
  )
  collection.total_amount = collection.total_kg * rates.sample
  collection.save!
  review = Review.create!(
    rating: ratings.sample,
    comment: comments.sample,
    collection: collection,
    user: collection.user
  )
end

puts "Database ready"
