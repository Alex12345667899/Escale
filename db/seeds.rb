# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
puts "All users were destroyed"

user_attributes = [
  { email: "max.dubois@gmail.com", password: "azerty" },
  { email: "emma.leroy@yahoo.com", password: "azerty" },
  { email: "leo.martin@hotmail.com", password: "azerty" },
  { email: "lisa.moreau@outlook.com", password: "azerty" },
  { email: "nina.durand@gmail.com", password: "azerty" },
  { email: "tom.renard@yahoo.com", password: "azerty" }
]

user_attributes.each do |user_attribute|
  User.create!(user_attribute)
end
puts "#{User.count} users created"

Trip.destroy_all
puts "All trips were destroyed"

trip_attributes = [
  # { title: " ", description: " ", footprint: " " },
  { title: "Bordeaux to Berlin", description: "Travel from Bordeaux to Berlin, passing through Paris, Brussels, and Amsterdam, exploring iconic landmarks, famous cuisine, and historical sites.", footprint: 275, user: User.first },
  { title: "Bordeaux to Nice", description: "Journey from Bordeaux to Nice via Madrid and Barcelona, experiencing vibrant Spanish culture and the beauty of the French Riviera.", footprint: 320, user: User.first },
  { title: "Bordeaux to Prague", description: "Begin in Bordeaux and travel through Geneva, Milan, Venice, and Vienna before reaching Prague, enjoying stunning architecture and rich history.", footprint: 450, user: User.first },
  { title: "Bordeaux to Munich", description: "Start in Bordeaux, visit Lyon and Zurich, and conclude your trip in Munich, exploring culinary delights, lakeside views, and historic sites.", footprint: 310, user: User.first },
  { title: "Bordeaux to Valencia", description: "Travel from Bordeaux to Valencia with stops in Lisbon, Seville, and Granada, experiencing the rich history and vibrant culture of the Iberian Peninsula.", footprint: 370, user: User.first }
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
#-----------------------------------------------

Step.destroy_all
puts "all steps were destroyed"

step_attributes = [
  # { title: " ", content: " ", duration: " ", order: " ", latitude: " ", longitude: " " },
  { title: "Bordeaux to Paris", content: "Travel from Bordeaux to the romantic city of Paris, explore iconic landmarks like the Eiffel Tower and Louvre Museum.", duration: 2, order: 0, latitude: 48.8566, longitude: 2.3522, trip: bordeaux_to_berlin },
  { title: "Paris to Brussels", content: "Continue your journey to Brussels, enjoy famous Belgian waffles and visit the Grand Place.", duration: 1 , order: 1, latitude: 50.8503, longitude: 4.3517, trip: bordeaux_to_berlin },
  { title: "Brussels to Amsterdam", content: "Head to Amsterdam, explore the beautiful canals and visit the Van Gogh Museum.", duration: 2 , order: 2, latitude: 52.3676, longitude: 4.9041, trip: bordeaux_to_berlin },
  { title: "Amsterdam to Berlin", content: "Conclude your trip in Berlin, discover historical sites like the Brandenburg Gate and Berlin Wall.", duration: 6, order: 3, latitude: 52.5200, longitude: 13.4050, trip: bordeaux_to_berlin},
  { title: "Bordeaux to Madrid", content: "Start your adventure by traveling to Madrid, experience vibrant Spanish culture and visit the Prado Museum.", duration: 5, order: 0, latitude: 40.4168, longitude: -3.7038, trip: bordeaux_to_nice },
  { title: "Madrid to Barcelona", content: "Proceed to Barcelona, admire Gaudí's architectural masterpieces including Sagrada Família.", duration: 3, order: 1, latitude: 41.3851, longitude: 2.1734, trip: bordeaux_to_nice },
  { title: "Barcelona to Nice", content: "Travel to Nice, relax on the French Riviera and stroll along the Promenade des Anglais.", duration: 6, order: 2, latitude: 43.7102, longitude: 7.2620, trip: bordeaux_to_nice },
  { title: "Bordeaux to Geneva", content: "Begin your journey in Geneva, enjoy the stunning Lake Geneva and explore the United Nations headquarters.", duration: 6, order: 0, latitude: 46.2044, longitude: 6.1432, trip: bordeaux_to_prague },
  { title: "Geneva to Milan", content: "Continue to Milan, the fashion capital of Italy, and visit the magnificent Duomo di Milano.", duration: 4, order: 1, latitude: 45.4642, longitude: 9.1900, trip: bordeaux_to_prague },
  { title: "Milan to Venice", content: "Head to Venice, experience romantic gondola rides through the city's famous canals.", duration: 2, order: 2, latitude: 45.4408, longitude: 12.3155, trip: bordeaux_to_prague },
  { title: "Venice to Vienna", content: "Conclude your trip in Vienna, explore grand palaces and enjoy classical music concerts.", duration: 6, order: 3, latitude: 48.2082, longitude: 16.3738, trip: bordeaux_to_prague },
  { title: "Vienna to Prague", content: "Optional extension to Prague, discover the historic Prague Castle and charming old town.", duration: 3, order: 4, latitude: 50.0755, longitude: 14.4378, trip: bordeaux_to_prague },
  { title: "Bordeaux to Lyon", content: "Start by visiting Lyon, known for its culinary excellence and historic architecture.", duration: 5, order: 0, latitude: 45.7640, longitude: 4.8357, trip: bordeaux_to_munich },
  { title: "Lyon to Zurich", content: "Proceed to Zurich, enjoy beautiful lakeside views and explore Swiss culture.", duration: 4, order: 1, latitude: 47.3769, longitude: 8.5417, trip: bordeaux_to_munich },
  { title: "Zurich to Munich", content: "Continue to Munich, visit the historic Marienplatz and enjoy traditional Bavarian cuisine.", duration: 3, order: 2, latitude: 48.1351, longitude: 11.5820, trip: bordeaux_to_munich },
  { title: "Bordeaux to Lisbon", content: "Embark on your journey to Lisbon, explore the city's rich history and enjoy delicious Portuguese pastries.", duration: 9, order: 0, latitude: 38.7223, longitude: -9.1393, trip: bordeaux_to_valencia },
  { title: "Lisbon to Seville", content: "Travel to Seville, admire the stunning Alcázar palace and experience lively flamenco performances.", duration: 4, order: 1, latitude: 37.3891, longitude: -5.9845, trip: bordeaux_to_valencia },
  { title: "Seville to Granada", content: "Proceed to Granada, visit the breathtaking Alhambra and enjoy panoramic views of the city.", duration: 2, order: 2, latitude: 37.1773, longitude: -3.5986, trip: bordeaux_to_valencia },
  { title: "Granada to Valencia", content: "Conclude your trip in Valencia, relax on beautiful beaches and explore the City of Arts and Sciences.", duration: 5, order: 3, latitude: 39.4699, longitude: -0.3763, trip: bordeaux_to_valencia }
]

step_attributes.each do |step_attribute|
  Step.create!(step_attribute)
end
puts "#{Step.count} steps created"

#-----------------------------------------------
