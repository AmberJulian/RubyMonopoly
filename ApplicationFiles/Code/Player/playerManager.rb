#importing the JSON Module 
require 'json'
require_relative 'player'

class PlayerManager
    attr_reader :players # Expose players via an accessor
  
    #initialize all the players with names in our datafile, aka, all the ones given to us
    def initialize 
        @players = {} # Instance variable for storing players
        file = File.open "../../Data/players.json"
        playerData = JSON.load file
         
        for i in 0..(playerData.count-1)
            newPlayer = Player.new(playerData[i],i)  
            @players[i] = newPlayer 
        end

        puts "#{@players[2].name}"
    end
end

PlayerManager.new