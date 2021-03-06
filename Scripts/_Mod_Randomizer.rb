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
    attr_accessor :sunitems             # * How many sun fragments u got
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
    
    def initialize

        #* Game Information 
        @Titles = IO.readlines("__Randomizer/splashes.txt")
        @Seed = Array.new
        @sunitems = 0

        #? Config Bools and Vars
        @MessiahName = ''
        @PlayerSprite = ''
        @PlayerSunSprite = ''
        @PlayerGasSprite = ''
        @PlayerNyoomSprite = ''
        @PlayerLightmap = ''
        @PlayerGasLightmap = ''
        @PlayerSunLightmap = ''
        @PlayerNyoomLightmap = ''
        @snailP = false
        @snail = false
        @af =    false
        @en =    false
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
#  * Initialize the new random Seed
# *----------------------------------------------------------


def Init
    if @Seed == []
        # * Seed limits tells the game how big each value in your seed can be
        # * this is done to prevent the game giving values biggen than what are checked for in game 
        # * (EG: each area only having 4 variations)
        seedlimits = [4, 4, 4, 4, 2, 'next6', 1, 1, 1, 1, 'stuff between this and next6 dont matter', 1, 'next6', 1, 1, 1, 1, 'pog', 1, 1, 1, 4]
        entry = 0 # > The current entry in the seed that's being modified
        until entry >= seedlimits.length
            if seedlimits[entry] == 'next6'
                @Seed[entry..(entry + 6)] = [1, 2, 3, 4, 5, 6].shuffle
                entry += 6
            end
            @Seed.push(rand(1..seedlimits[entry]))
            entry += 1
      end
      for i in $game_variables[122..(122 + @Seed.length)] do
        $game_variables[122 + i] = @Seed[i]
        print $game_variables[122 + i] = @Seed[i]
      end    
    end
  end
end