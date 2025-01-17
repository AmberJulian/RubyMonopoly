

class Player
    def initialize(playerName, id)
        location = 0
        money = 16
        name = playerName
        id = id
        puts "#{name} made with id #{id}"
    end

    def setName(newName)
       
    end

    def setID(id)
        playerId = id #If this was a game connected to google store or whatever, it may make sense for this to be their store ID. Since I'm not sure how the app wants to handle it, Ill just make a setter.
    end
end
