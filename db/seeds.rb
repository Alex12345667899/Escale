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
  { title: "Enchanting Bordeaux to Berlin Adventure", description: "Travel from Bordeaux to Berlin, passing through Paris, Brussels, and Amsterdam, exploring iconic landmarks, famous cuisine, and historical sites.", user: User.first, category: "Capital Cities" },
  { title: "Scenic Bordeaux to Nice Getaway", description: "Journey from Bordeaux to Nice via Madrid and Barcelona, experiencing vibrant Spanish culture and the beauty of the French Riviera.", user: User.first, category: ["Beach Escapes", "Rural Retreats"] },
  { title: "Cultural Odyssey: Bordeaux to Prague", description: "Begin in Bordeaux and travel through Geneva, Milan, Venice, and Vienna before reaching Prague, enjoying stunning architecture and rich history.", user: User.first, category: ["Capital Cities", "Mountain Gateaways", "Rural Retreats"] },
  { title: "Gourmet & Scenic Bordeaux to Munich Journey", description: "Start in Bordeaux, visit Lyon and Zurich, and conclude your trip in Munich, exploring culinary delights, lakeside views, and historic sites.", user: User.first, category: "Capital Cities" },
  { title: "Vibrant Bordeaux to Valencia Expedition", description: "Travel from Bordeaux to Valencia with stops in Lisbon, Seville, and Granada, experiencing the rich history and vibrant culture of the Iberian Peninsula.", user: User.first, category: ["Beach Escapes", "Mountain Gateaways", "Rural Retreats"] }
]

trip_attributes.each do |trip_attribute|
  Trip.create!(trip_attribute)
end
puts "#{Trip.count} trips created"

bordeaux_to_berlin = Trip.find_by(title: "Enchanting Bordeaux to Berlin Adventure")
bordeaux_to_nice = Trip.find_by(title: "Scenic Bordeaux to Nice Getaway")
bordeaux_to_prague = Trip.find_by(title: "Cultural Odyssey: Bordeaux to Prague")
bordeaux_to_munich = Trip.find_by(title: "Gourmet & Scenic Bordeaux to Munich Journey")
bordeaux_to_valencia = Trip.find_by(title: "Vibrant Bordeaux to Valencia Expedition")

#-------------------------------------------------------------------------------------->

Step.destroy_all
puts "all steps were destroyed"

