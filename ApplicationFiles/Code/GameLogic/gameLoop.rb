require_relative '../Player/playerTurnHandler'
require_relative 'turnTracker'
require_relative 'dieRoller'

class GameLoop #get around creating any events

    def initialize
        puts "Initializing Game Loop Manager..."

        @playerTurnHandler = PlayerTurnHandler.new()
        @turnTracker = TurnTracker.new(@playerTurnHandler.playerAccessor.playerCount)
        @dieRoller = DieRoller.new
        @maxTurns = @dieRoller.maxTurns #Since we are't using a randomizer for die roll, calculate max turns from file to prevent out of scope issues happening if our turn counter goes too high
    end

    def gameLoop
        gameFinished = false;
        while !gameFinished && @turnTracker.currentTurn < @maxTurns
            resolveTurn(@turnTracker.getCurrentPlayerIndex)
            @turnTracker.incrementTurn #ideally this would happen from turn manager being subscibed to an event on this class. Then Player manager would automatically resolve things based on the die roll.
            gameFinished = @playerTurnHandler.isGameOver #ideally happen with an event
        end
    end

    def resolveTurn(currentPlayerIndex)
        dieRoll = @dieRoller.getNextDieRoll(@turnTracker.currentTurn)
        @playerTurnHandler.resolvePlayerTurn(currentPlayerIndex, dieRoll)
    end
end