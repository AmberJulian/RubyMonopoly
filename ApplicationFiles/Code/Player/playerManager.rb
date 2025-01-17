#importing the JSON Module 
require 'json'
require_relative 'player'

class PlayerManager
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

    def resolveTurn(playerArrayId)
    end
end

