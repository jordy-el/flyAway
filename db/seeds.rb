# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.all.each(&:destroy)

%W(Melbourne Sydney Brisbane Perth Adelaide Hobart Darwin Canberra).each do |city|
  Airport.new(location: city).save!
end

Airport.all.each do |origin|
  @origin = origin
  Airport.all.each do |destination|
    @destination = destination
    unless @origin == @destination
      flight = Flight.new(departing: DateTime.now + rand(10), seats: 300)
      flight.origin = @origin
      flight.destination = @destination
      flight.save
    end
  end
end
