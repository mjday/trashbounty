require 'open-uri'
require 'json'

puts "Starting....."

1.times do |i|
  main_collector = User.create!(
    email: "komang@gmail.com",
    password: "123456",
    username: "Komang",
    phone_number: Faker::PhoneNumber.phone_number,
    bitcoin_address: "n4ZGR4MV4JhwSXjqoWREWnJVNRsje2EdiP"
    # btc address may still need to be defined
  )
end

# can I do this above


19.times do |i|
  user_collector = User.create!(
    email: Faker::Internet.email,
    password: "123456",
    username: Faker::Name.first_name,
    phone_number: Faker::PhoneNumber.phone_number,
    bitcoin_address: "n3mBTZS2goGk4MLi5NE96oEFzc5wrS9HVe"
  )
end

400.times do |i|
  user_bank = User.create!(
    email: Faker::Internet.email,
    password: "123456",
    username: Faker::Name.first_name,
    phone_number: Faker::PhoneNumber.phone_number,
    business: true,
    bitcoin_address: "n1GZnGFGszuyt6rL2nbJLo9yY635drJAFR"
    # btc address may still need to be randomised
  )
end

filepath = File.join(Rails.root, 'seeds.json')
serialized_banks = File.read(filepath)

banks = JSON.parse(serialized_banks)

rates = [0.35, 0.3, 0.25, 0.2, 0.15, 0.27, 0.18, 0.22, 0.32 ]
plastic_type = [ "PET", "HDPE", "LDPE", "PP" ]
i = 0
# make sure the number is correct
banks.first(400).each do |bank|
  id = 21
  bk = Bank.create!(
    name: bank["name"],
    address: bank["address"],
    phone_number: bank["phone_number"],
    website: bank["website"],
    country: bank["country"],
    products_accepted: bank["products_accepted"],
    user: User.find(id),
    # how to get all banks into the database with new users and business == true
  )
  plastic_type.each do |p|
    Plastic.create!(
      name: p,
      price_per_kg: rates.sample,
      bank: bk
    )
  end
  id += 1
end

ratings = [3, 4, 5]
comments = ["Great, would recommend", "Good", "Okay", "Could have been better", "Fast and efficient process", "Good, but slow payment", "Superb, my favourite bank"]
types = ["Bitcoin", "Cash"]
100.times do |i|
  # make sure the amount of transactions is correct
  verification = Verification.create!(
    date: Date.new(2019,5,10) + i,
    # new date attempt
    total_kg: rand(1..10),
    payment_type: types.sample,
    bank: Bank.all.sample
  )
  collection = Collection.new(
    date: verification.date,
    total_kg: verification.total_kg,
    payment_type: verification.payment_type,
    user: User.where(business: false).sample,
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
