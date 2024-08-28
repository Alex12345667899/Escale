# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#-------------------------------------------------------------------------------------->


User.destroy_all
puts "All users were destroyed"

user_attributes = [
  { email: "max.dubois@gmail.com", password: "azerty", picture: "https://images.unsplash.com/photo-1508978053361-f0df91897005?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fG1hbiUyMGFuZCUyMHdvbWFufGVufDB8fDB8fHww" },
  { email: "emma.leroy@yahoo.com", password: "azerty", picture: "https://plus.unsplash.com/premium_photo-1689551670902-19b441a6afde?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d29tYW58ZW58MHx8MHx8fDA%3D" },
  { email: "leo.martin@hotmail.com", password: "azerty", picture: "https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWFufGVufDB8fDB8fHww" },
  { email: "lisa.moreau@outlook.com", password: "azerty", picture: "https://images.unsplash.com/photo-1664575602554-2087b04935a5?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d29tYW58ZW58MHx8MHx8fDA%3D" },
  { email: "nina.durand@gmail.com", password: "azerty", picture: "https://plus.unsplash.com/premium_photo-1688385848467-781c5394c017?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8d29tYW58ZW58MHx8MHx8fDA%3D" },
  { email: "tom.renard@yahoo.com", password: "azerty", picture: "https://images.unsplash.com/photo-1568602471122-7832951cc4c5?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bWFufGVufDB8fDB8fHww" }
]

user_attributes.each do |user_attribute|
  User.create!(user_attribute)
end
puts "#{User.count} users created"

#-------------------------------------------------------------------------------------->

Trip.destroy_all
puts "All trips were destroyed"

trip_attributes = [
  { title: "Bordeaux to Berlin", description: "Travel from Bordeaux to Berlin, passing through Paris, Brussels, and Amsterdam, exploring iconic landmarks, famous cuisine, and historical sites.", user: User.first, category: "Capital Cities" },
  { title: "Bordeaux to Nice", description: "Journey from Bordeaux to Nice via Madrid and Barcelona, experiencing vibrant Spanish culture and the beauty of the French Riviera.", user: User.first, category: ["Beach Escapes", "Rural Retreats"] },
  { title: "Bordeaux to Prague", description: "Begin in Bordeaux and travel through Geneva, Milan, Venice, and Vienna before reaching Prague, enjoying stunning architecture and rich history.", user: User.first, category: ["Capital Cities", "Mountain Gateaways", "Rural Retreats"] },
  { title: "Bordeaux to Munich", description: "Start in Bordeaux, visit Lyon and Zurich, and conclude your trip in Munich, exploring culinary delights, lakeside views, and historic sites.", user: User.first, category: "Capital Cities" },
  { title: "Bordeaux to Valencia", description: "Travel from Bordeaux to Valencia with stops in Lisbon, Seville, and Granada, experiencing the rich history and vibrant culture of the Iberian Peninsula.", user: User.first, category: ["Beach Escapes", "Mountain Gateaways", "Rural Retreats"] }
]

trip_attributes.each do |trip_attribute|
  Trip.create!(trip_attribute)
end
puts "#{Trip.count} trips created"

bordeaux_to_berlin = Trip.find_by(title: "Bordeaux to Berlin")
bordeaux_to_nice = Trip.find_by(title: "Bordeaux to Nice")
bordeaux_to_prague = Trip.find_by(title: "Bordeaux to Prague")
bordeaux_to_munich = Trip.find_by(title: "Bordeaux to Munich")
bordeaux_to_valencia = Trip.find_by(title: "Bordeaux to Valencia")

#-------------------------------------------------------------------------------------->

Step.destroy_all
puts "all steps were destroyed"

