# //================================================================================================================#
# > By Cryro the fox :3c                                                                                            #
# !   #####    ####        #####      ###    ##     ##  ####     #####   ###    ###  ##  ######  #####  #####     ! #
# !  ##   ##  ##           ##  ##    ## ##   ####   ##  ##  ##  ##   ##  ## #  # ##  ##     ##   ##     ##  ##    ! #
# !  ##   ##   ###         #####    ##   ##  ##  ## ##  ##  ##  ##   ##  ##  ##  ##  ##    ##    #####  #####     ! #
# !  ##   ##     ##        ##  ##   #######  ##    ###  ##  ##  ##   ##  ##      ##  ##   ##     ##     ##  ##    ! #
# !   #####   ####         ##   ##  ##   ##  ##     ##  ####     #####   ##      ##  ##  ######  #####  ##   ##   ! #
# > Welcome to my hell.                                                                                             #
# //================================================================================================================#

class Randomizer
    # ? Main Game Info
    attr_accessor :Titles               # * Splash texts for the game window!
    attr_accessor :Seed                 # * The randomization seed
    attr_accessor :InfoGen              # * Disable event processing to obtain all spawn locations
    attr_accessor :SunItems             # * How many sun fragments u got
    # ? Config
    attr_accessor :ShuffledOST          # * Shuffled Music List
    attr_accessor :OriginalOST          # * Music List
    attr_accessor :ShuffleMusic         # * Shuffle Music?
    attr_accessor :MessiahName          # * The name of the Messiah
    attr_accessor :PakUseSprite         # * Does the Pak Use OverWorld Sprites
    attr_accessor :PakUseLights         # * Does the Pak Use Lightmaps
    attr_accessor :PakUseFaces          # * Does the Pak Use FaceSprites
    attr_accessor :PakUseRobo           # * Does the Pak Use Robo text
    attr_accessor :PakSprt              # * Player Sprite
    attr_accessor :NikoPak              # * Messiah Pak in use
    attr_accessor :snailP               # * Snail Party
    attr_accessor :snail                # * Snail Mode :3
    attr_accessor :en                   # * Entity Sprite Toggle
    attr_accessor :af                   # * April Fools Toggle
    # ? Item Event Lists
    attr_accessor :KeyItems             # * List of Key Items (aka sun, amber etc)
    attr_accessor :PuzLokItems          # * List of Items locked behind Puzzles
    attr_accessor :PuzReqItems          # * List of Items locked behind Puzzles
    attr_accessor :GenericItems         # * List of generic floor Items
    # ? Possible Item Spawns
    attr_accessor :KeySpawns            # * Possible Spawn locations for Key items
    attr_accessor :PuzLokSpawns         # * Possible Spawn Locations for Puzzle Locked Items
    attr_accessor :PuzReqSpawns         # * Possible Spawn Locations for Items Needed In Puzzles
    attr_accessor :PenSpawns            # * Possible Spawn Locations for Generic Items
    attr_accessor :GenSpawns            # * Possible Spawn Locations for Generic Items
    # ? Possible Injection Id's
    attr_accessor :PuzLokOBJs           # * Event Id's of Events that are allowed to have Item's injected into them
    attr_accessor :PuzReqOBJs           # * Event Id's of Events that are allowed to have Item's injected into them
    attr_accessor :PenOBJs              # * Event Id's of Events that are allowed to have Item's injected into them
    # ? Chosen Item Spawns
    attr_accessor :KeySpawn             # * Spawn locations for Key items
    attr_accessor :PuzLokSpawn          # * Spawn Locations for Puzzle Locked Items
    attr_accessor :PuzReqSpawn          # * Spawn Locations for Items Needed In Puzzles
    attr_accessor :PenSpawn             # * Spawn locations for Key items
    attr_accessor :GenSpawn             # * Spawn Locations for Generic Items
    # ? Misc Item Info
    attr_accessor :InjectionHelper      # * Decides which items are OBJ injected
    attr_accessor :RefugeMapIds         # * List of Refuge Map IDs
    attr_accessor :RefugeBlackList      # * Blacklisted Items
    attr_accessor :PenID                # * Event id of hte pen since im dumb
    attr_accessor :ItemsOnMap           # * Items on the current Map
    attr_accessor :RealItemIds          # * A list of each item event in the spawner room that tells Event ID and Name (The name is used to specify the itemid it gives you, that or for other extra processing later)
    

    def initialize

        #* Game Information  * #
            @Titles = IO.readlines("__Randomizer/splashes.txt")
            @Seed = Array.new
            @SunItems = 0
            # ? Temp Information
            @InfoGen = false

        # * Item Information * #
          # ? Item Information
            @KeyItems        =  [[1], [2], [3], [4]] # * Item Event ID's
            @PuzLokItems     =  [[1], [2], [3], [4]] # * Item Event ID's
            @PuzReqItems     =  [[1], [2], [3], [4]] # * Item Event ID's
            @GenericItems    =  [[1], [2], [3], [4]] # * Item Event ID's
            @PenID           =  [[5]]                # * Event id of hte pen since im dumb
            @RealItemIds     =  []                   # * List of each item event in the spawner room that tells Event ID and Name (The name is used to specify the itemid it gives you, that or for other extra processing later)
          # ? Event Locations
            # Key Items    
            @KeySpawns       =  []  # * Possible Spawns
            @KeySpawn        =  []  # * Selected Spawns
            # Puzzle Items    
            @PuzLokOBJs      =  []  # * Possible NPC Injection ID's
            @PuzLokSpawns    =  []  # * Possible Spawns
            @PuzLokSpawn     =  []  # * Selected Spawns
            # Puzzle Needed Items    
            @PuzReqOBJs      =  []  # * Possible NPC Injection ID's
            @PuzReqSpawns    =  []  # * Item Event ID's
            @PuzReqSpawn     =  []  # * Item Event ID's
            # Generic Items    
            @GenSpawns       =  []  # * Possible Spawns
            @GenSpawn        =  []  # * Selected Spawns
            # Anti-softlock Pen
            @PenOBJs         =  []  # * Possible NPC Injection ID's
            @PenSpawns       =  []  # * Possible Spawns
            @PenSpawn        =  []  # * Selected Spawn
            #//@PenIsOBJ     =  false
            # Injections
            @InjectionHelper =  []  # * Decides which items are OBJ injected
            @ItemsOnMap      =  []
            # ! Refuge Blacklist
            @RefugeMapIds    =  []  # * List of Refuge Map IDs
            @RefugeBlackList =  []  # * Blacklisted Items

        # * Config Bools and Vars * #
            # ? Messiah Pack Vars
              @PakUseSprite        = false
              @PakUseLights        = false
              @PakUseFaces         = false
              @PakUseRobo          = false
              @PakSprt             = ''
            # ? Normal Config Vars
              @NikoPak             = ''
              @snailP              = false
              @snail               = false
              @af                  = false
              @en                  = false
              @ShuffleMusic        = false
    end

