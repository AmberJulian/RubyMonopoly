require_relative '../Player/playerManager'
require_relative '../Property/propertyOwnershipTracker'
require_relative 'turnTracker'
require_relative 'dieRoller'

class GameLoopManager #get around creating any events

    def initialize
        puts "Initializing Game Manager..."
        puts "Initializing other managers..."
        @propertyTracker = PropertyOwnershipTracker.new()
        @playerManager = PlayerManager.new()
        puts "Player count: #{@playerManager.playerCount}"

        @turnTracker = TurnTracker.new(@playerManager.playerCount)
        @dieRoller = DieRoller.new
        @maxTurns = @dieRoller.maxTurns
    end

    def gameLoop
        gameFinished = false;

        while !gameFinished && @turnTracker.currentTurn < @maxTurns
        
            resolveTurn(@turnTracker.playerIndexToResolve)
            @turnTracker.incrementTurn #ideally this would happen from turn manager being subscibed to an event on this class. Then Player manager would automatically resolve things based on the die roll.
        end
    end

    def resolveTurn(playerIndexToResolve)
        getDieRoll()
            puts "PLayerindexToResolve= #{playerIndexToResolve}"
        @playerManager.resolvePlayerTurn(playerIndexToResolve, @dieRoll)
    end

    def getDieRoll()
        @dieRoller.setNextDieRoll(@turnTracker.currentTurn)
        @dieRoll = @dieRoller.nextDieRoll
    end
end