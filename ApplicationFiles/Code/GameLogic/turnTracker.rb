

class TurnTracker
    attr_reader :playerIndexToResolve, :currentTurn
   
    def initialize(playerCount)
        puts "Initializing Turn Manager..."

        @playerOrder = Array.new(playerCount) { |index| index }
        @playerIndexToResolve = 0
        @currentTurn = 0
    end

    def incrementTurn()
        @playerIndexToResolve += 1
        @currentTurn +=1
        if (@playerIndexToResolve > (@playerOrder.count -1))
            @playerIndexToResolve = (@playerIndexToResolve) % @playerOrder.count #wrap around to start. I did it this way in case we create any powerups that skip a players turn or something - we might want to go to player 1s turn instead of 0
        end
    end

end