# //----------------------------------------------------------
#  * Init
# //----------------------------------------------------------
    def Init
     # ? Indicate the game is loading for debug purposes
       ModWindow.SetTitle("OneShot RNG - Loading Spawn Locations")
     # ? Reset Item Spawns as to not overlap
       # Key Items    
       @KeySpawns       =  []  # * Possible Spawns
       @KeySpawn        =  []  # * Selected Spawns
       # Puzzle Items    
       @PuzLokOBJs      =  []  # * Possible NPC Injection ID's
       @PuzLokSpawns    =  []  # * Possible Spawns
       @PuzLokSpawn     =  []  # * Selected Spawns
       # Puzzle Needed Items    
       @PuzReqOBJs      =  []  # * Possible NPC Injection ID's
       @PuzReqSpawns    =  []  # * Item Event ID's
       @PuzReqSpawn     =  []  # * Item Event ID's
       # Generic Items    
       @GenSpawns       =  []  # * Possible Spawns
       @GenSpawn        =  []  # * Selected Spawns
       # Anti-softlock Pen
       @PenOBJs         =  []  # * Possible NPC Injection ID's
       @PenSpawns       =  []  # * Possible Spawns
       @PenSpawn        =  []  # * Selected Spawn
       #//@PenIsOBJ     =  false
     # ? Generate Random shit
       $randomizer.Shuffle_Music
       $randomizer.ObtainSpawnLocations
       $randomizer.Shuffle_KeyItems
       $randomizer.Shuffle_GenItems
       $randomizer.Shuffle_PenSpawn
       ModWindow.SetTitle("OneShot RNG - " + $randomizer.Titles.sample)
    end

# //----------------------------------------------------------
#  > Debug Functions
# //----------------------------------------------------------

def genOBJ
    SelectOBJSpawns(@PuzLokSpawns, 1.4, 4)
    print @InjectionHelper
end

