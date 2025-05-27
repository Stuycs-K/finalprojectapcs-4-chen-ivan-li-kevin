Period 4

Ivan Chen, Kevin Li

Last Minute Games

# Technical Details:

Snakebird is a challenging puzzle game that's based on the hit game Snake. Each level involves fruit, just like in normal Snake, that the player must collect before reaching a portal at the end. The game is organized in a compact grid with blocks and fruit placed in positions designed for the player to get stuck. Not only does the player have to navigate getting stuck tight rooms, they may also find themselves falling off into the water or dying to spikes. Snakebird combines simple movement with complex puzzle design and many different puzzle elements to make a fascinatingly complex game.

## Critical Features:
- Movable player that is influenced by gravity.
- Collectible fruit that can be marked as collected, and opens an end goal once all have been collected, and ending the level when that happens.
- A reset key in case the player gets softlocked or fails the level
- Multiple levels that the player can progress through
- Spike obstacle that immediately fails the stage if the player lands on it

## Optional Features:
- Undo key to undo the last action
- Multiple snakebirds (difficult) that the player can swap between with a button
- Portals to teleport the player
- Movable blocks
- Stage clear animation

# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.

![UML diagram](uml.jpg?raw=true "uml diagram")

Game: main class, will be simulating the game environment.

Snakebird: the player controlled class. move will remove the last segment and add one to the front. Segments are stored in a linked list of Segments. Expanding will happen every time a fruit is collected, and will add a new segment to the front, while leaving the other segments untouched. Gravity moves the entire snakebird down until it hits the floor.

Block: environmental block. If a snakebird has no blocks below any segments, it will start falling until it lands on a block or into a spike or the void. If the block is a spike, the game ends when it is touched. If the block is a fruit, it is collectable when the snakebird's head moves directly into it.

A level is created using the block ArrayList in Game, detailing the coordinates of every block. The player's location is initialized at the start with the player Snakebird variable. The goal opens once every fruit in the stage is collected, and results in a victory for the player when they reach an open goal.

# Intended pacing:

* Environment creation [x] (Ivan)
  * Create block object class that extends space [x] (estimated done by 5/23)
    * Blocks that make up the stage
      * Extended by fruit, segment, and spike, which are their own classes for clarity

  * ~Create goal object class [] (estimated done by 5/24)~
    * Boolean variable for if goal open [x]
    * method to open the goal [x]
  * Create map object class [x] (estimated done by 5/26) (new)
    * 2d array of spaces
    * Contains a goal
    * ~Method to detect collision~
    * also contains the player
  * Space object classes [x] (new)
    * a space on the board
    * has coordinates

* Player character object class [x] (estimated done by 5/25) (Kevin)
  * Body parts [x]
    * Arraylist of Segments
    * variable tracks length of body (size of LinkedList)
    * Grow method for after eating fruit
  * Movement [x]
    * can move in 4 directions except if there's a block or body part in the way
  * Gravity [x]
    * All body parts move down y spaces, determined by which block is fallen on to
    * ~If fallen on to spike, call death()~ (actually happens in game)

* ~Fruit object class extends block [] (estimated done by 5/27) (Ivan)~
  * ~If snake head position = fruit position, fruit collected and remove from the stage~
  * ~If non head body part interacts, just acts like a block~

* Complete game class [] (estimated done by 5/28) (Kevin)
  * moveAttempt(int direction) method to be called when movement key pressed; determines if the block the player wants to move to is a spike, fruit, block, segment, goal, or empty
    * calls move(direction) when space is empty
    * calls expand(direction) when space is fruit
  * checkBody() finds how far the player should fall; can return 0
  * death() turns end variable to true, which causes an animation to play in draw
  * win() turns win variable to true, which will remove a segment each time draw is called to simulate the player entering the portal
  * loadLevel(int level) to load in the different levels

* Make first stage [] (estimated done by 5/29)

* Mutiple Snakebirds [] (OPTIONAL)
  * Arraylist of snakebirds in main game class
  * Button press changes between which snakebird is being controlled
  * Added boolean variable to snakebird class to track which is currently being controlled
