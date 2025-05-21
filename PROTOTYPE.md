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








+

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

* Make first stage [] (estimated done by 5/28)

* Mutiple Snakebirds [] (OPTIONAL)
  * Arraylist of snakebirds in main game class
  * Button press changes between which snakebird is being controlled
  * Added boolean variable to snakebird class to track which is currently being controlled
