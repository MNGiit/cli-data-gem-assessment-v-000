require 'pry'
class CommandLineInterface
  
  def greetings
    "Greetings! Below are the currently featured articles on howstuffworks.com!"
  end
  
  def print_articles
    
  end

  
end

x = CommandLineInterface.new
binding.pry

#greet the user
#print five articles
#the print should be article name, new line, blurb, new line, and repeat
#ask the user which article they want
#print article, or provide link?