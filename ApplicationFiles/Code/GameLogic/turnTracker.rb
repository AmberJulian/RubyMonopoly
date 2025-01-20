

class TurnTracker
    attr_reader :currentTurn
   
    def initialize(playerCount)
        puts "Initializing Turn Manager..."

        @playerCount = playerCount
        @indexOfCurrentPlayer = 0
        @currentTurn = 0
    end

    def incrementTurn()
        @indexOfCurrentPlayer += 1
        @currentTurn +=1
        if (@indexOfCurrentPlayer > (@playerCount -1))
            @indexOfCurrentPlayer = (@indexOfCurrentPlayer) % @playerCount #wrap around to start. I did it this way in case we create any powerups that skip a players turn or something - we might want to go to player 1s turn instead of 0
        end
    end

    def getCurrentPlayerIndex
        return @indexOfCurrentPlayer
    end

end