require_relative 'gameLoop'

class Main
  def initialize
    gameLoopManager = GameLoop.new  # Create the game manager
    gameLoopManager.gameLoop           # Start the game loop right away
  end
end
  
  # Instantiate the Main class
  Main.new