step_attributes = [
  { title: "Bordeaux, France", content: "Discover the charm of Bordeaux, with its world-famous wine culture, stunning architecture, and vibrant riverside life.", duration: 1, order: 0, trip: bordeaux_to_berlin },
  { title: "Paris, France", content: "Travel from Bordeaux to the romantic city of Paris, explore iconic landmarks like the Eiffel Tower and Louvre Museum.", duration: 2, order: 0, trip: bordeaux_to_berlin },
  { title: "Brussels, Belgium", content: "Continue your journey to Brussels, enjoy famous Belgian waffles and visit the Grand Place.", duration: 1 , order: 1, trip: bordeaux_to_berlin },
  { title: "Amsterdam, Netherlands", content: "Head to Amsterdam, explore the beautiful canals and visit the Van Gogh Museum.", duration: 2 , order: 2, trip: bordeaux_to_berlin },
  { title: "Berlin, Germany", content: "Conclude your trip in Berlin, discover historical sites like the Brandenburg Gate and Berlin Wall.", duration: 6, order: 3, trip: bordeaux_to_berlin},
  { title: "Bordeaux, France", content: "Discover the charm of Bordeaux, with its world-famous wine culture, stunning architecture, and vibrant riverside life.", duration: 1, order: 0, trip: bordeaux_to_nice },
  { title: "Madrid, Spain", content: "Start your adventure by traveling to Madrid, experience vibrant Spanish culture and visit the Prado Museum.", duration: 5, order: 0, trip: bordeaux_to_nice },
  { title: "Barcelona, Spain", content: "Proceed to Barcelona, admire Gaudí's architectural masterpieces including Sagrada Família.", duration: 3, order: 1, trip: bordeaux_to_nice },
  { title: "Nice, France", content: "Travel to Nice, relax on the French Riviera and stroll along the Promenade des Anglais.", duration: 6, order: 2, trip: bordeaux_to_nice },
  { title: "Bordeaux, France", content: "Discover the charm of Bordeaux, with its world-famous wine culture, stunning architecture, and vibrant riverside life.", duration: 1, order: 0, trip: bordeaux_to_prague },
  { title: "Geneva, Switzerland", content: "Begin your journey in Geneva, enjoy the stunning Lake Geneva and explore the United Nations headquarters.", duration: 6, order: 0, trip: bordeaux_to_prague },
  { title: "Milan, Italy", content: "Continue to Milan, the fashion capital of Italy, and visit the magnificent Duomo di Milano.", duration: 4, order: 1, trip: bordeaux_to_prague },
  { title: "Venice, Italy", content: "Head to Venice, experience romantic gondola rides through the city's famous canals.", duration: 2, order: 2, trip: bordeaux_to_prague },
  { title: "Vienna, Austria", content: "Conclude your trip in Vienna, explore grand palaces and enjoy classical music concerts.", duration: 6, order: 3, trip: bordeaux_to_prague },
  { title: "Prague, Czech Republic", content: "Optional extension to Prague, discover the historic Prague Castle and charming old town.", duration: 3, order: 4, trip: bordeaux_to_prague },
  { title: "Bordeaux, France", content: "Discover the charm of Bordeaux, with its world-famous wine culture, stunning architecture, and vibrant riverside life.", duration: 1, order: 0, trip: bordeaux_to_munich },
  { title: "Lyon, France", content: "Start by visiting Lyon, known for its culinary excellence and historic architecture.", duration: 5, order: 0, trip: bordeaux_to_munich },
  { title: "Zurich, Switzerland", content: "Proceed to Zurich, enjoy beautiful lakeside views and explore Swiss culture.", duration: 4, order: 1, trip: bordeaux_to_munich },
  { title: "Munich, Germany", content: "Continue to Munich, visit the historic Marienplatz and enjoy traditional Bavarian cuisine.", duration: 3, order: 2, trip: bordeaux_to_munich },
  { title: "Bordeaux, France", content: "Discover the charm of Bordeaux, with its world-famous wine culture, stunning architecture, and vibrant riverside life.", duration: 1, order: 0, trip: bordeaux_to_valencia },
  { title: "Lisbon, Portugal", content: "Embark on your journey to Lisbon, explore the city's rich history and enjoy delicious Portuguese pastries.", duration: 9, order: 0, trip: bordeaux_to_valencia },
  { title: "Seville, Spain", content: "Travel to Seville, admire the stunning Alcázar palace and experience lively flamenco performances.", duration: 4, order: 1, trip: bordeaux_to_valencia },
  { title: "Granada, Spain", content: "Proceed to Granada, visit the breathtaking Alhambra and enjoy panoramic views of the city.", duration: 2, order: 2, trip: bordeaux_to_valencia },
  { title: "Valencia, Spain", content: "Conclude your trip in Valencia, relax on beautiful beaches and explore the City of Arts and Sciences.", duration: 5, order: 3, trip: bordeaux_to_valencia }
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
  { rating: 4, content: "A truly remarkable journey! Each city offers its unique charm, from Paris's romantic ambiance to Berlin's vibrant culture. A must for history buffs and food lovers alike.", user: User.first, trip: bordeaux_to_nice },
  { rating: 5, content: "The perfect blend of Spanish zest and French elegance. Madrid and Barcelona are bursting with energy, while the French Riviera is simply stunning. Highly recommended!", user: User.first, trip: bordeaux_to_berlin },
  { rating: 4, content: "An enchanting trip through Europe's architectural gems. Venice and Vienna were absolute highlights, and Prague is the perfect finale with its fairy-tale setting.", user: User.first, trip: bordeaux_to_nice },
  { rating: 4, content: "A delightful adventure filled with culinary delights and breathtaking scenery. Zurich's lakeside views were unforgettable, and Munich’s historical sites were fascinating.", user: User.first, trip: bordeaux_to_nice },
  { rating: 5, content: "A vibrant cultural experience! Lisbon and Seville's rich histories were captivating, and Valencia’s blend of modernity and tradition was a perfect end to the trip.", user: User.first, trip: bordeaux_to_berlin },
  { rating: 5, content: "A majestic journey through some of Europe's most iconic cities! Bordeaux's charm, Milan's fashion, and Vienna's classical elegance make this trip a true cultural feast. Prague’s enchanting beauty was the perfect finale.", user: User.first, trip: bordeaux_to_prague },
  { rating: 4, content: "From the vineyards of Bordeaux to the architectural wonders of Prague, this trip was a delightful exploration. Venice’s canals and Vienna’s palaces stood out, although Geneva felt a bit rushed.", user: User.first, trip: bordeaux_to_prague },
  { rating: 5, content: "An unforgettable cultural exploration! Each city brought something unique, from Milan's stylish streets to Prague’s fairy-tale ambiance. The itinerary was well-planned, and the experiences were top-notch.", user: User.first, trip: bordeaux_to_prague },
  { rating: 5, content: "A perfect blend of culinary and scenic delights! Lyon's gastronomy and Zurich's stunning lakeside views were highlights. Munich's rich history and vibrant culture made for an outstanding conclusion.", user: User.first, trip: bordeaux_to_munich },
  { rating: 4, content: "This journey was a feast for the senses! The food in Lyon was exceptional, and Zurich's natural beauty was breathtaking. Munich’s historical landmarks were fascinating, though the pace felt a bit hectic at times.", user: User.first, trip: bordeaux_to_munich },
  { rating: 5, content: "An exquisite trip combining gourmet experiences and scenic beauty. Lyon's culinary delights, Zurich's picturesque lakes, and Munich's historical charm made this journey unforgettable. Highly recommend it!", user: User.first, trip: bordeaux_to_munich },
  { rating: 5, content: "A vibrant and exciting journey through the Iberian Peninsula! Lisbon’s charm, Seville’s rich history, and Granada’s stunning Alhambra were highlights. Valencia’s mix of modernity and tradition was a great end.", user: User.first, trip: bordeaux_to_valencia },
  { rating: 4, content: "This trip was a colorful exploration of Spain and Portugal. Lisbon and Seville offered rich historical experiences, while Granada's allure and Valencia's lively atmosphere rounded out the journey well.", user: User.first, trip: bordeaux_to_valencia },
  { rating: 5, content: "An exhilarating adventure filled with cultural and historical gems! From Lisbon’s vibrant streets to Seville’s majestic architecture and Granada’s stunning palaces, this trip was a perfect blend of experiences.", user: User.first, trip: bordeaux_to_valencia }
]

review_attributes.each do |review_attribute|
  Review.create!(review_attribute)
end
puts "#{Review.count} reviews created"
