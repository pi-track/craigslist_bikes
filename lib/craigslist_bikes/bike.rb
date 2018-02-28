class CraigslistBikes::Bike

  attr_accessor :name, :price, :url, :neigborhood, :date, :condition, :make, :model, :size, :mapaddress, :maplink, :contactName, :replyTelNumber, :replyEmail, :description

  #collect all instances of bikes
  @@all = []

  def self.all
    #expose all instances of bikes
    @@all
  end

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end


  def self.bikes
    self.all
  end

end
