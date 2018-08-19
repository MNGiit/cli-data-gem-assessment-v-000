require_relative "../lib/articles.rb"
#Dir["/path/to/directory/*.rb"].each {|file| require file }
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
    @urls = add_urls
    self.create_article
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
  
  def get_urls
    hsw.css("#module-features").css("a").map { |item| item.attribute('href').value }
  end
  
  def url_duplicate_remover
    get_urls.uniq
  end
  
  def add_urls
    url_duplicate_remover.reject.with_index { |element, index| index >=1 && index <= 2 }
  end
  
  #Need methods to store scraped info into class Articles
  def create_article
    5.times do |i|
      Articles.new(titles[i], blurbs[i], urls[i])
    end
  end
  
  def show
    Articles.all
  end
  
end


x = Scraper.new
#testing out arrays
y = [ 0, 1, 2]
z = 3
#nyt = Articles.new
binding.pry
