# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Beer.destroy_all
User.destroy_all


require 'rest-client'
require 'json'
require 'faker'
include Faker

User.create(name:"Jonathan", email: "jisung594@gmail.com")


beer_data = RestClient.get('https://api.untappd.com/v4/search/beer?client_id=6D5942DDE0B12CE48D02DDD50C8F149BD1F5C548&client_secret=1EB0D16E128BBB45DB9F2FADB25698E473274131&q=beer&limit=500')
beer_hash = JSON.parse(beer_data)

beer_hash["response"]["beers"]["items"].each do |beer|
  Beer.create(name: beer["beer"]["beer_name"], image: beer["beer"]["beer_label"], style: beer["beer"]["beer_style"], description: beer["beer"]["beer_description"], abv: beer["beer"]["abv"], brewery: beer["brewery"]["brewery_name"])
end



# 100.times do
#   Beer.create(
#     name: Faker::Beer.name,
#     image: "https://cdn.shopify.com/s/files/1/1587/3041/products/Garage_project_-_Beer_480x480.png?v=1516493605",
#     style: Faker::Beer.style,
#     description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
#     abv: Faker::Beer.alcohol
#   )
# end


# beer_data = RestClient.get('http://api.brewerydb.com/v2/beers/?key=afe69a87d4126239031c4abba79cd743')
# beer_hash = JSON.parse(beer_data)
#
# beer_hash["data"].each do |beer|
#   if beer[0] != nil || beer[1] != nil
#     Beer.create(name: beer["name"], image: beer["labels"]["large"], style: beer["style"]["shortName"], description: beer["style"]["description"], abv: beer["abv"])
#   end
# end


