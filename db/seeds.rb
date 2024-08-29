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

trip1 = Trip.new(title: "Enchanting Bordeaux to Berlin Adventure", description: "Travel from Bordeaux to Berlin, passing through Paris, Brussels, and Amsterdam, exploring iconic landmarks, famous cuisine, and historical sites.", user: User.first, category: "Capital Cities")
file1 = URI.open("https://images.pexels.com/photos/2817497/pexels-photo-2817497.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
trip1.photo.attach(io: file1, filename: "nes.png", content_type: "image/png")
trip1.save

trip2 = Trip.new(title: "Scenic Bordeaux to Nice Getaway", description: "Journey from Bordeaux to Nice via Madrid and Barcelona, experiencing vibrant Spanish culture and the beauty of the French Riviera.", user: User.first, category: ["Beach Escapes", "Rural Retreats"])
file2 = URI.open("https://images.pexels.com/photos/3016350/pexels-photo-3016350.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
trip2.photo.attach(io: file2, filename: "beach_escape.png", content_type: "image/png")
trip2.save

trip3 = Trip.new(title: "Cultural Odyssey: Bordeaux to Prague", description: "Begin in Bordeaux and travel through Geneva, Milan, Venice, and Vienna before reaching Prague, enjoying stunning architecture and rich history.", user: User.first, category: ["Capital Cities", "Mountain Gateaways", "Rural Retreats"])
file3 = URI.open("https://images.pexels.com/photos/2346216/pexels-photo-2346216.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
trip3.photo.attach(io: file3, filename: "cultural_odyssey.png", content_type: "image/png")
trip3.save

trip4 = Trip.new(title: "Gourmet & Scenic Bordeaux to Munich Journey", description: "Start in Bordeaux, visit Lyon and Zurich, and conclude your trip in Munich, exploring culinary delights, lakeside views, and historic sites.", user: User.first, category: "Capital Cities")
file4 = URI.open("https://images.pexels.com/photos/9827/pexels-photo-9827.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
trip4.photo.attach(io: file4, filename: "gourmet_scenic.png", content_type: "image/png")
trip4.save

trip5 = Trip.new(title: "Vibrant Bordeaux to Valencia Expedition", description: "Travel from Bordeaux to Valencia with stops in Lisbon, Seville, and Granada, experiencing the rich history and vibrant culture of the Iberian Peninsula.", user: User.first, category: ["Beach Escapes", "Mountain Gateaways", "Rural Retreats"])
file5 = URI.open("https://www.guide-bordeaux-gironde.com/_bibli/articlesPage/167/images/adobestock-saiko3p-bordeaux-vue-du-ciel.jpg?v=ficheArticle&width=572&height=275&pixelRatio=2.6250")
trip5.photo.attach(io: file5, filename: "valencia_expedition.png", content_type: "image/png")
trip5.save

puts "#{Trip.count} trips created"

bordeaux_to_berlin = Trip.find_by(title: "Enchanting Bordeaux to Berlin Adventure")
bordeaux_to_nice = Trip.find_by(title: "Scenic Bordeaux to Nice Getaway")
bordeaux_to_prague = Trip.find_by(title: "Cultural Odyssey: Bordeaux to Prague")
bordeaux_to_munich = Trip.find_by(title: "Gourmet & Scenic Bordeaux to Munich Journey")
bordeaux_to_valencia = Trip.find_by(title: "Vibrant Bordeaux to Valencia Expedition")

#-------------------------------------------------------------------------------------->

Step.destroy_all
puts "all steps were destroyed"

step1 = Step.new(title: "Bordeaux, France", content: "Discover the charm of Bordeaux, with its world-famous wine culture, stunning architecture, and vibrant riverside life.", duration: 1, order: 0, trip: bordeaux_to_berlin)
file2 = URI.open("https://images.pexels.com/photos/2164683/pexels-photo-2164683.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
step1.photo.attach(io: file2, filename: "bordeaux_france.png", content_type: "image/png")
step1.save

step2 = Step.new(title: "Paris, France", content: "Travel from Bordeaux to the romantic city of Paris, explore iconic landmarks like the Eiffel Tower and Louvre Museum.", duration: 2, order: 1, trip: bordeaux_to_berlin)
file6 = URI.open("https://cdn.pixabay.com/photo/2018/04/25/09/26/eiffel-tower-3349075_1280.jpg")
step2.photo.attach(io: file6, filename: "paris_france.png", content_type: "image/png")
step2.save

step3 = Step.new(title: "Brussels, Belgium", content: "Continue your journey to Brussels, enjoy famous Belgian waffles and visit the Grand Place.", duration: 1, order: 2, trip: bordeaux_to_berlin)
file7 = URI.open("https://images.pexels.com/photos/103552/pexels-photo-103552.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
step3.photo.attach(io: file7, filename: "brussels_belgium.png", content_type: "image/png")
step3.save

step4 = Step.new(title: "Amsterdam, Netherlands", content: "Head to Amsterdam, explore the beautiful canals and visit the Van Gogh Museum.", duration: 2, order: 3, trip: bordeaux_to_berlin)
file8 = URI.open("https://images.pexels.com/photos/2026451/pexels-photo-2026451.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
step4.photo.attach(io: file8, filename: "amsterdam_netherlands.png", content_type: "image/png")
step4.save

step5 = Step.new(title: "Berlin, Germany", content: "Conclude your trip in Berlin, discover historical sites like the Brandenburg Gate and Berlin Wall.", duration: 6, order: 4, trip: bordeaux_to_berlin)
file9 = URI.open("https://images.pexels.com/photos/109630/pexels-photo-109630.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
step5.photo.attach(io: file9, filename: "berlin_germany.png", content_type: "image/png")
step5.save

step6 = Step.new(title: "Bordeaux, France", content: "Discover the charm of Bordeaux, with its world-famous wine culture, stunning architecture, and vibrant riverside life.", duration: 1, order: 0, trip: bordeaux_to_nice)
file10 = URI.open("https://images.pexels.com/photos/2164683/pexels-photo-2164683.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
step6.photo.attach(io: file10, filename: "bordeaux_france.png", content_type: "image/png")
step6.save

step7 = Step.new(title: "Madrid, Spain", content: "Start your adventure by traveling to Madrid, experience vibrant Spanish culture and visit the Prado Museum.", duration: 5, order: 1, trip: bordeaux_to_nice)
file11 = URI.open("https://images.pexels.com/photos/930595/pexels-photo-930595.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
step7.photo.attach(io: file11, filename: "madrid_spain.png", content_type: "image/png")
step7.save

step8 = Step.new(title: "Barcelona, Spain", content: "Proceed to Barcelona, admire Gaudí's architectural masterpieces including Sagrada Família.", duration: 3, order: 2, trip: bordeaux_to_nice)
file12 = URI.open("https://images.pexels.com/photos/819764/pexels-photo-819764.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
step8.photo.attach(io: file12, filename: "barcelona_spain.png", content_type: "image/png")
step8.save

step9 = Step.new(title: "Nice, France", content: "Travel to Nice, relax on the French Riviera and stroll along the Promenade des Anglais.", duration: 6, order: 3, trip: bordeaux_to_nice)
file13 = URI.open("https://images.pexels.com/photos/26928989/pexels-photo-26928989/free-photo-of-mer-ville-montagnes-france.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
step9.photo.attach(io: file13, filename: "nice_france.png", content_type: "image/png")
step9.save


step10 = Step.new(title: "Bordeaux, France", content: "Discover the charm of Bordeaux, with its world-famous wine culture, stunning architecture, and vibrant riverside life.", duration: 1, order: 0, trip: bordeaux_to_prague)
file14 = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSC8qVZIMl4H66sucDKNyz0YZ9IyRz9HQDqQQ&s")
step10.photo.attach(io: file14, filename: "bordeaux_france.png", content_type: "image/png")
step10.save


step11 = Step.new(title: "Geneva, Switzerland", content: "Begin your journey in Geneva, enjoy the stunning Lake Geneva and explore the United Nations headquarters.", duration: 6, order: 1, trip: bordeaux_to_prague)
file15 = URI.open("https://images.pexels.com/photos/17190957/pexels-photo-17190957/free-photo-of-ville-monument-lac-voyager.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
step11.photo.attach(io: file15, filename: "geneva_switzerland.png", content_type: "image/png")
step11.save


step12 = Step.new(title: "Milan, Italy", content: "Continue to Milan, the fashion capital of Italy, and visit the magnificent Duomo di Milano.", duration: 4, order: 2, trip: bordeaux_to_prague)
file16 = URI.open("https://images.pexels.com/photos/2097092/pexels-photo-2097092.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
step12.photo.attach(io: file16, filename: "milan_italy.png", content_type: "image/png")
step12.save


step13 = Step.new(title: "Venice, Italy", content: "Head to Venice, experience romantic gondola rides through the city's famous canals.", duration: 2, order: 3, trip: bordeaux_to_prague)
file17 = URI.open("https://images.pexels.com/photos/705782/pexels-photo-705782.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
step13.photo.attach(io: file17, filename: "venice_italy.png", content_type: "image/png")
step13.save


step14 = Step.new(title: "Vienna, Austria", content: "Conclude your trip in Vienna, explore grand palaces and enjoy classical music concerts.", duration: 6, order: 4, trip: bordeaux_to_prague)
file18 = URI.open("https://vienna-unwrapped.com/wp-content/uploads/2024/08/IsViennaACountry-ezgif.com-png-to-jpg-converter.jpg")
step14.photo.attach(io: file18, filename: "vienna_austria.png", content_type: "image/png")
step14.save


step15 = Step.new(title: "Prague, Czech Republic", content: "Optional extension to Prague, discover the historic Prague Castle and charming old town.", duration: 3, order: 5, trip: bordeaux_to_prague)
file19 = URI.open("https://images.pexels.com/photos/442583/pexels-photo-442583.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
step15.photo.attach(io: file19, filename: "prague_czech_republic.png", content_type: "image/png")
step15.save


step16 = Step.new(title: "Bordeaux, France", content: "Discover the charm of Bordeaux, with its world-famous wine culture, stunning architecture, and vibrant riverside life.", duration: 1, order: 0, trip: bordeaux_to_munich)
file20 = URI.open("https://media.timeout.com/images/105948009/750/422/image.jpg")
step16.photo.attach(io: file20, filename: "bordeaux_france.png", content_type: "image/png")
step16.save


step17 = Step.new(title: "Lyon, France", content: "Start by visiting Lyon, known for its culinary excellence and historic architecture.", duration: 5, order: 1, trip: bordeaux_to_munich)
file21 = URI.open("https://images.pexels.com/photos/5868282/pexels-photo-5868282.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
step17.photo.attach(io: file21, filename: "lyon_france.png", content_type: "image/png")
step17.save


step18 = Step.new(title: "Zurich, Switzerland", content: "Proceed to Zurich, enjoy beautiful lakeside views and explore Swiss culture.", duration: 4, order: 2, trip: bordeaux_to_munich)
file22 = URI.open("https://images.pexels.com/photos/27778621/pexels-photo-27778621/free-photo-of-ville-monument-marcher-ete.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
step18.photo.attach(io: file22, filename: "zurich_switzerland.png", content_type: "image/png")
step18.save


step19 = Step.new(title: "Munich, Germany", content: "Continue to Munich, visit the historic Marienplatz and enjoy traditional Bavarian cuisine.", duration: 3, order: 3, trip: bordeaux_to_munich)
file23 = URI.open("https://images.pexels.com/photos/9827/pexels-photo-9827.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
step19.photo.attach(io: file23, filename: "munich_germany.png", content_type: "image/png")
step19.save


step20 = Step.new(title: "Bordeaux, France", content: "Discover the charm of Bordeaux, with its world-famous wine culture, stunning architecture, and vibrant riverside life.", duration: 1, order: 0, trip: bordeaux_to_valencia)
file24 = URI.open("https://mshanken.imgix.net/wso/Articles/2018/ABC_Bordeaux_1600.jpg")
step20.photo.attach(io: file24, filename: "bordeaux_france.png", content_type: "image/png")
step20.save


step21 = Step.new(title: "Lisbon, Portugal", content: "Embark on your journey to Lisbon, explore the city's rich history and enjoy delicious Portuguese pastries.", duration: 9, order: 1, trip: bordeaux_to_valencia)
file25 = URI.open("https://img-4.linternaute.com/7GvKgODhSJWxaWCPn72qvLeA4w8=/660x366/smart/5b4ef0d8e6c64a99990e2b6e0e6a7de2/ccmcms-linternaute/10985721.jpg")
step21.photo.attach(io: file25, filename: "lisbon_portugal.png", content_type: "image/png")
step21.save


step22 = Step.new(title: "Seville, Spain", content: "Travel to Seville, admire the stunning Alcázar palace and experience lively flamenco performances.", duration: 4, order: 2, trip: bordeaux_to_valencia)
file26 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Sevilla_Cathedral_-_Southeast.jpg/800px-Sevilla_Cathedral_-_Southeast.jpg")
step22.photo.attach(io: file26, filename: "seville_spain.png", content_type: "image/png")
step22.save


step23 = Step.new(title: "Granada, Spain", content: "Proceed to Granada, visit the breathtaking Alhambra and enjoy panoramic views of the city.", duration: 2, order: 3, trip: bordeaux_to_valencia)
file27 = URI.open("https://cdn-imgix.headout.com/media/images/4f89d6eeb324e19ee61af4fb172380e9-18731-granada-the-alhambra-palace---skip-the-line-e-ticket-with-audio-tour-on-your-phone-04.jpg")
step23.photo.attach(io: file27, filename: "granada_spain.png", content_type: "image/png")
step23.save


step24 = Step.new(title: "Valencia, Spain", content: "Conclude your trip in Valencia, relax on beautiful beaches and explore the City of Arts and Sciences.", duration: 5, order: 4, trip: bordeaux_to_valencia)
file28 = URI.open("https://media.routard.com/image/70/8/valence-fontaine.1553708.jpg")
step24.photo.attach(io: file28, filename: "valencia_spain.png", content_type: "image/png")
step24.save


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
