# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Beer.destroy_all
User.destroy_all
Brewery.destroy_all


require 'rest-client'
require 'json'
# require 'faker'
# include Faker

User.create(name:"Jonathan", email: "jisung594@gmail.com")

# ALE / LAGER
ale_data = RestClient.get('https://api.untappd.com/v4/search/beer?client_id=6D5942DDE0B12CE48D02DDD50C8F149BD1F5C548&client_secret=1EB0D16E128BBB45DB9F2FADB25698E473274131&q=ale&limit=1000')
ale_hash = JSON.parse(ale_data)

ale_hash["response"]["beers"]["items"].each do |beer|
  Beer.create(name: beer["beer"]["beer_name"], image: beer["beer"]["beer_label"], style: beer["beer"]["beer_style"], description: beer["beer"]["beer_description"], abv: beer["beer"]["beer_abv"], brewery: beer["brewery"]["brewery_name"])
end

lager_data = RestClient.get('https://api.untappd.com/v4/search/beer?client_id=6D5942DDE0B12CE48D02DDD50C8F149BD1F5C548&client_secret=1EB0D16E128BBB45DB9F2FADB25698E473274131&q=lager&limit=1000')
lager_hash = JSON.parse(lager_data)

lager_hash["response"]["beers"]["items"].each do |beer|
  Beer.create(name: beer["beer"]["beer_name"], image: beer["beer"]["beer_label"], style: beer["beer"]["beer_style"], description: beer["beer"]["beer_description"], abv: beer["beer"]["beer_abv"], brewery: beer["brewery"]["brewery_name"])
end


# IPA
ipa_data = RestClient.get('https://api.untappd.com/v4/search/beer?client_id=6D5942DDE0B12CE48D02DDD50C8F149BD1F5C548&client_secret=1EB0D16E128BBB45DB9F2FADB25698E473274131&q=ipa&limit=1000')
ipa_hash = JSON.parse(ipa_data)

ipa_hash["response"]["beers"]["items"].each do |beer|
  Beer.create(name: beer["beer"]["beer_name"], image: beer["beer"]["beer_label"], style: beer["beer"]["beer_style"], description: beer["beer"]["beer_description"], abv: beer["beer"]["beer_abv"], brewery: beer["brewery"]["brewery_name"])
end


# PILSNER
pilsner_data = RestClient.get('https://api.untappd.com/v4/search/beer?client_id=6D5942DDE0B12CE48D02DDD50C8F149BD1F5C548&client_secret=1EB0D16E128BBB45DB9F2FADB25698E473274131&q=pilsner&limit=1000')
pilsner_hash = JSON.parse(pilsner_data)

pilsner_hash["response"]["beers"]["items"].each do |beer|
  Beer.create(name: beer["beer"]["beer_name"], image: beer["beer"]["beer_label"], style: beer["beer"]["beer_style"], description: beer["beer"]["beer_description"], abv: beer["beer"]["beer_abv"], brewery: beer["brewery"]["brewery_name"])
end


# PORTER / STOUT
porter_data = RestClient.get('https://api.untappd.com/v4/search/beer?client_id=6D5942DDE0B12CE48D02DDD50C8F149BD1F5C548&client_secret=1EB0D16E128BBB45DB9F2FADB25698E473274131&q=porter&limit=1000')
porter_hash = JSON.parse(porter_data)

porter_hash["response"]["beers"]["items"].each do |beer|
  Beer.create(name: beer["beer"]["beer_name"], image: beer["beer"]["beer_label"], style: beer["beer"]["beer_style"], description: beer["beer"]["beer_description"], abv: beer["beer"]["beer_abv"], brewery: beer["brewery"]["brewery_name"])
end

stout_data = RestClient.get('https://api.untappd.com/v4/search/beer?client_id=6D5942DDE0B12CE48D02DDD50C8F149BD1F5C548&client_secret=1EB0D16E128BBB45DB9F2FADB25698E473274131&q=stout&limit=1000')
stout_hash = JSON.parse(stout_data)

