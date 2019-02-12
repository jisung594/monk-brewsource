# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'rest-client'
require 'json'

  #make the web request

  beer_data = RestClient.get('http://api.brewerydb.com/v2/beers/?key=afe69a87d4126239031c4abba79cd743')
  beer_hash = JSON.parse(beer_data)
  # puts beer_hash["data"]
  #
  # beer_hash["data"].each do |beer|
  #   # puts beer["name"]
  #   puts "#{beer["style"]["name"]}: #{beer["style"]["description"]}"
  # end
  Beer.all.destroy

  beer_hash["data"].each do |beer|
    if beer[0] != nil || beer[1] != nil
      Beer.create(name: beer["name"], style: beer["style"]["shortName"], description: beer["style"]["description"], abv: beer["abv"])
    end
  end

  # reset seeds (delete Budweiser seeds)
  # seed the rest yourself
  # try Faker to seed beers
