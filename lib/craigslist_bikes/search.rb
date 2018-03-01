class CraigslistBikes::Search
  attr_accessor :city, :zip_code, :search_radius, :posted_today, :price_min, :price_max, :search_text, :category
  @@all = []

  def self.all
    #expose all instances
    @@all
  end

  def initialize
  end

  def self.get_search_criteria
    puts "I'm going to ask you for some search criteria and search craigslist for that. Enter to contine. Exit to exit:"
    input = gets.strip.downcase #waits for an enter
    while !['yes', 'y', 'yup', 'exit'].include?(input)
      search_criteria = {}
      puts "What city are you in?"
      search_criteria[:city] = gets.strip
      puts "What radius would you like to search (mi)?"
      search_criteria[:search_radius] = gets.strip
      puts "See only items posted_today? (Y/n)"
      search_criteria[:posted_today?] = gets.strip
      puts "What is your max price? ($)"
      search_criteria[:price_max] = gets.strip
      puts "What is your min price? ($)"
      search_criteria[:price_min] = gets.strip
      puts "Any words to search for? You can leave this blank."
      search_criteria[:search_text] = gets.strip

      puts "OK - does this search look alright?"
      puts search_criteria
      input = gets.strip.downcase
      ['yes', 'y', 'yup'].include?(input)? (puts "Cool I'll search for that and get back to you"):(puts "ok lets try again")
    end

    #TODO: check if search criteria is valid

    #returns search criteria
    search_criteria
  end
end
