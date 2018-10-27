require_relative "../lib/articles.rb"
#Dir["/path/to/directory/*.rb"].each {|file| require file }
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  
  attr_accessor :doc
  BASE_URL = "https://www.howstuffworks.com/"

  def initialize
    hsw
    self.create_articles_from_carousel
  end
  
  def hsw
    @doc = Nokogiri::HTML(open(BASE_URL))
  end
  
  def print_articles_from_carousel
    amount = @doc.css(".carousel-item").length
    
    amount.times do |i|
      puts i+1
      puts doc.css(".carousel-item")[i].css("h3").text
      puts doc.css(".carousel-item")[i].css("a").attribute('href').value #this way works, use .each to get all of them
      puts doc.css(".carousel-item")[i].css(".d-none").text
      puts ""
    end
  end

  def create_articles_from_carousel
    amount = @doc.css(".carousel-item").length
    
    amount.times do |i|
      title = doc.css(".carousel-item")[i].css("h3").text
      link = doc.css(".carousel-item")[i].css("a").attribute('href').value #this way works, use .each to get all of them
      blurb = doc.css(".carousel-item")[i].css(".d-none").text
      Articles.new(title, blurb, link)
    end
    
  end
  
  def show
    Articles.all
  end
  
  def go_to(address = "https://health.howstuffworks.com/mental-health/sleep/disorders/why-people-fall-asleep-movie-theaters.htm")
    Nokogiri::HTML(open(address))
  end
  
  def add_content_to_article(article)
    if article.content == nil
      puts "Downloading article, please wait."
      puts ""
      doc = go_to(article.url)
      article.content = doc.css(".infinite-item").css("p").text
    else
      puts "Article was downloaded before."
      puts ""
      article.content
    end
  end
  
  
  #below are old methods
  #def search
  #  hsw.css("#module-features").css("div")
  #end
  
  #def titles
    #doc.css(".carousel-item")[0].css("h3").text
    
    #@doc.css(".carousel-item").css("h3").map {|item| item.text}
    
    #@doc.css(".carousel-item")[0]
    
    #code below is either outdated due to site change or needs another method
    #@doc.css(".title").text #returns all the titles jumbled together
    #@doc.css(".title").map { |item| item.text} #returns an array of titles
    
    #needs instance method search
    #search.css(".title").map { |item| item.text} #uses instance method "search"
  #end
  
  #def blurbs
  #  search.css(".blurb").map { |item| item.text}
  #end
  
  #def get_urls
    #x.doc.css(".carousel-item")[0].css("a").attribute('href').value #this way works, use .each to get all of them
    
    #x.doc.css(".carousel-item").css("a").text #this way also gets titles of articles
    #x.doc.css(".carousel-item").css("a").map { |item| item.attribute('href').value} #gets a lot of links
    #x.doc.css(".carousel-inner").map {|item| item.css(".carousel-item").text} #doesn't put them in an array
    
    #code below is either outdated due to site change or needs another method to work
    #hsw.css("#module-features").css("a").map { |item| item.attribute('href').value }
  #end
  
  #def url_duplicate_remover
  #  get_urls.uniq
  #end
  
  #def add_urls
  #  url_duplicate_remover.reject.with_index { |element, index| index >=1 && index <= 2 }
  #end
end
