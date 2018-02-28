class CraigslistBikes::CLI

  def call
    #welcome
    #get_search_criteria
    #generate URL
    #call craigslist
    #scrape
    #instantiate bike objects

    #list the bikes
    list_bikes

    #menu
    menu

    #say goodbye
    goodbye
  end

  def list_bikes

    puts "Bikes on Craigslist:"

    #stub to list bikes using fake data
    #TODO build a real display of all bikes
    puts <<-HEREDOC
      1. Trek HITEN STEEL BICYCLE - $1
      2. Sad looking bicycle for sale. - $2
    HEREDOC
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
