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
        return @propertyOwnershipTracker.getPropertyIsOwned(@properties[location]["name"])
    end

    def getPropertyOwnerIndex(propertyName)
        return @propertyOwnershipTracker.getPropertyOwnerIndex(propertyName)
      end
end