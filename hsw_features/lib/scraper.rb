require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper
  
  attr_accessor :titles, :blurbs, :urls
  BASE_URL = "https://www.howstuffworks.com/"
  #attr_accessor :doc, :titles
  
  def initialize
    @titles = titles
    @blurbs = blurbs
    @urls = urls
  end
  
  def hsw
    Nokogiri::HTML(open(BASE_URL))
  end
  
  def search
    hsw.css("#module-features").css("div")
  end
  
  def titles
    search.css(".title").map { |item| item.text}
  end
  
  def blurbs
    search.css(".blurb").map { |item| item.text}
  end
  
  def urls
    #features = doc.css("#module-features").css("div")
    search.css("a href").map { |item| item.value}
  end
  
end


x = Scraper.new
#testing out arrays
y = [ 0, 1, 2]
z = 3
binding.pry


#HISTORY
#git commit -m "Added titles and blurbs."