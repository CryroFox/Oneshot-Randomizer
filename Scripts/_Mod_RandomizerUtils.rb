class Randomizer # ? Utils is just another script to keep the larger techichal calls that are used commonly seperate from the main randomizer script


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