require_relative 'gameLoopManager'

class Main
    def initialize
      gameLoopManager = GameLoopManager.new  # Create the game manager
      gameLoopManager.gameLoop           # Start the game loop right away
    end
  end
  
  # Instantiate the Main class
  Main.new