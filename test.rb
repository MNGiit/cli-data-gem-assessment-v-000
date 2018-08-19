#puts "Hello World!"

require 'nokogiri'
require 'open-uri'
require 'pry'
module HswFeatures
  # Your code goes here...
end

#puts "Hello World!"

doc = Nokogiri::HTML(open("https://www.howstuffworks.com/"))
#doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
binding.pry