require_relative "../lib/articles.rb"
require_relative "../lib/scraper.rb"
require 'pry'
class CommandLineInterface
  
  attr_accessor :scraped
  
  def greetings
    puts "Greetings! Below are the currently featured articles on howstuffworks.com!"
  end
  
  def print_articles
    Articles.all.each do |article|
      puts article.title
      puts article.blurb
      puts ""
    end
  end

  def scrape_for_featured_articles
    @scraped = Scraper.new
    return nil
  end
  
  def show_proof
    Articles.all
  end
  
  def run
    greetings
    scrape_for_featured_articles
    print_articles
  end
  
  def scrape_selected_article(selected)
    @scraped.add_content_to_article(selected)
  end  
  
end


#practice zone
##############
##############

x = CommandLineInterface.new
x.scrape_for_featured_articles
y = Articles.all[0]
#x.scrape_selected_article(y)
puts y.content
binding.pry
