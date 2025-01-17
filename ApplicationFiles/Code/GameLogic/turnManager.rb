

class TurnManager
    attr_reader :currentPlayerBeingResolved
   
    def initialize(playerCount)
        puts "Initializing Turn Manager..."

        size = 5
        @playerOrder = Array.new(playerCount) { |index| index }
        @currentPlayerBeingResolved = 0
    end

    def incrementPlayersTurn()
        @currentPlayerBeingResolved += 1
        if (@currentPlayerBeingResolved > (@playerOrder.count -1))
            @currentPlayerBeingResolved = (@currentPlayerBeingResolved) % @playerOrder.count #wrap around to start. I did it this way in case we create any powerups that skip a players turn or something - we might want to go to player 1s turn instead of 0
        end
    end

end