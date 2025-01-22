
require 'json'
require_relative 'player'


#Intermediary class that handles player related queries from other classes
class PlayerAccessor
    attr_reader :playerCount
    #initialize all the players with names in our datafile, aka, all the ones given to us
    def initialize 
        puts "Initializing Player Manager..."
        @players = {} # Instance variable for storing players
        file = File.open "../../Data/players.json"
        playerData = JSON.load file
         
        @playerCount = playerData.count

        for i in 0..@playerCount-1
            @players[i] = Player.new(playerData[i], i)  
        end
    end

    
    def isAnyPlayerOutOfMoney
        for i in 0..@playerCount-1
            if (@players[i].money <= 0)
                return true
            end
        end
        return false
    end

    def updatePlayerLocation(playerIndex, newLocation)
        @players[playerIndex].location = newLocation
    end

    def getPlayerAtIndex(playerIndex)
        return @players[playerIndex]
    end

    def getPlayerName(playerIndex)
        return @players[playerIndex].name
    end

    def changePlayerMoney(playerIndex, moneyAmount)
        @players[playerIndex].money += moneyAmount
        if moneyAmount < 0
            puts "Removing $#{-moneyAmount} from #{getPlayerName(playerIndex)}'s money. They now have $#{@players[playerIndex].money}."
        else
            puts "Adding $#{moneyAmount} to #{getPlayerName(playerIndex)}'s money. They now have $#{@players[playerIndex].money}."
        end
    end

    def getWinner
        bestPlayer = 0
        for i in 1..@playerCount-1
            if (@players[i].money > @players[bestPlayer].money)
                bestPlayer = i
            end
        end
        return @players[bestPlayer]
    end

    def getLoser
        losingPlayer = 0
        for i in 1..@playerCount-1
            if (@players[i].money < @players[losingPlayer].money)
                losingPlayer = i
            end
        end
        return @players[losingPlayer]
    end
end