step_attributes = [
  { title: "Paris", content: "Travel from Bordeaux to the romantic city of Paris, explore iconic landmarks like the Eiffel Tower and Louvre Museum.", duration: 2, order: 0, trip: bordeaux_to_berlin },
  { title: "Brussels", content: "Continue your journey to Brussels, enjoy famous Belgian waffles and visit the Grand Place.", duration: 1 , order: 1, trip: bordeaux_to_berlin },
  { title: "Amsterdam", content: "Head to Amsterdam, explore the beautiful canals and visit the Van Gogh Museum.", duration: 2 , order: 2, trip: bordeaux_to_berlin },
  { title: "Berlin", content: "Conclude your trip in Berlin, discover historical sites like the Brandenburg Gate and Berlin Wall.", duration: 6, order: 3, trip: bordeaux_to_berlin},
  { title: "Madrid", content: "Start your adventure by traveling to Madrid, experience vibrant Spanish culture and visit the Prado Museum.", duration: 5, order: 0, trip: bordeaux_to_nice },
  { title: "Barcelona", content: "Proceed to Barcelona, admire Gaudí's architectural masterpieces including Sagrada Família.", duration: 3, order: 1, trip: bordeaux_to_nice },
  { title: "Nice", content: "Travel to Nice, relax on the French Riviera and stroll along the Promenade des Anglais.", duration: 6, order: 2, trip: bordeaux_to_nice },
  { title: "Geneva", content: "Begin your journey in Geneva, enjoy the stunning Lake Geneva and explore the United Nations headquarters.", duration: 6, order: 0, trip: bordeaux_to_prague },
  { title: "Milan", content: "Continue to Milan, the fashion capital of Italy, and visit the magnificent Duomo di Milano.", duration: 4, order: 1, trip: bordeaux_to_prague },
  { title: "Venice", content: "Head to Venice, experience romantic gondola rides through the city's famous canals.", duration: 2, order: 2, trip: bordeaux_to_prague },
  { title: "Vienna", content: "Conclude your trip in Vienna, explore grand palaces and enjoy classical music concerts.", duration: 6, order: 3, trip: bordeaux_to_prague },
  { title: "Prague", content: "Optional extension to Prague, discover the historic Prague Castle and charming old town.", duration: 3, order: 4, trip: bordeaux_to_prague },
  { title: "Lyon", content: "Start by visiting Lyon, known for its culinary excellence and historic architecture.", duration: 5, order: 0, trip: bordeaux_to_munich },
  { title: "Zurich", content: "Proceed to Zurich, enjoy beautiful lakeside views and explore Swiss culture.", duration: 4, order: 1, trip: bordeaux_to_munich },
  { title: "Munich", content: "Continue to Munich, visit the historic Marienplatz and enjoy traditional Bavarian cuisine.", duration: 3, order: 2, trip: bordeaux_to_munich },
  { title: "Lisbon", content: "Embark on your journey to Lisbon, explore the city's rich history and enjoy delicious Portuguese pastries.", duration: 9, order: 0, trip: bordeaux_to_valencia },
  { title: "Seville", content: "Travel to Seville, admire the stunning Alcázar palace and experience lively flamenco performances.", duration: 4, order: 1, trip: bordeaux_to_valencia },
  { title: "Granada", content: "Proceed to Granada, visit the breathtaking Alhambra and enjoy panoramic views of the city.", duration: 2, order: 2, trip: bordeaux_to_valencia },
  { title: "Valencia", content: "Conclude your trip in Valencia, relax on beautiful beaches and explore the City of Arts and Sciences.", duration: 5, order: 3, trip: bordeaux_to_valencia }
]

step_attributes.each do |step_attribute|
  Step.create!(step_attribute)
end
puts "#{Step.count} steps created"

#-------------------------------------------------------------------------------------->

Trip.all.each do |trip|
  trip.set_total_distance_and_duration
  trip.set_footprint
end

#-------------------------------------------------------------------------------------->

Review.destroy_all
puts "All reviews were destroyed"

review_attributes = [
  { rating: 4, content: "A truly remarkable journey! Each city offers its unique charm, from Paris's romantic ambiance to Berlin's vibrant culture. A must for history buffs and food lovers alike." },
  { rating: 5, content: "The perfect blend of Spanish zest and French elegance. Madrid and Barcelona are bursting with energy, while the French Riviera is simply stunning. Highly recommended!" },
  { rating: 4, content: "An enchanting trip through Europe's architectural gems. Venice and Vienna were absolute highlights, and Prague is the perfect finale with its fairy-tale setting." },
  { rating: 4, content: "A delightful adventure filled with culinary delights and breathtaking scenery. Zurich's lakeside views were unforgettable, and Munich’s historical sites were fascinating." },
  { rating: 5, content: "A vibrant cultural experience! Lisbon and Seville's rich histories were captivating, and Valencia’s blend of modernity and tradition was a perfect end to the trip." }
]

review_attributes.each do |review_attribute|
  Review.create!(review_attribute)
end
puts "#{Review.count} reviews created"
