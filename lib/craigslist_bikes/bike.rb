class CraigslistBikes::Bike

  attr_accessor :name, :price, :url, :neighborhood, :date, :condition, :make, :model, :size, :mapaddress, :maplink, :contactName, :replyTelNumber, :replyEmail, :description

  #collect all instances of bikes
  @@all = []

  def self.all
    #expose all instances of bikes
    @@all
  end

  def self.bikes
    self.all
  end

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.new_from_index_page(b)
    attributes = {}
    attributes[:name] = b.css("p > a").text
    attributes[:price] = b.css("p > span.result-meta > span.result-price").text.gsub("$","")
    attributes[:url] = b.css("p > a").attribute("href").value
    attributes[:neighborhood] = b.css("p > span.result-meta > span.result-hood").text.strip
    attributes[:date] = b.css("p > time").attribute("datetime").value
    CraigslistBikes::Bike.new(attributes)
  end

  def display
    puts ""
    puts "----------- #{self.name} -----------"
    puts ""
    puts "Location:           #{self.neighborhood}"
    puts "Price:              #{self.price}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{self.description}"
    puts ""
  end

  def 

end
