require 'unirest'

# Build a terminal dictionary app

# Create a new ruby file called dictionary_app.rb

# The program should ask the user to enter a word, then use the wordnik API to show the word’s definition, top example, and pronunciation: http://developer.wordnik.com/docs.html#!/word
# Bonus: Write your program in a loop such that the user can keep entering new words without having to restart the program. Give them the option of entering q to quit

# pseudocode
# user enters a word
while true
  system "clear"
  p "what word"
  user_word = gets.chomp
  if user_word == 'q'
    break
  end


  # unirest looks up the definition
  response = Unirest.get("https://api.wordnik.com/v4/word.json/#{user_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  # puts JSON.pretty_generate(response.body)

  definitions = response.body

  p "definitions"
  p
  definitions.each do |definition|
    p definition['text']
  end

  # definition = response.body[0]['text']
  # p definition
  # unirest looks up the top example
  response = Unirest.get("https://api.wordnik.com/v4/word.json/#{user_word}/topExample?useCanonical=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  top_example = response.body['text']
  p "top_example"
  p
  p top_example
  response = Unirest.get("https://api.wordnik.com/v4/word.json/#{user_word}/pronunciations?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  # puts JSON.pretty_generate()
  pronunciations = response.body

  p "pronunciations"
  p
  pronunciations.each do |pronunciation|
    p pronunciation['raw']
  end

  # pronunciation = response.body[0]['raw']
  # p pronunciation


  # unirest looks up the pronunciation
  # show that information to the user

end