def PrintItemSpawns
    print 'Key Spawns'  
    print @KeySpawns      
    print 'Key Spawn'  
    print @KeySpawn       
    print 'PuzLokOBJs'  
    print @PuzLokOBJs     
    print 'PuzLokSpawns'  
    print @PuzLokSpawns   
    print 'PuzLokSpawn'  
    print @PuzLokSpawn    
    print 'PuzReqOBJs'
    print @PuzReqOBJs     
    print 'PuzReqSpawns'
    print @PuzReqSpawns   
    print 'PuzReqSpawn'
    print @PuzReqSpawn    
    print 'GenSpawns' 
    print @GenSpawns      
    print 'GenSpawn' 
    print @GenSpawn       
    print 'PenOBJs'
    print @PenOBJs        
    print 'PenSpawns'
    print @PenSpawns      
    print 'PenSpawn'
    print @PenSpawn       
    print 'Injection Helper'
    print @InjectionHelper
    print 'RefugeMapIDs'
    print @RefugeMapIds   
    print 'RefugeBlackList'
    print @RefugeBlackList
    print 'KeyItems    '
    print @KeyItems    
    print 'PuzLokItems '
    print @PuzLokItems 
    print 'PuzReqItems '
    print @PuzReqItems 
    print 'GenericItems'
    print @GenericItems
    print 'PenID       '
    print @PenID       
    print 'RealItemIds '
    print @RealItemIds 
    
end

# //----------------------------------------------------------
#  * Fun Functions
# //----------------------------------------------------------

    # // --------------------------// #
    # ? Set Splash Text
    # // --------------------------// #
    def newsplash
        @Titles = IO.readlines("__Randomizer/splashes.txt") if @Titles == []
        @SplashChosen = $randomizer.Titles.last 
        @CurrentSplash = "OneShot RNG - #{@SplashChosen}"
        ModWindow.SetTitle("#{@CurrentSplash}")
        #ModWindow.SetTitle("OneShot RNG - " + $randomizer.Titles.sample)
        $randomizer.Titles.pop
    end

# //----------------------------------------------------------
#  * Load the config
# //----------------------------------------------------------

    def loadconfig
    File.foreach('__Randomizer/Config.cfg').with_index do |line, line_num|
    if !line.include? "="
        next
    end
    vals = line.strip.split("=")
    case vals[0]
    when "Seed"
        @Seed = vals[1].to_s.split(".") if vals[1] != '' && vals[1] != nil
    when "ShuffleMusic"
        @ShuffleMusic = vals[1] if vals[1] != '' && vals[1] != nil
    when "MessiahPack"
        @NikoPak = vals[1] if vals[1] != '' && vals[1] != nil
    when "🐌"
        @snail = vals[1] if vals[1] != '' && vals[1] != nil
    when "🐌🎉"
        @snailP = vals[1] if vals[1] != '' && vals[1] != nil
    when "af"
        @af = vals[1] if vals[1] != '' && vals[1] != nil
    when "en"
        @en = vals[1] if vals[1] != '' && vals[1] != nil
    end
    end
    end
    
    def loadnikopak
    return if @NikoPak == nil or @NikoPak == ''
    File.foreach('__Randomizer/MessiahPacks/' + @NikoPak + '/properties.cfg').with_index do |line, line_num|
    if !line.include? ":"
        next
    end
    vals = line.strip.split(":")
    case vals[0]
    when 'Name'
        @MessiahName = vals[1].downcase if vals[1] != '' && vals[1] != nil
    when 'OverworldSprites'
        @PakUseSprite = vals[1] if vals[1] != '' && vals[1] != nil
    when 'Lightmaps'
        @PakUseLights = vals[1] if vals[1] != '' && vals[1] != nil
    when 'FaceSprites?'
        @PakUseFaces = vals[1]  if vals[1] != '' && vals[1] != nil
    when 'RobotVoice?'
        @PakUseRobo = vals[1]   if vals[1] != '' && vals[1] != nil
    when 'SpriteName'
        @PakSprt = vals[1]      if vals[1] != '' && vals[1] != nil
    end
    end
    end
# //----------------------------------------------------------
#  * Create the new random Seed
# //----------------------------------------------------------

    def createseed
        if @Seed == [] 
            # * Seed limits tells the game how big each value in your seed can be
            # * this is done to prevent the game giving values bigger than what are checked for in game 
            # * (EG: each area only having 4 themings)
            seedlimits = [4, 4, 4, 4, 80, 40, 40, 40, 40, 40]
            entry = 0 # > The current entry in the seed that's being modified
            until entry >= seedlimits.length
                @Seed.push(rand(1..seedlimits[entry]))
                entry += 1
            end
        end
    end

    # // --------------------------// #
    # ? Shuffle Music List
    # // --------------------------// #
    def Shuffle_Music
        @OriginalOST = Dir.glob('Audio/BGM/*.ogg')
        s = factorial(@Seed[4])
        $randomizer.ShuffledOST = get_shuffled_permutation(@OriginalOST, s)
    end

