class Player

    def initialize(playerName, id)
        @location = 0
        @money = 16
        @name = playerName
        @id = id
        puts "Player '#{@name}' made with id #{@id}"
    end
end
