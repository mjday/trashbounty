require 'open-uri'
require 'json'

10.times do |i|
  user = User.create!(
    email: Faker::Internet.email,
    password: "123456",
    username: Faker::Name.first_name,
    phone_number: Faker::PhoneNumber.phone_number,
    bitcoin_address: "fhdsbhivbiqwb38434b"
  )
end

filepath = File.join(Rails.root, 'db', 'seeds', 'filepath.json')
serialized_banks = File.read(filepath)

banks = JSON.parse(serialized_banks)

banks.each do |bank|
  bk = Bank.create!(
    name: bank["name"],
    address: bank["address"],
    phone_number: bank["phone_number"],
    website: bank["website"],
    country: bank["country"],
    materials_accepted: bank["materials_accepted"],
    products_accepted: bank["products_accepted"],
    user: User.find(rand(User.first.id..User.count))
  )
  p bk
end

types = ["Bitcoin", "Cash"]
10.times do |i|
  collection = Collection.new(
    date: Date.today,
    total_kg: rand(1..50),
    payment_type: types.sample,
    user: User.find(rand(User.first.id..User.count)),
    bank: Bank.find(rand(Bank.first.id..Bank.count))
  )
  collection.total_amount = collection.total_kg * rand(1..10)
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


