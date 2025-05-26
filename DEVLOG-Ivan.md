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
