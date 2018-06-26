f= File.open("ingredient.txt",'r')
#Ingredient to check for
badSulfates = ["Alkylbenzene sulfonate","Alkyl Benzene Sulfonate","Ammonium laureth sulfate","Ammonium lauryl sulfate","Ammonium Xylenesulfonate",
    "Sodium C14-16 Olefin Sulfonate","Sodium cocoyl sarcosinate","Sodium laureth sulfate","Sodium Myreth","Sodium lauryl sulfate","Sodium lauryl sulfoacetate",
    "Sodium myreth sulfate","Sodium Xylenesulfonate","TEA-dodecylbenzenesulfonate","Ethyl PEG-15 cocamine sulfate","Dioctyl sodium sulfosuccinate"]
badSilicones = ["Dimethicone","Bis-aminopropyl dimethicone","Cetearyl methicone","Cetyl Dimethicone","Cyclopentasiloxane","Stearoxy Dimethicone",
    "Stearyl Dimethicone","Trimethylsilylamodimethicone","Amodimethicone","Dimethicone","Dimethiconol","Behenoxy Dimethicone","Phenyl trimethicone"]
badAlcohols = ["Denatured alcohol","SD alcohol 40","Witch hazel","Isopropanol","Ethanol","SD alcohol","Propanol","Propyl alcohol","Isopropyl alcohol"]
otherBadIngredients = ["Mineral oil","Paraffinum liquidum","Petrolatum","Bees wax","Candelilla wax"]
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

