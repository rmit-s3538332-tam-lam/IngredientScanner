f= File.open("ingredient.txt",'r')
#Ingredient to check for
badSulfates = ["Alkylbenzene Sulfonate","Alkyl Benzene Sulfonate","Ammonium Laureth Sulfate","Ammonium Lauryl Sulfate","Ammonium Xylenesulfonate",
    "Sodium C14-16 Olefin Sulfonate","Sodium Cocoyl Sarcosinate","Sodium Laureth Sulfate","Sodium Lauryl Sulfate","Sodium Lauryl Sulfoacetate",
    "Sodium Myreth Sulfate","Sodium Xylenesulfonate","TEA-dodecylbenzenesulfonate","Ethyl PEG-15 Cocamine Sulfate","Dioctyl Sodium Sulfosuccinate"]
badSilicones = ["Dimethicone","Bis-aminopropyl Dimethicone","Cetearyl Methicone","Cetyl Dimethicone","Cyclopentasiloxane","Stearoxy Dimethicone",
    "Stearyl Dimethicone","Trimethylsilylamodimethicone","Amodimethicone","Dimethicone","Dimethiconol","Behenoxy Dimethicone","Phenyl Trimethicone"]
badAlcohols = ["Denatured Alcohol","SD Alcohol 40","Witch Hazel","Isopropanol","Ethanol","SD alcohol","Propanol","Propyl Alcohol","Isopropyl Alcohol"]
otherBadIngredients = ["Mineral Oil","Paraffinum Liquidum","Petrolatum","Bees Wax","Candelilla Wax"]
whiteListIngredients= ["Phenoxyethanol"]
foundIngredients = Array.new



f.each_line do |line|
    puts line
    badSulfates.each do |ingredient|
        regex = /(^|\W)#{ingredient}($|\W)/i
        if line.match(regex) then foundIngredients.push(ingredient)  end
    end
    badSilicones.each do |ingredient|
        regex = /(^|\W)#{ingredient}($|\W)/i
        if line.match(regex) then foundIngredients.push(ingredient)  end
    end
    otherBadIngredients.each do |ingredient|
        regex = /(^|\W)#{ingredient}($|\W)/i
        if line.match(regex) then foundIngredients.push(ingredient)  end
    end
    badAlcohols.each do |ingredient|
        regex = /(^|\W)#{ingredient}($|\W)/i
        if line.match(regex)  then foundIngredients.push(ingredient)  end
        
    end
end
f.close()
uniqFoundIngredients = foundIngredients.uniq()

uniqFoundIngredients.each {|ingredient| puts "-----#{ingredient}"}

