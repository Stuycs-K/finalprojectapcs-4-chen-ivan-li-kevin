Period 4

Ivan Chen, Kevin Li

*placeholder name

# Technical Details:

Snakebird is a puzzle game, based on the hit game Snake, with the added twist of gravity to interactions. Each level involves fruit that the player must collect, and then must reach a portal at the end. The game is organized in a small grid. The player will fall down if there are no tiles directly below any of their segments.

## Critical Features:
- Movable player that is influenced by gravity.
- Collectible fruit that can be marked as collected, and opens an end goal once all have been collected, and ending the level when that happens.
- A reset key in case the player gets softlocked or fails the level
- Multiple levels that the player can progress through

## Optional Features:
- Undo key to undo the last action
- Spike obstacle that immediately fails the stage if the player lands on it
- Multiple snakebirds (difficult) that the player can swap between with a button

# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.








+

# Intended pacing:

* Environment creation []
  * Create block object class [] (estimated done by 5/22)
    * Blocks that make up the stage
    * Arraylist of blocks in main game class
  * Create goal object class [] (estimated done by 5/26) (Ivan)
    * Boolean variables to determine if player enters goal and if goal open

* Player character object class [] (estimated done by 5/25) (Kevin)
  * Body parts []
    * Arraylist of coordinates of the body parts
    * variable tracks length of body (size of arraylist)
    * Grow method for after eating fruit
  * Movement []
    * front of body determines movement
    * can move in 4 directions except if there's a block or body part in the way
  * Gravity []
    * All body parts move down some y spaces until hit block below

* Fruit object class extends block [] (estimated done by 5/26) (Ivan)
  * If snake head position = fruit position, fruit collected and remove from the stage
  * If non head body part interacts, just acts like a block


* Make first stage [] (estimated done by 5/27)
