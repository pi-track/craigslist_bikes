class CraigslistBikes::CLI
  attr_accessor :search

  def call
    welcome
    new_search
    menu
    goodbye
  end

  def welcome
    puts "Hello - welcome to the craigslist bike scraper"
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
        new_search
      elsif input == 'exit'
      else
        puts "not sure what you're looking for... type list or exit"
      end
    end
  end

  def goodbye
    puts "Check back for more bikes later!"
  end

  def new_search
    @search = CraigslistBikes::Search.new
  end

  def list_bikes
    @search.items.each_with_index {|b, i|
      puts "#{i+1}. #{b.name} - $#{b.price}"
    }
  end

  def bike_info(index)
    b = @search.items[index.to_i-1]
    b.scrape_item_page
    b.display
  end
end
