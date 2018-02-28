class CraigslistBikes::Bike
  #i return bikes

  attr_accessor :name, :price, :url, :neigborhood, :date, :condition, :make, :model, :size, :mapaddress, :maplink, :contactName, :replyTelNumber, :replyEmail, :description

  bike_1 = self.new
  bike_1.name = "Trek HITEN STEEL BICYCLE"

  bike_2 = self.new
  bike_2.name = "Sad looking bicycle for sale."

  [bike_1, bike_2]

end
