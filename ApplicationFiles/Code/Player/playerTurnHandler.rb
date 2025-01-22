require_relative 'playerAccessor'
require_relative '../Property/propertyAccessor'

class PlayerTurnHandler
    attr_reader :playerAccessor

    def initialize 
        @playerAccessor = PlayerAccessor.new()
        @propertyAccessor = PropertyAccessor.new()
    end

    def resolvePlayerTurn(playerIndex, spacesMoved)
        #Get Current Player
        player = playerAccessor.getPlayerAtIndex(playerIndex)
        puts "It is now #{player.name}'s turn. They start their turn with $#{player.money}."

        updatePlayerLocation(player, playerIndex, spacesMoved)
        handlePlayerLandingOnProperty(player, playerIndex)
    end

    def updatePlayerLocation(player, playerIndex, spacesMoved)
        #Update Player Location
        playerOriginalLocation  = player.location
        playerFinalLocation = @propertyAccessor.getPropertyPositionLandedOn(playerOriginalLocation, spacesMoved)
        playerAccessor.updatePlayerLocation(playerIndex, playerFinalLocation)
        puts "Player #{player.name} moves #{spacesMoved} spaces from #{@propertyAccessor.getPropertyAtLocation(playerOriginalLocation)['name']} to #{@propertyAccessor.getPropertyAtLocation(playerFinalLocation)['name']}."

        if playerFinalLocation < playerOriginalLocation #assumes you can never roll higher than the number of spaces (currently 9)
            if (playerFinalLocation == 0)
                puts "#{player.name} has landed on go and is awarded $1"
            else
                puts "#{player.name} has passed go and is awarded $1"
            end
            @playerAccessor.changePlayerMoney(playerIndex, 1)
        end
    end

    def handlePlayerLandingOnProperty(player, playerIndex)
        #Calculate property Price
        propertyPrice = @propertyAccessor.getPropertyAtLocation(player.location)["price"] #rent price is the same as property price

        #Set property ownership and remove money
        isPropertyOwned = @propertyAccessor.getPropertyIsOwned(player.location)
        if isPropertyOwned
            ownerIndex = @propertyAccessor.getPropertyOwnerIndex(player.location)
            puts "Property is already owned by #{@playerAccessor.getPlayerName(ownerIndex)}, and so #{player.name} will need to pay $#{propertyPrice} rent."
            if @propertyAccessor.getPropertySetIsOwned(player.location)
                puts "#{@playerAccessor.getPlayerName(ownerIndex)} owns the whole set and so the $#{propertyPrice} rent is doubled to $#{propertyPrice * 2}."
                @playerAccessor.changePlayerMoney(ownerIndex, propertyPrice * 2)
                @playerAccessor.changePlayerMoney(playerIndex, -propertyPrice * 2)
            else
                @playerAccessor.changePlayerMoney(ownerIndex, propertyPrice)
                @playerAccessor.changePlayerMoney(playerIndex, -propertyPrice)
            end
        else #if property is not owned
            if @propertyAccessor.getPropertyCanBeOwned(player.location)
                @playerAccessor.changePlayerMoney(playerIndex, -propertyPrice)
                puts "#{player.name} has bought #{@propertyAccessor.getPropertyAtLocation(player.location)['name']}."
            
                @propertyAccessor.setPropertyOwner(player.location, playerIndex)
                if (@propertyAccessor.getPropertySetIsOwned(player.location))
                    puts "#{player.name} now owns the #{@propertyAccessor.getPropertyColour(player.location)} set."
                end
            end
         end
     end

    def isGameOver
        return playerAccessor.isAnyPlayerOutOfMoney
    end

    def getWinner
        return playerAccessor.getWinner
    end

    def getLoser
        return playerAccessor.getLoser
    end
end