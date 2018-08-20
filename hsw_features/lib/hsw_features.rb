#require "hsw_features/version"
require 'nokogiri'
require 'open-uri'
require 'pry'
module HswFeatures
  # Your code goes here...
end

#puts "Hello World!"

doc = Nokogiri::HTML(open("https://www.howstuffworks.com/"))
html = doc.css("#module-features")
features = doc.css("#module-features").css("div")

# Get Titles
titles = features.css(".title").map { |item| item.text}
#titles = doc.css("#module-features").css(".title").text

# Get Blurbs
blurbs = features.css(".blurb").map { |item| item.text}
#blurbs = doc.css("#module-features").css(".blurb").text

# Get URLs
urls = features.css("a href").map { |item| item.value}

#url = doc.css("#module-features").css("a href=").text

#this code below works for getting urls, but i'm getting urls i don't need
#doc.css("#module-features").children.css("a").map { |item| item.attribute('href').value}
arr_one = html.css("a").map { |item| item.attribute('href').value }
arr_two = arr_one.uniq
#arr_one has 12 links, while arr_two has 7 links...so uniq works but there are only 5 featured articles on the front page
#one is a link to the author of the first article
#and another is a link to the category of the first article
#so I can skip [1] and [2]

# Going to want an Object to handle this data
# the class will be called...Articles

