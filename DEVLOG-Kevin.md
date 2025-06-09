# Dev Log:

This document must be updated daily every time you finish a work session.

## Kevin Li

### 2025-05-19 - Prototype details
* Wrote the intended pacing section with estimated finish dates and role designation - 9 minutes

### 2024-05-20 - Finishing touches on Prototype
* Rewrote and expanded the one paragraph explanation - 9 minutes
* Added more optional features - 3 minutes
* Pushed back the estimated finishing dates - 1 minute
* Added some of the optional features to the intended pacing - 4 minutes
* Finished UML diagram and edited some parts of the inteded pacing - 25 minutes

### 2024-05-22 - Full rework of the uml diagram
* Edited uml diagram and changed details - 10 minutes
* Fully reworked the uml diagram after working out exactly how everything would function - 15 minutes
* Changed the details and intended pacing to reflect uml diagram - 12 minutes

### 2024-05-23 - More changes to the plan and starting on Snakebird
* New map object taken from Mr.K's advice added to the plan and uml diagram - 9 minutes
* Made Segment class that extended Block - 1 minute
* Made constructor and expand method for Snakebird - 4 minutes

### 2024-05-25 - Finished Snakebird and more edits to plan
* Made move and gravity methods (gravity currently not working, as it depends on game and map) - 20 minutes
* Created new Space object class - 3 minutes
* Created new accessor and mutator methods in Block and shifted where they were located - 6 minutes
* Changed plan to reflect changes in block and space - 4 minutes
* Updated uml diagram - 9 minutes

### 2024-05-26 - Made most of moveAttempt method
* moveAttempt method now mostly done - 19 minutes
* Added death and checkBody methods in Game and new getFront method to Snakebird to help with moveAttempt - 2 minutes

### 2024-05-27 - Finished moveAttempt and made most of checkBody
* moveAttempt finished and added if statements in keyPressed so the snakebird actually moves - 14 minutes
* Finished most of checkBody so that the gravity is functional until the snakebird falls into the void - 38 minutes

### 2024-05-28 - More checkBody fixes
* checkBody now occurs after every moveAttempt, not just after a sucessful move - 6 minutes

### 2024-05-29 - Movement fixes
* error thrown by gravity when snakebird falls into void now caught - 9 minutes
* snakebird can no longer move into itself - 14 minutes

### 2024-05-30 - Gravity with spikes fixes
* Tried fixing the gravity method to work properly with spikes - 28 minutes

### 2024-05-31 - Making levels
* Made levels 1 and 2 from the actual Snakebird game - 17 minutes

### 2024-05-31 - More levels and fixing spikes again
* Made level 3 - 12 minutes
* Fixed gravity so that spikes kill properly when moving up to them and doesn't kill when falling on to block next to them - 10 minutes
* Made level 4 (accidently wrote 5 in the commit message) - 9 minutes
* Updated uml diagram and the details - 20 minutes

### 2024-06-01 - Tried working on two snakebirds
* Added code to try and make two snakebirds work but gave up - 34 minutes

### 2024-06-02 - Level 5
* Finished level 5 - 14 minutes

### 2024-06-03 - Restarting the two snakebird code
* Added snakebird segments into spaces[][] - 12 minutes
* Made pushable method - 18 minutes

### 2024-06-04 - Fixing gravity for two Snakebirds
* Trying to fix the gravity so that both snakebirds can fall - 22 minutes

### 2024-06-05 - Snakebird collision
* Made it so that the snakebirds can't move into each other - 15 minutes

### 2024-06-06 - Two snakebirds fully implemented
* Fixed the code that made blocks disappear when a snakebird was pushed into it - 6 minutes
* Fixed the win condition so that both snakebirds needed to enter the portal - 8 minutes

### 2024-06-07 - More levels
* Made level 6 - 10 minutes
* Made level 7 - 15 minutes

### 2024-06-08 - Final touches
* Update prototype and readme - 6 minutes
