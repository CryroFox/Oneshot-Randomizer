class Randomizer # ? Utils is just another script to keep the larger techichal calls that are used commonly seperate from the main randomizer script

# * Maybe also large junk calls like this one
# * Lmao
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