stout_hash["response"]["beers"]["items"].each do |beer|
  Beer.create(name: beer["beer"]["beer_name"], image: beer["beer"]["beer_label"], style: beer["beer"]["beer_style"], description: beer["beer"]["beer_description"], abv: beer["beer"]["beer_abv"], brewery: beer["brewery"]["brewery_name"])
end


# FRUIT
fruit_data = RestClient.get('https://api.untappd.com/v4/search/beer?client_id=6D5942DDE0B12CE48D02DDD50C8F149BD1F5C548&client_secret=1EB0D16E128BBB45DB9F2FADB25698E473274131&q=fruit&limit=1000')
fruit_hash = JSON.parse(fruit_data)

fruit_hash["response"]["beers"]["items"].each do |beer|
  Beer.create(name: beer["beer"]["beer_name"], image: beer["beer"]["beer_label"], style: beer["beer"]["beer_style"], description: beer["beer"]["beer_description"], abv: beer["beer"]["beer_abv"], brewery: beer["brewery"]["brewery_name"])
end

# HEFEWEIZEN
hefeweizen_data = RestClient.get('https://api.untappd.com/v4/search/beer?client_id=6D5942DDE0B12CE48D02DDD50C8F149BD1F5C548&client_secret=1EB0D16E128BBB45DB9F2FADB25698E473274131&q=hefeweizen&limit=1000')
hefeweizen_hash = JSON.parse(hefeweizen_data)

hefeweizen_hash["response"]["beers"]["items"].each do |beer|
  Beer.create(name: beer["beer"]["beer_name"], image: beer["beer"]["beer_label"], style: beer["beer"]["beer_style"], description: beer["beer"]["beer_description"], abv: beer["beer"]["beer_abv"], brewery: beer["brewery"]["brewery_name"])
end


# BREWERIES

# United States
brewery_data = RestClient.get('https://api.untappd.com/v4/search/brewery?client_id=6D5942DDE0B12CE48D02DDD50C8F149BD1F5C548&client_secret=1EB0D16E128BBB45DB9F2FADB25698E473274131&q=united_states&limit=1000')
us_brewery_hash = JSON.parse(brewery_data)

us_brewery_hash["response"]["brewery"]["items"].each do |brewery|
  Brewery.create(
    name: brewery["brewery"]["brewery_name"],
    image: brewery["brewery"]["brewery_label"],
    city: brewery["brewery"]["location"]["brewery_city"],
    state: brewery["brewery"]["location"]["brewery_state"],
    country: brewery["brewery"]["country_name"],
    beer_count: brewery["brewery"]["beer_count"]
  )
end

# Germany
brewery_data = RestClient.get('https://api.untappd.com/v4/search/brewery?client_id=6D5942DDE0B12CE48D02DDD50C8F149BD1F5C548&client_secret=1EB0D16E128BBB45DB9F2FADB25698E473274131&q=germany&limit=1000')
germany_brewery_hash = JSON.parse(brewery_data)

germany_brewery_hash["response"]["brewery"]["items"].each do |brewery|
  Brewery.create(
    name: brewery["brewery"]["brewery_name"],
    image: brewery["brewery"]["brewery_label"],
    city: brewery["brewery"]["location"]["brewery_city"],
    state: brewery["brewery"]["location"]["brewery_state"],
    country: brewery["brewery"]["country_name"],
    beer_count: brewery["brewery"]["beer_count"]
  )
end

# Japan
brewery_data = RestClient.get('https://api.untappd.com/v4/search/brewery?client_id=6D5942DDE0B12CE48D02DDD50C8F149BD1F5C548&client_secret=1EB0D16E128BBB45DB9F2FADB25698E473274131&q=japan&limit=1000')
japan_brewery_hash = JSON.parse(brewery_data)

japan_brewery_hash["response"]["brewery"]["items"].each do |brewery|
  Brewery.create(
    name: brewery["brewery"]["brewery_name"],
    image: brewery["brewery"]["brewery_label"],
    city: brewery["brewery"]["location"]["brewery_city"],
    state: brewery["brewery"]["location"]["brewery_state"],
    country: brewery["brewery"]["country_name"],
    beer_count: brewery["brewery"]["beer_count"]
  )
end
