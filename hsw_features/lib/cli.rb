require_relative "../lib/articles.rb"
require_relative "../lib/scraper.rb"
require 'pry'
class CommandLineInterface
  
  def greetings
    puts "Greetings! Below are the currently featured articles on howstuffworks.com!"
  end
  
  #def print_articles
   # Articles.each do |article|
    #  puts article.title
     # puts article.blurb
      #puts ""
    #end
  #end

  def scrape_for_featured_articles
    Scraper.new
  end
  
  def show_proof
    Articles.all
  end
  
  def run
    greetings
    scrape_for_featured_articles
  end
  
end

x = CommandLineInterface.new
binding.pry

#greet the user
#print five articles
#the print should be article name, new line, blurb, new line, and repeat
#ask the user which article they want
#print article, or provide link?