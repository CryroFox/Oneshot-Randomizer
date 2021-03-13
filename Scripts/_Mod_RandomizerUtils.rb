class Randomizer # ? Utils is just another script to keep the larger techichal calls that are used commonly seperate from the main randomizer script

# > Maybe also large junk calls like this one
# > Lmao
def ObtainSpawnLocations
    @InfoGen = true
    @maps = Dir.children('./Data')
    @maps.delete('CommonEvents.rxdata')
    @maps.delete('Animations.rxdata')
    @maps.delete('MapInfos.rxdata')
    @maps.delete('xScripts.rxdata')
    @maps.delete('Tilesets.rxdata')
    @maps.delete('Classes.rxdata')
    @maps.delete('Enemies.rxdata')
    @maps.delete('Scripts.rxdata')
    @maps.delete('Weapons.rxdata')
    @maps.delete('Actors.rxdata')
    @maps.delete('Armors.rxdata')
    @maps.delete('Skills.rxdata')
    @maps.delete('States.rxdata')
    @maps.delete('System.rxdata')
    @maps.delete('Troops.rxdata')
    @maps.delete('Items.rxdata')
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
#!---------------------------------------------------------#
#! Get Injection Helper #
#!---------------------------------------------------------#

def SelectOBJSpawns(arr, quantity, seedindex)
    seedindex = @Seed[seedindex]
    @InjectionHelper = []
    @Side = false
    for i in 0..(arr.length - 1)
        @InjectionHelper.push(1) if @Side == false
        @InjectionHelper.push(0) if @Side == true    
        @Side = true if i == (arr.length - 1).div(quantity)
    end
    @InjectionHelper = get_shuffled_permutation(@InjectionHelper, seedindex)
end

#!---------------------------------------------------------#
#! Permutation definition (Thank you RKevin for saving me) #
#!---------------------------------------------------------#
def get_shuffled_permutation(arr, seed)
    arr = arr.clone # so we don't destroy the original copy
    retval = []
    while arr.length != 0
        idx = seed % arr.length
        seed /= arr.length
        retval.push(arr[idx])
        arr.delete_at(idx)
    end
    return retval
end

def factorial(n)
    return 1 if n == 0
    return n*factorial(n-1)
end
#!---------------------------------------------------------#
#!-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
#!---------------------------------------------------------#
end