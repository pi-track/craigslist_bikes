class CraigslistBikes::Search
  attr_accessor :search_criteria, :city, :zip_code, :search_radius, :posted_today, :price_min, :price_max, :query, :category, :search_URL, :items
  @@all = []

  def self.all
    @@all
  end

  def initialize(search_criteria=get_search_criteria)
    #@search_criteria = get_search_criteria
    @category = 'bik' #default to bike
    @city = 'philadelphia' #default to philadelphia
    search_criteria.each {|key, value| self.send(("#{key}="), value)}
    @search_criteria = search_criteria
    @search_URL = self.get_URL
    @@all << self
  end

  def get_search_criteria
    puts "I'm going to ask you for some search criteria and search craigslist for that. Enter to contine. Exit to exit. default to default search:"
    input = gets.strip.downcase #waits for an enter
    while !['yes', 'y', 'yup', 'exit', 'default', 'd'].include?(input)
      search_criteria = {}
      puts "What city are you in?"
      search_criteria[:city] = gets.strip
      puts "What is your zip code?"
      search_criteria[:zip_code] = gets.strip
      puts "What radius would you like to search (mi)?"
      search_criteria[:search_radius] = gets.strip
      puts "See only items posted_today? (Y/n)"
      postedToday = gets.strip
      search_criteria[:posted_today] = '1' if ['yes', 'y', 'yup'].include?(postedToday)
      puts "What is your max price? ($)"
      search_criteria[:price_max] = gets.strip
      puts "What is your min price? ($)"
      search_criteria[:price_min] = gets.strip
      puts "Any words to search for? You can leave this blank."
      search_criteria[:query] = gets.strip

      puts "OK - does this search look alright?"
      puts search_criteria
      input = gets.strip.downcase
      ['yes', 'y', 'yup'].include?(input)? (puts "Cool I'll search and get back to you"):(puts "ok lets try again")
    end
    #TODO: check if search criteria is valid and

    #returns search criteria hash
    if input == 'default' || input == 'd'
      search_criteria = {:city=>"philadelphia", :zip_code=>"19147", :search_radius=>"3", :posted_today=>"1", :price_max=>"1000", :price_min=>"10", :query=>"bike"}
    else
      search_criteria
    end
  end

  def get_URL
    url = "https://#{self.city}.craigslist.org/search/#{self.category}?query=#{self.query}&search_distance=#{self.search_radius}&postal=#{self.zip_code}&min_price=#{self.price_min}&max_price=#{self.price_max}&postedToday=#{self.posted_today}"
  end

  def scrape_search_page
    doc = Nokogiri::HTML(open(self.search_URL))
    doc.css(".result-row")
  end

  def make_items
    items = []
    scrape_search_page.each do |i|
      items << CraigslistBikes::Bike.new_from_index_page(i)
    end
    @items = items
  end

end
