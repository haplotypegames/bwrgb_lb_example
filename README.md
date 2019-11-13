# bwrgb_lb_example
Small project showing an example of the Tilemap level builder (LB) I used for the game BWRGB.

- Purpose - Use the TileMap editor to build a level and add additional functionality by referencing the tileset indices and associating them to custom scene tiles.

- Limitations - TileMaps are very efficient and have lots of optimizations.  Replacing all of the tiles in a *large* level with scenes is probably not nearly as fast and efficient.  Using this method should be sufficient for smaller projects or supplementing larger projects with additional levels. Your mileage may vary.

- Project Contents:
  - /Images - Has the .png files used for the tilemap tilesets and the level object scenes.  These don't have to be the same.  The level objects could have very different textures.

  - /Level_Builder: contains the LB scene that will build the level from an indicated tilemap

  - /Levels - contains the base level file. Here it is just a container, but for your game you would want full functionality in it. For this example there is also a sub-folder called "Game_Levels" that I am directing the created levels to be put in.  This can be changed in the LB.  There is an example level that has already been created.

  - /Objects -  has the level object scenes that get created from the LB.  Here there are just 4 scenes (R,G,B,W).  In this example, these have very basic functionality (Area2D), but you can extend these to your specific project.

  - /TileMaps - When I design a level in the TileMap Editor, I save the files here.  There is an example tilemap that has already been created.

  - /Tilesets -  The tileset used for the LB in this example.
 
 
 - Usage:
   1. Create a new TileMap scene and select the /Tilesets/colors_tileset.tres as the tileset. Cell size is 64 x 64.
   2. Design the level in the TileMap Editor and save the TileMap scene in /TileMaps.
   3. Open the /Level_Builder/Level_Builder.tscn.
   4. Under the 'Script Variables':
      - Tilemap Scene - load the TileMap created in (3)
      - Level Name - Enter a name for the level.  Don't use any forbidden characters (e.g. spaces)
      - *optional* Output Path - Leave at default or change to a different location
   5. Save the Scene (CTRL + S).
   6. Play the Scene (F6).
   7. This will launch the LB scene, which is just a dummy scene with a label.  The level will be created after the 'Stop' (F8) button is pressed.
   8. The level scene will be created and saved by the LB in the 'Output Path' from (4) with the 'Level Name' input in (4).
   9. 'Play' the created level.
 
 - Known Issues:
   The TileMap Editor can be a bit glitchy.  If you create a TileMap and run the LB and you get an invalid index error, open the TileMap and check that it hasn't been garbled (tiles put in incorrect locations) or scaled weirdly. This isn't related to the LB. This doesn't happen very often and I am not entirely sure what causes it.  When it has happened, it was on a newly created TileMap - not on one that was successfully created and worked with. If it does happen and you aren't aware of it, you can invest a LOT of time trying to troubleshoot it.  REMEDY - just delete the TileMap and create it again.
