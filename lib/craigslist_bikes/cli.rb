class CraigslistBikes::CLI

  def call
    #welcome
    #get_search_criteria
    #generate URL
    #call craigslist
    #scrape
    #instantiate bike objects
    instantiate_bikes

    #list the bikes
    list_bikes

    #menu
    menu

    #say goodbye
    goodbye
  end

  def instantiate_bikes
    #mocks up instantiating some bikes by calling Bike.new with a hash of bike attributes
    bike_1 = {:name => "Trek HITEN STEEL BICYCLE", :price => "1"}
    bike_2 = {:name => "Sad looking bike for sale", :price => "20"}

    CraigslistBikes::Bike.new(bike_1)
    CraigslistBikes::Bike.new(bike_2)
  end

  def list_bikes
    puts "Bikes on Craigslist:"

    #call the bikes method on the bike class to list all bikes
    CraigslistBikes::Bike.bikes.each_with_index {|b, i|
      puts "#{i+1}. #{b.name} - $#{b.price}"
    }

  end

  def menu
    input = nil
    while input != 'exit'
      puts "Enter the number of the bike you'd like to see more info on or type list to see the list or exit:"
      input = gets.strip.downcase
      case input
      when '1'
        puts "more info on 1..."
      when '2'
        puts "more info on 2..."
      when 'list'
        list_bikes
      when 'exit'
      else
        puts "not sure what you're looking for... type list or exit"
      end
    end
  end

  def goodbye
    puts "Check back for more bikes later!"
  end
end
