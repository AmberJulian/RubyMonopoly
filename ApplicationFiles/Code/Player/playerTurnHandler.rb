require_relative 'playerAccessor'
require_relative '../Property/propertyAccessor'

class PlayerTurnHandler
    attr_reader :playerAccessor

    def initialize 
        @playerAccessor = PlayerAccessor.new()
        @propertyAccessor = PropertyAccessor.new()
    end

    def resolvePlayerTurn(playerIndex, spacesMoved)
        #this function could be simplified a lot if we weren't outputting what happened in a turn
        player = playerAccessor.getPlayerAtIndex(playerIndex)
        playerOriginalLocation  = player.location
        playerFinalLocation = @propertyAccessor.getPropertyPositionLandedOn(playerOriginalLocation, spacesMoved)
        playerAccessor.updatePlayerLocation(playerIndex, playerFinalLocation)
        puts "Player #{player.name} moves #{spacesMoved} spaces from #{@propertyAccessor.getPropertyAtLocation(playerOriginalLocation)['name']} to #{@propertyAccessor.getPropertyAtLocation(playerFinalLocation)['name']}."

        if playerFinalLocation < playerOriginalLocation #assumes you can never roll higher than the number of spaces (currently 9)
            @playerAccessor.addPlayerMoney(playerIndex, 1)
            puts "#{player.name} has passed go and collected $1"
        end

        propertyPrice = @propertyAccessor.getPropertyAtLocation(playerFinalLocation)["price"] #rent price is the same as property price

        isPropertyOwned = @propertyAccessor.getPropertyIsOwned(playerFinalLocation)
        if isPropertyOwned
            ownerIndex = @propertyAccessor.getPropertyOwnerIndex(playerFinalLocation)
            puts "Property is already owned by #{@playerAccessor.getPlayerName(ownerIndex)}, and so #{player.name} will need to pay rent."
            if @propertyAccessor.getPropertySetIsOwned(playerFinalLocation)
                  puts "#{@playerAccessor.getPlayerName(ownerIndex)} owns the whole set and so rent is doubled."
                @playerAccessor.addPlayerMoney(ownerIndex, propertyPrice * 2)
                @playerAccessor.addPlayerMoney(playerIndex, -propertyPrice * 2)
            else
                @playerAccessor.addPlayerMoney(ownerIndex, propertyPrice)
                @playerAccessor.addPlayerMoney(playerIndex, -propertyPrice)
            end
        else #property is not owned
            if @propertyAccessor.getPropertyCanBeOwned(playerFinalLocation)
                @playerAccessor.addPlayerMoney(playerIndex, -propertyPrice)
                puts "#{player.name} has bought #{@propertyAccessor.getPropertyAtLocation(playerFinalLocation)['name']}."
                @propertyAccessor.setPropertyOwner(playerFinalLocation, playerIndex)
                if (@propertyAccessor.getPropertySetIsOwned(playerFinalLocation))
                    puts "#{player.name} now owns the #{@propertyAccessor.getPropertyColour(playerFinalLocation)} set."
                end
            end
        end
    end



    def isGameOver
        return playerAccessor.isAnyPlayerOutOfMoney
    end
end