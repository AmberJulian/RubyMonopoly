require_relative 'propertyOwnershipTracker'

#Intermediary class that handles property related queries from other classes
class PropertyAccessor

    def initialize
        puts "Initializing Property Manager..."
        file = File.open "../../Data/board.json"
        @properties = JSON.load file

        @propertyOwnershipTracker = PropertyOwnershipTracker.new(@properties)
        @propertyCount = @properties.count
    end

    #Adds position onto current position and calculates wrap around (if the player passed go)
    def getPropertyPositionLandedOn(currentPosition, positionsMoved)
        return (currentPosition + positionsMoved)% @propertyCount
    end

    def getPropertyAtLocation(location)
        return @properties[location]
    end

    def getPropertyIsOwned(location)
        if @properties[location]["type"] != "property"
            return false
        else
            return @propertyOwnershipTracker.getPropertyIsOwned(@properties[location]["name"])
        end
    end

    def getPropertyCanBeOwned(location)
        if @properties[location]["type"] == "property"
            return true
        else
            return false
        end
    end

    def getPropertySetIsOwned(location)
        propertyColour = @properties[location]["colour"]
        propertyOwnerIndex = getPropertyOwnerIndex(location)
        isSetOwned = true

        for i in 0..@properties.count-1
            if "#{@properties[i]["colour"]}" == propertyColour
                if (getPropertyOwnerIndex(i)) != propertyOwnerIndex
                    isSetOwned = false
                end
            end 
          end
        return isSetOwned
    end

    def getPropertyOwnerIndex(location)
        return @propertyOwnershipTracker.getPropertyOwnerIndex(@properties[location]["name"])
    end

    def setPropertyOwner(location, ownerIndex)
        @propertyOwnershipTracker.setPropertyOwnerIndex(@properties[location]["name"], ownerIndex)
    end

    def getPropertyColour(location)
        return @properties[location]["colour"]
    end
end