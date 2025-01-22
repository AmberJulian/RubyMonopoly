#importing the JSON Module 
require 'json'

class DieRoller
    attr_reader :maxTurns

def initialize
    puts "Initializing Die Roller..."
end

    def getNextDieRoll(turnNumber) #remove turn number parameter if we move away from autogenerating our rolls
        return @dieRollData[turnNumber]
    end

    def setDieRollFile(fileNumber)
        puts "Setting Up Die Roller with file #{fileNumber}."
        rollFile = File.open "../../Data/rolls_#{fileNumber}.json"
        @dieRollData = JSON.load rollFile
        @maxTurns = @dieRollData.count
    end
end