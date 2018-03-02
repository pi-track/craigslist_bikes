class CraigslistBikes::CLI

  def call
    #displays a welcome message
    welcome
    #create a new Search object - the hook gets search criteria
    search = CraigslistBikes::Search.new
    search.make_items
    #list the bikes
    list_bikes

    #menu
    menu

    #say goodbye
    goodbye
  end

  def list_bikes
    puts "Bikes on Craigslist:"
    #call the bikes method on the bike class to list all bikes
    CraigslistBikes::Search.all.last.items.each_with_index {|b, i|
      puts "#{i+1}. #{b.name} - $#{b.price}"
    }
  end

  def bike_info(index)
    #takes the index (+1) of the bike you'd like to see more info on and returns info
    #may need to move this to the bike class
    #TODO scrape the item page
    b = CraigslistBikes::Search.all.last.items[index.to_i-1]
    b.scrape_item_page
    b.display
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
        search = CraigslistBikes::Search.new
        search.make_items
        list_bikes
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
