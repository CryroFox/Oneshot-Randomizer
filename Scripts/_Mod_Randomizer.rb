# //================================================================================================================
# > By Cryro the fox :3c
# !   #####    ####        #####      ###    ##     ##  ####     #####   ###    ###  ##  ######  #####  #####    
# !  ##   ##  ##           ##  ##    ## ##   ####   ##  ##  ##  ##   ##  ## #  # ##  ##     ##   ##     ##  ##   
# !  ##   ##   ###         #####    ##   ##  ##  ## ##  ##  ##  ##   ##  ##  ##  ##  ##    ##    #####  #####    
# !  ##   ##     ##        ##  ##   #######  ##    ###  ##  ##  ##   ##  ##      ##  ##   ##     ##     ##  ##   
# !   #####   ####         ##   ##  ##   ##  ##     ##  ####     #####   ##      ##  ##  ######  #####  ##   ##  
# > Welcome to my hell.
# //================================================================================================================

class Randomizer
    attr_accessor :Titles               # * Splash texts for the game window!
    attr_accessor :Seed                 # * The randomization seed
    attr_accessor :MessiahName          # * The name of the Messiah
    attr_accessor :PlayerSprite         # * Player Sprite
    attr_accessor :PlayerGasSprite      # * Player Gasmask Sprite
    attr_accessor :PlayerNyoomSprite    # * Player On Roomba Sprite
    attr_accessor :PlayerSunSprite      # * Player Holding Sun Sprite
    attr_accessor :PlayerLightmap       # * Player Lightmap Sprite
    attr_accessor :PlayerGasLightmap    # * Player Gasmask Lightmap Sprite
    attr_accessor :PlayerSunLightmap    # * Player Holding Sun Lightmap Sprite
    attr_accessor :PlayerNyoomLightmap  # * Player On Roomba Lightmap Sprite
    
    def initialize
        @Titles = IO.readlines("__Randomizer/splashes.txt")
        @Seed = Array.new
        @MessiahName = ''
        @PlayerSprite = ''
        @PlayerSunSprite = ''
        @PlayerGasSprite = ''
        @PlayerNyoomSprite = ''
        @PlayerLightmap = ''
        @PlayerGasLightmap = ''
        @PlayerSunLightmap = ''
        @PlayerNyoomLightmap = ''
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
        @Seed = vals[1].to_s.split("")
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
    end
  end
end

# *----------------------------------------------------------
#  * Initialize the new random Seed
# *----------------------------------------------------------


def Init
    if @Seed == []
        # * Seed limits tells the game how big each value in your seed can be
        # * this is done to prevent the game giving values biggen than what are checked for in game 
        # * (EG: each area only having 4 variations)
        seedlimits = [4, 4, 4, 4, 10, 10, 15]
        entry = 0 # > The current entry in the seed that's being modified
        until entry >= seedlimits.length
            @Seed.push(rand(1..seedlimits[entry]))
            $game_variables[122 + entry] = @Seed[entry]
            entry += 1
      end
    end
  end


end