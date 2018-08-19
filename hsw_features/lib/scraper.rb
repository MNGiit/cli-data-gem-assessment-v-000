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
    @urls = url_duplicate_remover
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
    hsw.css("#module-features").css("a").map { |item| item.attribute('href').value }
  end
  
  def url_duplicate_remover
    urls.uniq
  end
  
end


x = Scraper.new
#testing out arrays
y = [ 0, 1, 2]
z = 3
binding.pry
