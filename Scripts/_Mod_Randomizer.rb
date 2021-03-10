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
    attr_accessor :Titles               # * Splash texts for the game window!
    attr_accessor :Seed                 # * The randomization seed
    attr_accessor :SunItems             # * How many sun fragments u got
    attr_accessor :InfoGen              # * Disable event processing to obtain all spawn locations
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
    attr_accessor :KeyItems             # * List of Key Items (aka sun, amber etc)
    attr_accessor :PuzLokItems          # * List of Items locked behind Puzzles
    attr_accessor :GenericItems         # * List of generic floor Items
    attr_accessor :KeySpawns            # * Possible Spawn locations for Key items
    attr_accessor :KeySpawn             # * Spawn locations for Key items
    attr_accessor :PuzSpawns            # * Possible Spawn Locations for Puzzle Locked Items
    attr_accessor :PuzSpawn             # * Spawn Locations for Puzzle Locked Items
    attr_accessor :GenSpawns            # * Possible Spawn Locations for Generic Items
    attr_accessor :GenSpawn             # * Spawn Locations for Generic Items
    attr_accessor :spawnevent           # // Spawning Event?
    
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
            @PuzLokItems     =  []
            @GenericItems    =  []
            # ? Event Locations
            @KeySpawns       =  []
            @KeySpawn        =  []
            @PuzSpawns       =  []
            @PuzSpawn        =  []
            @GenSpawns       =  []
            @GenSpawn        =  []


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

# *----------------------------------------------------------
#  * Init
# *----------------------------------------------------------
def Init
    ModWindow.SetTitle("Oneshot Randomizer - Loading Spawn Locations")
    self.Shuffle_Music
    self.ObtainSpawnLocations
    self.Shuffle_KeyItems
    ModWindow.SetTitle("Oneshot Randomizer - " + $randomizer.Titles.sample)
end
# *----------------------------------------------------------
#  * Fun Functions
# *----------------------------------------------------------

# ? Set Splash Text
def newsplash
    ModWindow.SetTitle("Oneshot Randomizer - " + $randomizer.Titles.sample)
end

# *----------------------------------------------------------
#  * Load the config
# *----------------------------------------------------------

def loadconfig
    File.foreach('__Randomizer/Config.cfg').with_index do |line, line_num|
    if !line.include? "="
        next
    end
    vals = line.strip.split("=")
    case vals[0]

    when "Seed"
        if vals[1] != ''
        @Seed = vals[1].to_s.split(" ")
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

# *----------------------------------------------------------
#  * Create the new random Seed
# *----------------------------------------------------------

def CreateSeed
    if @Seed == [] || @Seed != [] 
        @Seed = []
        # * Seed limits tells the game how big each value in your seed can be
        # * this is done to prevent the game giving values biggen than what are checked for in game 
        # * (EG: each area only having 4 variations)
        seedlimits = [4, 4, 4, 4, 62, 10]
        entry = 0 # > The current entry in the seed that's being modified
        until entry >= seedlimits.length
            if seedlimits[entry] == 'next6'
                @Seed[entry..(entry + 6)] = [1, 2, 3, 4, 5, 6].shuffle
                entry += 6
            end
            @Seed.push(rand(1..seedlimits[entry]))
            entry += 1
      end
      #for i in $game_variables[122..(122 + @Seed.length)] do
      #  $game_variables[122 + i] = @Seed[i]
      #  print $game_variables[122 + i] = @Seed[i]
      #end    
    end
  end


def Shuffle_Music
    @OriginalOST = Dir.glob('Audio/BGM/*.ogg')
    s = factorial(@Seed[4])
    $randomizer.ShuffledOST = get_shuffled_permutation(@OriginalOST, s)
end

def ObtainSpawnLocations
    @InfoGen = true
     @maps = Dir.children('./Data')
     @maps.delete('Actors.rxdata')
     @maps.delete('Animations.rxdata')
     @maps.delete('Armors.rxdata')
     @maps.delete('Classes.rxdata')
     @maps.delete('CommonEvents.rxdata')
     @maps.delete('Enemies.rxdata')
     @maps.delete('Items.rxdata')
     @maps.delete('MapInfos.rxdata')
     @maps.delete('xScripts.rxdata')
     @maps.delete('Scripts.rxdata')
     @maps.delete('Skills.rxdata')
     @maps.delete('States.rxdata')
     @maps.delete('System.rxdata')
     @maps.delete('Tilesets.rxdata')
     @maps.delete('Troops.rxdata')
     @maps.delete('Weapons.rxdata')
     @CMID = 0
        while @maps != []
            @CMID += 1
            $game_map.setup(@CMID) 
            $game_player.moveto(0, 0)
            @maps.shift
        end
    @InfoGen = false
   $game_map.setup($data_system.start_map_id)
   $game_player.moveto($data_system.start_x, $data_system.start_y)

end

def SpawnKeyItems
  #? Reset Variables  
  @eventmapid = 0
  @ITEMEVENT  = 0
  @evid = 0
  @ItemsOnMap = []
    #? Locate and push each Item spawn into a temp array  
    until @ITEMEVENT == ($randomizer.KeySpawn.length) do
        @eventmapid = $randomizer.KeySpawn[@ITEMEVENT][0]
        if @eventmapid == $game_map.map_id 
            @evid = $randomizer.KeySpawn[@ITEMEVENT][1]
            @evx  = $game_map.events[@evid].x
            @evy  = $game_map.events[@evid].y
            @ItemsOnMap.push([@evid, @ITEMEVENT, @evx, @evy])
        end
        @ITEMEVENT += 1
        return puts 'failed search' if @ITEMEVENT > $randomizer.KeySpawn.length
    end
    #? Spawn Each Item one by one  
    until @ItemsOnMap == [] 
        Event_Spawner.clone_event2(266, $randomizer.KeyItems[@ItemsOnMap.last[1]], @ItemsOnMap.last[2], @ItemsOnMap.last[3], 'KeyItem', end_event = true, save_event = false)
        @ItemsOnMap.pop
    end
end

def Shuffle_KeyItems
    s = factorial(@Seed[5])
    $randomizer.KeySpawn = get_shuffled_permutation($randomizer.KeySpawns, s)
    until $randomizer.KeySpawn.length == 4 do
    $randomizer.KeySpawn.pop
    end
end

end