# //----------------------------------------------------------
#  * Item Methods
# //----------------------------------------------------------
# ! Reminder of Array formatting
#  * Stored items should look like the following ?
#  * [MAPID, ItemID, X, Y, NPC/OBJ SPAWNED?, EventID]
#  * [#, #, #, #, True/False, #]
# //----------------------------------------------------------
# ! Reminder of Item Types
# * Key         | Key items like the sun, amber, die, feather
# * Generic     | Generic No Restriction Items
# * PuzReq      | Items Required For Puzzles
# * PuzLok      | Puzzle Locked Items
# //----------------------------------------------------------
    
    # // --------------------------// #
    # ? Shuffle Key Items
    # // --------------------------// #
    def Shuffle_KeyItems
        s = factorial(@Seed[5])
        $randomizer.KeySpawn = get_shuffled_permutation($randomizer.KeySpawns, s)
        until $randomizer.KeySpawn.length == 4 do
              $randomizer.KeySpawn.pop
              end
    end

    # // --------------------------// #
    # ? Shuffle Generic Items
    # // --------------------------// #
    def Shuffle_GenItems
        s = factorial(@Seed[6])
        $randomizer.GenSpawn = get_shuffled_permutation($randomizer.GenSpawns, s)
        until $randomizer.GenSpawn.length == (@GenericItems.length - 1) do
              $randomizer.GenSpawn.pop
              end
    end

    # // --------------------------// #
    # ? Shuffle Pen Spawns
    # // --------------------------// #
    def Shuffle_PenSpawn
        s = factorial(@Seed[6])
        $randomizer.PenSpawn = get_shuffled_permutation($randomizer.PenSpawns, s)
        until $randomizer.PenSpawn.length == 1 do
              $randomizer.PenSpawn.pop
              end
        $randomizer.SelectOBJSpawns($randomizer.PenSpawn, 2, 6)
        $randomizer.InjectionHelper.pop
        $randomizer.PenID.append(true) #if $randomizer.InjectionHelper[0] == 1
    end

    # // --------------------------// #
    # ? Shuffle PuzLokItems
    # // --------------------------// #
    def Shuffle_PuzLokItems
        s = factorial(@Seed[7])
        $randomizer.PuzLokSpawn = get_shuffled_permutation($randomizer.PuzLokSpawns, s)
        $randomizer.PuzLokOBJs  = get_shuffled_permutation($randomizer.PuzLokOBJs, s)
        until $randomizer.GenSpawn.length == (@GenericItems.length - 1) do
              $randomizer.GenSpawn.pop
              end
    end

    # // --------------------------// #
    # ? Spawn Map Items
    # // --------------------------// #
    def SpawnItems(type, list)
         #? Reset Variables  
            @Type       = type          # * Type of Item to spawn
            @List       = list          # * List of the choosen spawns
            @OBJList    = @PenOBJs      # * List Type to Check Injetions
            @OBJList    = @PuzLokOBJs   # * List Type to Check Injetions
            @OBJList    = @PuzReqOBJs   # * List Type to Check Injetions
            @eventmapid = 0             # * Map ID of the item being read
            @ITEMEVENT  = 0             # * Current Index of the Item being read
            @evid       = 0             # * Event ID to write to temp arr
            @ItemsToSpawn = []          # * Arr to hold all items about to be spawned
            #? Locate and push each Item spawn into a temp array  
            until @ITEMEVENT == (@List.length) do
                @eventmapid = @List[@ITEMEVENT][0]
                if @eventmapid == $game_map.map_id 
                 @evid = @List[@ITEMEVENT][1]
                 @evx  = $game_map.events[@evid].x
                 @evy  = $game_map.events[@evid].y
                 if @Type[@ITEMEVENT].length == 2
                 @ItemsToSpawn.push([@evid, @ITEMEVENT, @evx, @evy, @Type[@ITEMEVENT][1], @OBJList[@ITEMEVENT[1]], @Type[0][0]]) # ! I added an extra [0] here, dont forget it 
                 else
                 @ItemsToSpawn.push([@evid, @ITEMEVENT, @evx, @evy])
                 end
                 end
                 @ITEMEVENT += 1
                 return puts 'failed search' if @ITEMEVENT > @List.length
                 end
        #? Spawn Each Item one by one
                  @ItemsOnMap = @ItemsToSpawn
            until @ItemsToSpawn == [] 
                print @ItemsToSpawn
                Event_Spawner.clone_event2(266, @Type[@ItemsToSpawn.last[1]], @ItemsToSpawn.last[2], @ItemsToSpawn.last[3], 'Item', end_event = true, save_event = false) unless @ItemsToSpawn.last.length == 7 # ! Should work but is untested
                @ItemsToSpawn.pop
                end
    end

end
