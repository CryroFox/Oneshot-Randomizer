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
    attr_accessor :PlayerSprite         # * Player Sprite
    attr_accessor :PlayerGasSprite      # * Player Gasmask Sprite
    attr_accessor :PlayerNyoomSprite    # * Player On Roomba Sprite
    attr_accessor :PlayerSunSprite      # * Player Holding Sun Sprite
    attr_accessor :PlayerLightmap       # * Player Lightmap Sprite
    attr_accessor :PlayerGasLightmap    # * Player Gasmask Lightmap Sprite
    attr_accessor :PlayerSunLightmap    # * Player Holding Sun Lightmap Sprite
    attr_accessor :PlayerNyoomLightmap  # * Player On Roomba Lightmap Sprite
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
    # ? Chosen Item Spawns
    attr_accessor :KeySpawn             # * Spawn locations for Key items
    attr_accessor :PuzLokSpawn          # * Spawn Locations for Puzzle Locked Items
    attr_accessor :PuzReqSpawn          # * Spawn Locations for Items Needed In Puzzles
    attr_accessor :PenSpawn             # * Spawn locations for Key items
    attr_accessor :GenSpawn             # * Spawn Locations for Generic Items
    # ? Misc Item Info
    attr_accessor :RefugeMapIds         # * List of Refuge Map IDs
    attr_accessor :RefugeBlackList      # * Blacklisted Items
    
    def initialize
        #* Game Information 
            @Titles = IO.readlines("__Randomizer/splashes.txt")
            @Seed = Array.new
            @SunItems = 0
            # ? Temp Information
            @InfoGen = false

        # * Item Information * #
          # ? Item Information
            @KeyItems        =  [1, 2, 3, 4] # * Item Event ID's
            @PuzLokItems     =  []           # * Item Event ID's
            @PuzReqItems     =  []           # * Item Event ID's
            @GenericItems    =  []           # * Item Event ID's
            
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
            # ! Refuge Blacklist
            @RefugeMapIds    =  []  # * List of Refuge Map IDs
            @RefugeBlackList =  []  # * Blacklisted Items

        # * Config Bools and Vars
            @MessiahName         = ''
            @PlayerSprite        = ''
            @PlayerSunSprite     = ''
            @PlayerGasSprite     = ''
            @PlayerNyoomSprite   = ''
            @PlayerLightmap      = ''
            @PlayerGasLightmap   = ''
            @PlayerSunLightmap   = ''
            @PlayerNyoomLightmap = ''
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
        ModWindow.SetTitle("OneShot RNG - Loading Spawn Locations")
        self.Shuffle_Music
        self.ObtainSpawnLocations
        self.Shuffle_KeyItems
        ModWindow.SetTitle("OneShot RNG - " + $randomizer.Titles.sample)
    end
# //----------------------------------------------------------
#  * Fun Functions
# //----------------------------------------------------------

    # // --------------------------
    # ? Set Splash Text
    # // --------------------------
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
        if vals[1] != ''
        @Seed = vals[1].to_s.split(".")
        end
    when "ShuffleMusic"
        if vals[1] == 'true'
            @ShuffleMusic = true
            elsif vals[1] == 'false' || vals[1] == ''
            @ShuffleMusic = false
            end  
    when "Name"
        if vals[1] != ''
        @MessiahName = vals[1].to_s
        end

    when "NormalSprite"
        if vals[1] != ''
        @PlayerSprite = vals[1].to_s.downcase
        end

    when "SunHeldSprite"
        if vals[1] != ''
        @PlayerSunSprite = vals[1].to_s.downcase
        end
        
    when "GasmaskSprite"
        if vals[1] != ''
        @PlayerGasSprite = vals[1].to_s.downcase
        end

    when "RoombaSprite"
        if vals[1] != ''
        @PlayerNyoomSprite = vals[1].to_s.downcase
        end
    
    when "LightmapSprite"
        if vals[1] != ''
        @PlayerLightmap = vals[1].to_s.downcase
        end

    when "SunHeldLightmapSprite"
        if vals[1] != ''
        @PlayerSunLightmap = vals[1].to_s.downcase
        end

    when "GasmaskLightmap"
        if vals[1] != ''
        @PlayerGasLightmap = vals[1].to_s.downcase
        end

    when "RoombaLightmap"
        if vals[1] != ''
        @PlayerNyoomLightmap = vals[1].to_s.downcase
        end
    when "🐌"
        if vals[1] == 'true'
            @snail = true
            elsif vals[1] == 'false' || vals[1] == ''
            @snail = false
            end   
    when "🐌🎉"
        if vals[1] == 'true'
            @snailP = true
            elsif vals[1] == 'false' || vals[1] == ''
            @snailP = false
            end   
    when "af"
        if vals[1] == 'true'
        @af = true
        elsif vals[1] == 'false' || vals[1] == ''
        @af = false
        end
    when "en"
        if vals[1] == 'true'
        @en = true
        elsif vals[1] == 'false' || vals[1] == ''
        @en = false
        end
    end
  end
    end

# //----------------------------------------------------------
#  * Create the new random Seed
# //----------------------------------------------------------

    def CreateSeed
        if @Seed == [] 
            # * Seed limits tells the game how big each value in your seed can be
            # * this is done to prevent the game giving values biggen than what are checked for in game 
            # * (EG: each area only having 4 variations)
            seedlimits = [4, 4, 4, 4, 62, 10]
            entry = 0 # > The current entry in the seed that's being modified
            until entry >= seedlimits.length
                @Seed.push(rand(1..seedlimits[entry]))
                entry += 1
            end
        end
    end

    # // --------------------------
    # ? Shuffle Music List
    # // --------------------------
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

    # // --------------------------
    # ? Shuffle Key Items
    # // --------------------------
    def Shuffle_KeyItems
        s = factorial(@Seed[5])
        $randomizer.KeySpawn = get_shuffled_permutation($randomizer.KeySpawns, s)
        until $randomizer.KeySpawn.length == 4 do
              $randomizer.KeySpawn.pop
        end
    end

    # // --------------------------
    # ? Spawn Map Items
    # // --------------------------
    def SpawnItems(type, list)
         #? Reset Variables  
           @Type       = type   # * Type of Item to spawn
           @List       = list   # * List of the choosen spawns
           @eventmapid = 0      # * Map ID of the item being read
           @ITEMEVENT  = 0      # * Current Index of the Item being read
           @evid       = 0      # * Event ID to write to temp arr
           @ItemsOnMap = []     # * Arr to hold all items about to be spawned
         #? Locate and push each Item spawn into a temp array  
           until @ITEMEVENT == (@List.length) do
             @eventmapid = @List[@ITEMEVENT][0]
             if @eventmapid == $game_map.map_id 
                @evid = @List[@ITEMEVENT][1]
                @evx  = $game_map.events[@evid].x
                @evy  = $game_map.events[@evid].y
                @ItemsOnMap.push([@evid, @ITEMEVENT, @evx, @evy])
             end
             @ITEMEVENT += 1
             return puts 'failed search' if @ITEMEVENT > @List.length
           end
         #? Spawn Each Item one by one  
           until @ItemsOnMap == [] 
               Event_Spawner.clone_event2(266, @Type[@ItemsOnMap.last[1]], @ItemsOnMap.last[2], @ItemsOnMap.last[3], 'Item', end_event = true, save_event = false)
               @ItemsOnMap.pop
           end
    end


end