class CraigslistBikes::CLI

  def call
    #displays a welcome message
    welcome
    #create a new Search object - the hook gets search criteria
    search = CraigslistBikes::Search.new
    #generateURL
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

  def bike_info(index)
    #takes the index (+1) of the bike you'd like to see more info on and returns info
    #may need to move this to the bike class
    puts "hello from bike_info #{index}."
    b = CraigslistBikes::Bike.bikes[index.to_i-1]
    puts "#{b.name} - $#{b.price}"
  end

  def menu
    input = nil
    while input != 'exit'
      puts "Enter the number of the bike you'd like to see more info on or type list to see the list or search for a new search or exit:"
      input = gets.strip.downcase
      if input.to_i > 0
        puts "more info on #{input}..."
        bike_info(input)
      elsif input == 'list'
        list_bikes
      elsif input == 'search'
        get_search_criteria
      elsif input == 'exit'
      else
        puts "not sure what you're looking for... type list or exit"
      end
    end
  end

  def welcome
    puts "Hello - welcome to the craigslist bike scraper"
  end

  def goodbye
    puts "Check back for more bikes later!"
  end
end
