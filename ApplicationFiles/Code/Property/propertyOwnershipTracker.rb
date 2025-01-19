#importing the JSON Module 
require 'json'


class PropertyOwnershipTracker 
#Example of how to get information out
#data = '{"Name" : "Harsha" ,"Subject":{"1":"Physics","2":"Maths"}}'
#json_string = JSON.parse(data)
#puts json_string["Name"]
  UNOWNEDPROPERTYKEY = -1 #Constants begin with capital letters. The first example I saw had the declaration totally uppercase, so I've done that here. 
  unownedPropertyHash = {}

  #Ruby has a built in initialize method, for setting default values
  def initialize
   # puts "Hello World" # this is how to console.log
  puts "Initializing Property Manager..."
   file = File.open "../../Data/board.json"
   data = JSON.load file
   #puts data
   
   data.each do |property|
    if "#{property["type"]}" == "property"
      propertyOwnershipHash = {:"#{property["name"]}" => -1}
      puts propertyOwnershipHash
    end
   end
  
  
  end #End closes a block. I think it might be similar to return. 
end

# initialize object
PropertyOwnershipTracker.new