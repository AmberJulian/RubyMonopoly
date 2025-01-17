require_relative '../Player/playerManager'
require_relative 'turnManager'
require_relative 'dieRoller'

class GameLoopManager #get around creating any events

    def initialize
        puts "Initializing Game Manager..."
        puts "Creating other managers..."
        @playerManager = PlayerManager.new()
        puts "Player count: #{@playerManager.playerCount}"

        @turnManager = TurnManager.new(@playerManager.playerCount)
        @dieRoller = DieRoller.new
        @maxTurns = @dieRoller.maxTurns
    end

    def gameLoop
        gameFinished = false;

        @currentTurn = 0
        while !gameFinished && @currentTurn < @maxTurns
            resolveTurn(@turnManager.currentPlayerBeingResolved)
            @turnManager.incrementPlayersTurn
            @currentTurn += 1
        end
    end

    def resolveTurn(playerId)
        getDieRoll()
    end

    def getDieRoll()
        @dieRoller.setNextDieRoll(@currentTurn)
        @dieRoll = @dieRoller.nextDieRoll
    end
end