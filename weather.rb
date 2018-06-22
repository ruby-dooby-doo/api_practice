require 'unirest'

# take this API and make it an 'app'

# input: city and state
# output: 'It is (type of weather) and (temperature) in (city) right now'

# what do we need to do?

# obtain the correct data from the response
  # outputs
  # temp -- 63
  # type of weather (breezy)

# somehow obtain the weather for whichever city the user typed in
# get some user input about the city and state

# put that data in the sentence at the end

p "type in your city"
user_city = gets.chomp
p "type in your state"
user_state = gets.chomp

response = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{user_city}%2C%20#{user_state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")

p

temperature = response.body['query']['results']['channel']['item']['condition']['temp']
condition = response.body['query']['results']['channel']['item']['condition']['text']
response_city = response.body['query']['results']['channel']['location']['city']

p "It is #{condition} and #{temperature} in #{response_city} right now"

# puts JSON.pretty_generate(response.body['query']['results']['channel']['item']['condition'])