# Beer.create(name: "Port-Barrel Aged Barleywine-Style Ale", style: "American Barleywine", description: "Aged for months in oversized port wine barrels, this Barleywine-style Ale benefits from barrel-aging's oxidative nature and offers notes of molasses, prunes and brown sugar.", abv: "10")
#
# Beer.create(name: "Purple Haze", style: "Fruit Beer", description: "Experience the magic of Purple Haze.® Clouds of real raspberries swirl in this tart and tantalizing lager inspired by the good spirits and dark mysteries of New Orleans. Brewed with pilsner and wheat malts along with Vanguard hops, let the scent of berries in the hazy purple brew put a spell on you.", abv: "4.2")
#
# Beer.create(name: "Strawberry Lager", style: "Fruit Beer", description: "The juice of red, ripe Louisiana strawberries, harvested at the peak of the season, gives this crisp lager its strawberry flavor, aroma and haze. Made with pilsner and wheat malts and Vanguard hops, all our Harvest Series brews are made with the finest Louisiana-grown ingredients.", abv: "4.2")
#
# Beer.create(name: "Pilsner", style: "Czech Pilsner", description: "Inspired by Czech tradition, our Pilsner is light in color and body with a clean, bitter finish. Czech Saaz hops impart soft floral and grassy aromas. This style is deceptively difficult to brew, and we've worked hard to perfect our take on this unassuming lager.", abv: "5")
#
# Beer.create(name: "McKenzie's Hard Cider - Original", style: "Cider - Other", description: "Our Original Hand-Pressed Hard Cider is reminiscent of its UK predecessors – refreshing, medium body and not too dry with a crisp apple finish.", abv: "5")
#
# Beer.create(name: "Party Piñata", style: "IPA Milkshake", description: "Sour IPA with Sabro, Idaho 7, Pineapple Puree, Toasted Coconut, Vanilla, Milk Sugar, and Citra t45.", abv: "8.4")
#
# Beer.create(name: "Aurelia", style: "Saison / Farmhouse Ale", description: "A Farmhouse Style Ale brewed with our house saison yeast. Appearance is copper with a pillowy beige head. Delicate spice in the aroma with hints of toast. On the palate subtle dark fruits with a bready malt character. After a short lagering period, this beer finishes clean and dry with a firm earthy bitterness.", abv: "7.5")
#
# Beer.create(name: "Namaste White", style: "Witbier", description: "A witbier bursting with good karma. Made with dried organic orange slices, fresh-cut lemongrass and a bit of coriander, this Belgian-style white beer is a great thirst quencher. Namaste White was originally brewed at our pub in Rehoboth Beach with our Italian friend Leo from Birra del Borgo. It was a tribute to our friends at 3 Fonteinen brewery in Belgium, who had devastating production loss (1/3 of their annual production) in 2009.", abv: "4.8")
#
# Beer.create(name: "Nitro Oatmeal Stout", style: "Stout - Oatmeal", description: "Brewed with flaked oats, chocolate malt, roasted barley and Nugget hops. Nitrogen-infused for a creamy mouthfeel and attractive cascade effect.", abv: "4.5")
#
# Beer.create(name: "Mr. Peach", style: "Sour - Ale", description: "Sour beer aged on fresh peaches.", abv: "5.2")
#
# Beer.create(name: "Velvet Panda", style: "American Stout", description: "Our award winning Stout has a velvety mouthfeel and nicely balanced bitterness. Two row base malt accentuated by roasted barley, Carafa II, flaked oats & barley, chocolate & Black Malt. TASTING NOTES: Roasted Barley, Coffee, Chocolate, Dry. AWARDS: 2013 & 2014 People's Choice Award - Hudson Valley Craft Beer Festival.", abv: "5.2")
#
# Beer.create(name: "Brooklyn Brewery Unfiltered", style: "Pilsner - Other", description: "Brisk, hazy, and gently bready keller pilsner with a well-tuned smooth finish.", abv: "4.3")
#
# Beer.create(name: "Oiginal Sin Hard Cider", style: "Cider - Other", description: "Original Sin is a critically acclaimed cider launched in 1997. From day one we've been committed to producing premium quality cider using the finest ingredients. Original Sin contains no artificial flavors or colors allowing the natural qualities of the apple to speak for itself.", abv: "6")
#
# Beer.create(name: "Abt 12", style: "Belgian Quad", description: "The St.Bernardus Abt 12 is the pride of our stable, the nec plus ultra of our brewery. Abbey ale brewed in the classic 'Quadrupel' style of Belgium's best Abbey Ales. Dark with a full, ivory-colored head. It has a fruity aroma, full of complex flavours and excells because of its long bittersweet finish with a hoppy bite. (10,0% ABV) Worldwide seen as one of the best beers in the world. It's a very balanced beer, with a full-bodied taste and a perfect equilibrium between malty, bitter and sweet. One of the original recipes from the days of license-brewing for the Trappist monks of Westvleteren.", abv: "10")
#
# Beer.create(name: "Sumpin' Easy", style: "Pale Wheat Ale - American", description: "A healthy dose of 2-row malted barley, a bit of wheaty-esque-ish-ness and loads of Ekuanot hops to create a super smooth and velvety ale with a fruit and resin-y- finish like biting into a freshly pickled peach. Easy!", abv: "5.7")
#
# Beer.create(name: "420 Extra Pale Ale", style: "Pale Ale - American", description: "SweetWater 420 Extra Pale Ale, our most popular brew, is a tasty West Coast Style Pale Ale with a stimulating hop character and a crisp finish. 1st brewed on April 20th 1997.", abv: "5.7")
#
# Beer.create(name: "Mind Haze", style: "IPA - New England", description: "From the coast of California comes Mind Haze, a free-spirited beer made to elevate your perceptions—juicy yet balanced, hazy yet lasting, and loaded with an imaginative array of tropical hop flavors. In the words of Brewmaster Matt Brynildson, Mind Haze offers the best of what you expect from a hazy IPA. But we're going about it a little differently, and that's what gives Mind Haze its own unique signature. We're finally ready to do a hazy IPA the Firestone way.", abv: "6.2")
#
# Beer.create(name: "Stone Tropic ofThunder Lager", style: "Lager - IPL (India Pale Lager)", description: "Imagine you set sail for a three hour tour. Let's say from the port of Escondido (work with us here). The weather started getting rough. You're tiny ship (but not lunch, thankfully) was tossed. Long story short: You're marooned on a remote island somewhere near the Tropic of Thunder. The good news is that the Capt. Of the S.S. Stone and her brewing kit were among the small cast of colorful characters that survived the rough voyage with you. Mainstays Citra & Mosaic along with newcomer Cashmere hops are joined by their juicy tropical aromas of citrus, pineapple and coconut (try stringing all that together in a catchy tune). The rescue ship will find you all soon enough. For now, set aside the non-working cell phone and lack of social media (again, work with us here), kick back and revel in your moment of tropical island Lagoon serenity.", abv: "5.8")
#
# Beer.create(name: "Winter Welcome Ale", style: "Winter Ale", description: "This seasonal beer is a limited edition brewed for the short days and long nights of winter. The full body resulting from fermentation in 'stone Yorkshire squares' and the luxurious malt character, which will appeal to a broad range of drinkers, is balanced against whole-dried Fuggle and Golding hops with nuances and complexities that should be contemplated before an open fire. Bottle: Pasteurised. Each year the label has a different picture. Ingredients: Water, malted barley, yeast, hops, seaweed finings, carbon dioxide.", abv: "6")
#
# Beer.create(name: "White Ghost Berliner Weisse", style: "Sour - Berliner Weisse", description: "Our tartly refreshing, kettle-soured Stone Berliner Weisse gained its orthodox sour and acidic character from a specially selected Lactobacillus strain sourced from local Berlin cultures. To ensure a properly Stone, and therefore iconoclastic, Berliner Weisse, we upped the ABV to a healthy 4.7% and hopped the beer with new German varieties, Huell Melon and Callista. This beer embodies the liveliness of summer with the fruity tang of apricots and the sweetness of ripe honeydew. Versions exist labelled both White Ghost and White Geist.", abv: "4.7")
#
# Beer.create(name: "Delirium Nocturum", style: "Belgian Strong Dark Ale", description: "Bottle: 33cl with crown cap / 75cl with cork and muselet Barrels: 15l, 20l, 30l and 50l. Alcohol volume: 8.5% ABV Colour and sight: pale blond, the fine and regular effervesce ensures a fine and stable head. Scent: Slightly malty, a nice touch of alcohol, spicy. Flavour: Feels like the sound shot of alcohol is igniting the mouth. In reality the tongue and palate are warmed. The taste is characterized by its roundness. The aftertaste is strong, long-lasting and dry bitter.", abv: "8.5")
#
# Beer.create(name: "Sweet Baby Jesus!", style: "Porter - American", description: "Chocolate Peanut Butter Porter with natural and artificial flavors. First brewed in 2011, this Chocolate Peanut Butter Porter is jet black in color with a tan, rocky head, full body and creamy, luxurious mouthfeel. Its lightly sweet, malty flavor is accented by strong notes of chocolate, coffee and peanut butter, and balanced by a subtle hop character and moderate 6.5% abv. Sweet Baby Jesus finishes smooth, dry and roasty with notes of chocolate, espresso and peanut butter so rich, you will exclaim its name!", abv: "6.2")
#
# Beer.create(name: "Numero Uno Agave Cerveza", style: "Lager - Pale", description: "Brewed with agave nectar and lime peel, it's the artisanal answer to the easy-drinking, south-of-the-border light lagers.", abv: "4.9")
#
# Beer.create(name: "Jai Alai", style: "IPA - American", description: "Jai Alai, a game native to the Basque region of Spain, is played on a court called a fronton. Jai Alai players attempt to catch a ball using a curved mitt whilst the ball travels at speeds up to 188mph! Proving they have a sense of humor the Spanish dubbed this game, with its ball traveling at race car speeds, 'the merry game.' Tampa was once home to a bustling Jai Alai fronton but sadly all that remains of Jai Alai in the Tampa Bay area is this India Pale Ale that we brew in tribute to the merry game. The India Pale Ale style of beer has its roots in the ales sent from England to thirsty British troops in India during the 18th century. Pair Jai Alai India Pale Ale with beef empanadas, deviled crabs, and other spicy dishes.", abv: "7.5")
#
# Beer.create(name: "Brew York Pale Ale", style: "Pale Ale - American", description: "Ithaca Beer Co. is the first New York State brewery to commit to high volume, long-term use of New York-grown ingredients. The beer was brewed using 100% New York hops, and nearly 70% New York-grown barley.", abv: "5.25")
#
# Beer.create(name: "White Aphro", style: "Witbier", description: "White Aphrodisiac, or White 'Aphro' is a Belgian-Style unfiltered Wit Ale. Featuring the perfect balance of Pilsner and Wheat Malt this beer incorporates Hallertauer Hops, lavender, ginger and lemon peel.", abv: "6")
#
# Beer.create(name: "Pint of No Return", style: "Lager - Dark", description: "Pursue your deepest urge in this new American Lager by Hardywood Park Craft Brewery, The Happy Hour Guys and The Phantom of the Opera on Broadway. A paradox for the senses, Pint of No Return is a clean and crisp lager that pours as black as night with notes of toasted pecan, a mild hint of black currant and smooth roasted undertones.", abv: "5.5")
#
# Beer.create(name: "Delirium Tremens", style: "Belgian Strong Golden Ale", description: "NB: Depending on the location and batch, this beer can be either 8.5% or 8.7%. Please do not post an edit request asking to change it from one to the other. The allusion to pink elephants and the choice of names is not due to chance. With a particular character, the unique taste of results from the use of three different kinds of yeast. The result is a finish of peppery bitterness without aggression. The gray bottle hides a mystery awaiting discovery by the none faint of heart.", abv: "8.5")
#
# Beer.create(name: "Curieux", style: "Belgian Tripel", description: "First brewed back in 2004, Curieux was our initial foray into barrel aging. To make Curieux, we take our Tripel and let it age in bourbon barrels for six-to-eight weeks. Once that time is up, we take the beer out of our cold cellars and blend it back with a portion of fresh Tripel. The resulting rich, golden ale features smooth notes of coconut, vanilla, and a hint of bourbon.", abv: "11")
#
# Beer.create(name: "Leffe Blonde / Blond", style: "Blonde Ale - Belgian Blonde / Golden", description: "In the fifties, an extraordinary meeting took place that all beer enthusiasts should raise their glass of Leffe to.
# The abbey's Father Abbot Nys became acquainted with Albert Lootvoet, a master brewer. Passionate about the future of the brewery, Father Nys was upset to have to witness how, since the unpleasant stay of the French revolutionaries, the brewery had slowly fallen into decline and had eventually had to close its doors in 1809. Such a magnificent place could not be forgotten, he believed, and he vowed to bring the Leffe beer back. Father Nys and the brewer set about the challenge with vigour…and succeeded. Shortly after, the Leffe brewery was back in full effect. After Leffe Brown, a beer that shone brighter than the sun saw the light of day; they named it Leffe Blond – a beautiful chapter for Leffe indeed. Leffe Blond is the flagship of Leffe. The unique recipe is the fruit of centuries of experience in the art of brewing, which brings a broad palette of aromas into balance. It is elegant, smooth and fruity, and it has a spicy aftertaste with a hint of bitter orange. Its light, sunny colour is due to the use of pale malt. Leffe Blond contains 6.6 % alcohol and fits excellently with a wide variety of dishes. It is best at a temperature of 5° to 6° Celsius. A thirst-quenching aperitif, for those relaxing moments with friends and family.", abv: "6.6")
#
# Beer.create(name: "Rosé", style: "Cider - Other", description: "Angry Orchard Rosé Cider is made with rare, red flesh apples from France. Each apple is crisp, juicy and red to the core, adding an irresistible rosy blush and apple-forward taste with a refreshing dry finish.", abv: "5.5")
#
# Beer.create(name: "Wells Banana Bread Beer", style: "Fruit Beer", description: "ABV of 5.2% in bottles, and 4.5% on cask. A silky, crisp, and rich amber-colored ale with a fluffy head and strong banana note on the nose.", abv: "5.2")
#
# Beer.create(name: "Weihenstephaner Hefeweissbier", style: "Hefeweizen", description: "Our golden-yellow wheat beer, with its fine-pored white foam, smells of cloves and impresses consumers with its refreshing banana flavour. It is full bodied and with a smooth yeast taste. To be enjoyed at any time (always a pleasure / enjoyment), goes excellently with fish and seafood, with spicy cheese and especially with the traditional Bavarian veal sausage. Brewed according to our centuries-old brewing tradition on the Weihenstephan hill.", abv: "5.4")
#
# Beer.create(name: "Hofbräu Münchner Weisse / Münchner Kindl / Hefe Weizen", style: "Hefeweizen", description: "Die obergärige, Münchner Weisse ist der Geheimtipp für alle Weißbier­genießer, die spritzige, prickelnde Erfrischung schätzen. Hell bernsteinfarben mit einer cremigen Schaumkrone und einem harmonisch fruchtigen Bukett entfaltet sich Münchner Weisse mit einem Alkoholgehalt von 5,1% Vol. im Glas. Ihr Geschmack ist feinhefig, spritzig, aromatisch-estrig und mit einem mild-süßlichen Ausklang. Ein erfrischendes Vergnügen!", abv: "5.1")
#
# Beer.create(name: "Monkey Fist IPA", style: "IPA - American", description: "The traditional elements of a classic English IPA have been redefined by American craft beer innovation. This beer is brilliant copper in color and exploding with Warrior, Glacier and Cascade hop character but able to maintain a beautiful balance.", abv: "6")
#
# Beer.create(name: "All Day IPA", style: "IPA - Session / India Session Ale", description: "Satisfies your tastes while keeping your senses sharp. Brewed with a complex array of ingredients. Balanced for optimal aromatics and a clean finish.", abv: "4.7")
