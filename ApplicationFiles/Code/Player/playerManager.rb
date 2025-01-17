#importing the JSON Module 
require 'json'
require_relative 'player'

class PlayerManager

    #initialize all the players with names in our datafile, aka, all the ones given to us
    def initialize 

        file = File.open "../../Data/players.json"
        playerData = JSON.load file
     
        puts playerData.count
         
        for i in 0..(playerData.count-1)
            newPlayer = Player.new(playerData[i],i)   
        end
    end
end

PlayerManager.new