#importing the JSON Module 
require 'json'

class DieRoller
    attr_reader :nextDieRoll, :maxTurns

def initialize
    puts "Initializing Die Roller..."
    rollFile = File.open "../../Data/rolls_1.json"
    @dieRollData = JSON.load rollFile
    @maxTurns = @dieRollData.count
end

    def setNextDieRoll(turnNumber) #remove turn number parameter if we move away from autogenerating our rolls
        #rollFile = File.open "../Data/rolls_1.json"
        rollFile = File.open "../../Data/rolls_1.json"
        dieRollData = JSON.load rollFile
        @nextDieRoll = dieRollData[turnNumber]
        puts"Current turn: #{turnNumber}, die roll: #{@nextDieRoll}"
    end
end