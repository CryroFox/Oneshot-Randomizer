# Put any overrides/extensions to RGSS modules here

module RPG
  module Cache
    @randomizerfolder = "__Randomizer/Sprites/"

    def self.character(filename, hue)
	  filename = filename.downcase
	  if $game_switches[160] && filename.start_with?("niko")
	    filename.gsub!(/niko/, "en")
	  end
    hue = rand(0..255) if filename.start_with?("snail")
    # * Randomizer Sprite Override
    # ? Messiah Sprite
    if filename == ("niko") or filename == ("niko_finale") and $randomizer.PlayerSprite != ''
      filename = ($randomizer.PlayerSprite + '.png')
      return self.load_bitmap(@randomizerfolder, filename, hue)
    end
    # ? Messiah Sun Sprite
    if filename == ("niko_bulb") or filename == ("niko_red_interior") and $randomizer.PlayerSunSprite != ''
      filename = ($randomizer.PlayerSunSprite + '.png')
      return self.load_bitmap(@randomizerfolder, filename, hue)
    end
    # ? Gasmask Sprite
    if filename == ("niko_bulb_gasmask") || filename == ("niko_gasmask") and $randomizer.PlayerGasSprite != ''  
      filename = ($randomizer.PlayerGasSprite + '.png')
      return self.load_bitmap(@randomizerfolder, filename, hue)
    end
    # ? Roomba Sprite
    if filename == ("niko_roomba") || filename == ("niko_roomba2") and $randomizer.PlayerNyoomSprite != ''  
      filename = ($randomizer.PlayerNyoomSprite + '.png')
      return self.load_bitmap(@randomizerfolder, filename, hue)
    end
    
    if $randomizer.af && filename.start_with?("niko")
	    filename.gsub!(/niko/, "en")
	  end

    self.load_bitmap("Graphics/Characters/", filename, hue)
    end
    def self.face(filename)
	  #lowercasing facepic name to be more case insensitive
	  #to catch the few instances where we use "Niko" instead of "niko"
	  filename = filename.downcase

	  #april fools!
	  t = Time.now
	  if t.month == 4 && t.day == 1 && filename.start_with?("niko")
	    filename = "af"
	  end

	  if $randomizer.af == true && filename.start_with?("niko")
	    filename = "af"
	  end

	  if filename.start_with?($randomizer.MessiahName.to_s.downcase)
	    filename.gsub!($randomizer.MessiahName.to_s.downcase, "niko")
	  end

	  if $game_switches[160] && filename.start_with?("niko")
	    filename.gsub!(/niko/, "en")
	  end
      self.load_bitmap("Graphics/Faces/", filename)
    end
    def self.menu(filename)
      self.load_bitmap("Graphics/Menus/", filename)
    end
    def self.lightmap(filename)
    
      # * Randomizer Sprite Override
      # ? Messiah Sprite
      if filename == ("niko") or filename == ("niko_finale") and $randomizer.PlayerLightmap != ''
        return if $randomizer.PlayerSunLightmap == 'none'
        filename = ($randomizer.PlayerSprite + '.png')
        return self.load_bitmap(@randomizerfolder, filename, hue)
      end
    # ? Messiah Sun Sprite
      if filename == ("niko_bulb") or filename == ("niko_red_interior") and $randomizer.PlayerSunLightmap != ''
        return if $randomizer.PlayerSunLightmap == 'none'
        filename = ($randomizer.PlayerSunSprite + '.png')
        return self.load_bitmap(@randomizerfolder, filename, hue)
      end
    # ? Gasmask Sprite
    if filename == ("niko_bulb_gasmask") || filename == ("niko_gasmask") and $randomizer.PlayerGasLightmap != '' 
      return if $randomizer.PlayerSunLightmap == 'none' 
      filename = ($randomizer.PlayerGasLightmap + '.png')
      return self.load_bitmap(@randomizerfolder, filename, hue)
    end
    # ? Roomba Sprite
    if filename == ("niko_roomba") || filename == ("niko_roomba2") and $randomizer.PlayerNyoomLightmap != '' 
      return if $randomizer.PlayerSunLightmap == 'none'
      filename = ($randomizer.PlayerNyoomLightmap + '.png')
      return self.load_bitmap(@randomizerfolder, filename, hue)
    end

      self.load_bitmap("Graphics/Lightmaps/", filename)
    end

    def self.light(filename)
      self.load_bitmap("Graphics/Lights/", filename)
    end
    
    def self.misc(filename)
      self.load_bitmap("Graphics/Misc/", filename)
    end
  
    def self.tileset(filename)
      #style = 'green' # $game_variables[123] ? 1 : "green" 
      #return self.load_bitmap("Graphics/Tilesets/Barrens/" + style.to_s + "/", filename + '.png') if filename.start_with?('blue')
      self.load_bitmap("Graphics/Tilesets/", filename)
    end
  
  end
end

class Tone
  def +(o)
    Tone.new(self.red + o.red, self.green + o.green, self.blue + o.blue, self.gray + o.gray)
  end

  def *(s)
    Tone.new(self.red * s, self.green * s, self.blue * s, self.gray * s)
  end

  def blank?
    self.red == 0 && self.green == 0 && self.blue == 0 && self.gray == 0
  end
end
