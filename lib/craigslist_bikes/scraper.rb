class CraigslistBikes::Scraper
  def self.scrape_search_page(index_url)
    doc = self.get_page(index_url)
    binding.pry
    doc.css(".result-row")
=begin
    #result rows
    #doc.css(".result-row").each {|i|
      #link to the item
      #i.css("a").attribute("href").value
    doc.css(".student-card").each {|s|
      hash = {}
      hash[:name] = s.css(".student-name").text
      hash[:location] = s.css(".student-location").text
      hash[:profile_url] = s.css("a")[0]['href']
      items << hash
    }
    items
=end
  end

  def make_items
    scrape_search_page.each do |i|
      binding.pry
      #puts i.css("a").attribute("href").value
    end
  end

  def self.scrape_item_page(item_url)

    doc = get_page(item_url)

    #find social attributes
    social_url = doc.css("div.social-icon-container").children.collect {|a| a['href']}
    social_url.delete(nil)
    social = social_url.collect {|s|
      tag = s.match(/[a-z]+(.com|.co)/)
      [tag.to_s.split(".")[0].to_sym, s] if tag
    }

    #add social attributes to the hash
    hash = {}
    social.delete(nil)
    social.each { |n|
      if (n[0] == :twitter) || (n[0] == :linkedin) || (n[0] == :github)
        hash[n[0]] = n[1]
      else
        hash[:blog] = n[1]
      end
    }

    #add profile_quote to the hash
    hash[:profile_quote] = doc.css("body > div > div.vitals-container > div.vitals-text-container > div").text

    #add bio to the hash
    hash[:bio] = doc.css("body > div > div.details-container > div.bio-block.details-block > div > div.description-holder > p").text
    hash
  end

  def self.get_page(url)
    Nokogiri::HTML(open(url))
  end
end
