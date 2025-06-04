# Dev Log:

This document must be updated daily every time you finish a work session.

## Ivan Chen

### 2025-05-19 - Prototype update
Over the course of a period, Wrote a summary of the project, as well as describing the critical and optional features. (around 20 minutes in total)

### 2025-05-20 - UML diagram and descriptions.
During class, started creation on a UML diagram (~ 10 minutes)

After class, wrote the descriptions and details for below the diagram, and fixed some formatting issues in prototype (20 minutes)

### 2025-05-21 - Start of coding
Made a processing sketch, added an environment and completed the block class, though more may be added. Also implemented a debug toggle that creates a grid that makes it easier to visualize where the blocks will be (~30 minutes)

### 2025-05-22 - Environment progress
New classes - fruit, spike that both extend block, with no new methods

This is to allow the use of instanceof to distinguish between special behaviors (5 minutes)

Additionally, a new class was added, Map, that is used to contain the location of every block and fruit.

This class uses the loadLevel method to load a preset stage. (25 minutes)

A new method in Game has been added, drawLevel, that displays everything present. (5 minutes)

### 2025-05-25 - Bug fixes and overhauls
Map has been overhauled to now use a 2D array of spaces (new class made by partner as a parent of block)

loadLevel and drawLevel have also been changed in order to fit this new change. 

The player variable is now in the map class, and a snakebird has been added to the first level.

drawLevel now displays snakebirds as well.

Also fixed a few bugs from syntax errors(30 minutes)

### 2025-05-27 - Fruit progress
Fruits now have a field that determines if they have been collected. 

Map has a method that checks every fruit, and removes any that are collected, then opens the goal if all are collected. (20 minutes)

### 2025-05-28 - Fruit finished
Fruit are now collected properly. (10 minutes)

Started progress on making sure the game over works properly

### 2025-05-29 - End screens
Added reset button that fully resets the state to the start of the level (5 minutes)

Game over when snakebird falls into the abyss works properly (25 minutes)

Goal now appears on the board when all fruit are collected

Entering the goal with the head now triggers a win (30 minutes)

### 2025-05-30 - spike indicator
Started working on the display for the spike object, around 2/3 of the way done (30 minutes)

### 2025-06-01 - Polishing levels
Overhauled the win code, and added a new int that tracks the level (25 minutes)

Indicator added for the head of the snakebird(5 minutes)

Special endscreen for once every level is done (5 minutes)

### 2025-06-02 - Graphic polishing
Arrow keys can now move the character 

Goal now is displayed as a hollow circle when not open

Spike is now completely done (30 minutes)

### 2025-06-03 - Level select
Using the number keys 1-4 can select a level (30 minutes)

Started improving the head sprite (10 minutes)
