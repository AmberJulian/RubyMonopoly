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
        puts "Player #{player.name} moved #{spacesMoved} spaces from #{@propertyAccessor.getPropertyAtLocation(playerOriginalLocation)['name']} to #{@propertyAccessor.getPropertyAtLocation(playerFinalLocation)['name']}."

        if playerFinalLocation < playerOriginalLocation #assumes you can never roll higher than the number of spaces (currently 9)
            @playerAccessor.addPlayerMoney(playerIndex, 1)
            puts "#{player.name} has passed go and collected $1"
        end

        puts @propertyAccessor.getPropertyIsOwned(playerFinalLocation)
        if @propertyAccessor.getPropertyIsOwned(playerFinalLocation)
            ownerIndex = @propertyAccessor.getPropertyOwnerIndex(playerFinalLocation)
        else #property is not owned, if it is not go, buy it.

        end
    end


    def isGameOver
        return playerAccessor.isAnyPlayerOutOfMoney
    end
end