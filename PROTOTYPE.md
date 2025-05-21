Period 4

Ivan Chen, Kevin Li

*placeholder name

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

Snakebird: player class. move will make shift the head in one direction and the rest of the body will move to the coordinate of the next body segment. Segments are stored in a linked list of int coordinates (might change later to a separate class). Expanding will happen every time a fruit is collected, and increases the length of the snakebird, while leaving the segments untouched. Gravity decreases the height of the snakebird.

Block: environmental block. If a snakebird has no blocks below any segments, it will start falling until it lands on a block or into a spike or the void. If the block is a spike, the game ends when it is touched. If the block is a fruit, it is collectable when the snakebird's head moves directly into it.

A level is created using the block ArrayList in Game, detailing the coordinates of every block. The player's location is initialized with the player list, which is a list due to future potential implementations of multiple players (should probably switch to just one for early coding). The goal opens once every fruit in the stage is collected, and results in a victory for the player when they reach an open goal.

# Intended pacing:

* Environment creation []
  * Create block object class [] (estimated done by 5/23)
    * Blocks that make up the stage
    * Arraylist of blocks in main game class
    * Fruit boolean variable to determine if fruit or not
    * Spike boolean variable to determine if spike
  * Create goal object class [] (estimated done by 5/27) (Ivan)
    * Boolean variables to determine if player enters goal and if goal open

* Player character object class [] (estimated done by 5/26) (Kevin)
  * Body parts []
    * Arraylist of coordinates of the body parts
    * variable tracks length of body (size of arraylist)
    * Grow method for after eating fruit
  * Movement []
    * front of body determines movement
    * can move in 4 directions except if there's a block or body part in the way
  * Gravity []
    * All body parts move down some y spaces until hit block below

* ~Fruit object class extends block [] (estimated done by 5/27) (Ivan)~
  * ~If snake head position = fruit position, fruit collected and remove from the stage~
  * ~If non head body part interacts, just acts like a block~

* Complete game class [] (estimated done by 5/28) (Kevin)
  * checkHead() method to be called when movement key pressed compares head position to position of blocks and then finds if block is fruit or spike or neither
  * checkBody() checks if player is floating, then finds how far the player should fall and calls gravity

* Make first stage [] (estimated done by 5/29)

* Mutiple Snakebirds [] (OPTIONAL)
  * Arraylist of snakebirds in main game class
  * Button press changes between which snakebird is being controlled
  * Added boolean variable to snakebird class to track which is currently being controlled
