#importing the JSON Module 
require 'json'

class DieRoller
    attr_reader :maxTurns

def initialize
    puts "Initializing Die Roller..."
    rollFile = File.open "../../Data/rolls_1.json"
    @dieRollData = JSON.load rollFile
    @maxTurns = @dieRollData.count
end

    def getNextDieRoll(turnNumber) #remove turn number parameter if we move away from autogenerating our rolls
        return @dieRollData[turnNumber]
    end
end