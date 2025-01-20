#importing the JSON Module 
require 'json'

#One thing that I would change about the board.json class is that each property should have an int ID - I'd like to avoid working with name strings to avoid creating unneccessary garbage. 
class PropertyOwnershipTracker 
  UNOWNEDPROPERTYKEY = -1  
  unownedPropertyHash = {}

 
  def initialize(data)
    puts "Initializing PropertyOwnershipTracker..."
   
    @propertyOwnershipHash ||= {} 
    data.each do |property|
      if "#{property["type"]}" == "property"
        @propertyOwnershipHash[property["name"]] = -1 
      end 
    end
  end

  def getPropertyIsOwned(propertyName)
    return @propertyOwnershipHash[propertyName] != -1
  end

  def getPropertyOwnerIndex(propertyName)
    return @propertyOwnershipHash[propertyName]
  end
end