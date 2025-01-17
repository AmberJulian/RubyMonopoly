class Player
    attr_reader :location, :money, :name, :id

#TODO: Remove these attribute readers - debug only 

    def initialize(playerName, id)
        @location = 0
        @money = 16
        @name = playerName
        @id = id
        puts "#{@name} made with id #{@id}"
    end
end
