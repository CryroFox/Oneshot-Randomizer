# Put any overrides/extensions to RGSS modules here

module RPG
module Cache
@randomizerfolder = "__Randomizer/MessiahPacks/"
# //----------------------------------------------------------
#  * Characters
# //----------------------------------------------------------



      def self.character(filename, hue)
      clear
      filename = filename.downcase
      filename = 'blank' if filename.start_with?('!')
      hue = rand(0..255) if filename.start_with?("snail")
      
      #if $randomizer.en && filename.start_with?("niko")
      #filename.gsub!(/niko/, "en")
      #end

      if $game_switches[160] && filename.start_with?("niko")
      filename.gsub!(/niko/, "en")
      end

      return self.load_bitmap("Graphics/Characters/", filename, hue) if !defined?($randomizer) == nil

      # // -----------------------// #
      # >   Randomizer Override    < #
      # // -----------------------// #
      if filename.start_with?('niko') && $randomizer.NikoPak != nil
        @pak          = $randomizer.NikoPak
        @paksprnam    = $randomizer.PakSprt
        tmpname       =  filename.gsub('.png', '')
        @changed_file = ''
        filename =  @paksprnam
        filename = filename +'_sun'         if tmpname.end_with?('_bulb')                  unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam
        filename = filename +'_gasmask'     if tmpname.end_with?('_gasmask')               unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam
        filename = filename +'_gasmask_sun' if tmpname.end_with?('_gasmask_sun')           unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam
        filename = filename +'_roomba'      if tmpname.end_with?('_roomba3')               unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam
        filename = filename +'_roomba_sun'  if tmpname.end_with?('_roomba2')               unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam
        filename = filename +'_red'         if tmpname.end_with?('_red_interior_sunless')  unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam
        filename = filename +'_red_sun'     if tmpname.end_with?('_red_interior')          unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam
        filename = filename +'_finale'      if tmpname.end_with?('_finale')                unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam

        if !File.exists?(@randomizerfolder + @pak + '/' + 'OverWorld/' + filename + '.png')
          if filename.end_with?('_sun')
            filename =  @paksprnam + '_sun'
          else
            filename =  @paksprnam
          end
        end
        
        return self.load_bitmap(@randomizerfolder + @pak + '/' + 'OverWorld/', filename, hue)
      end
      # // -----------------------// #
      # >--------------------------< #
      # // -----------------------// #
      
      self.load_bitmap("Graphics/Characters/", filename, hue)
    end
    
    # //----------------------------------------------------------
    #  * Faces
# //----------------------------------------------------------
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

      
      if filename.start_with?($randomizer.MessiahName.to_s.downcase) and $randomizer.MessiahName.to_s.downcase != '' and $randomizer.MessiahName.to_s.downcase != nil
        filename.gsub!($randomizer.MessiahName.to_s.downcase, "niko")
      end
      
      if $game_switches[160] && filename.start_with?("niko")
        filename.gsub!(/niko/, "en")
      end
      
      return self.load_bitmap(@randomizerfolder + @pak + '/' + 'Faces/', filename) if $randomizer.PakUseFaces and filename.start_with?('niko')
      
      self.load_bitmap("Graphics/Faces/", filename)
      end

# //----------------------------------------------------------
#  * Menu
# //----------------------------------------------------------

      def self.menu(filename)
      self.load_bitmap("Graphics/Menus/", filename)
      end

# //----------------------------------------------------------
#  * Lightmaps
# //----------------------------------------------------------


      def self.lightmap(filename)
      clear
      return self.load_bitmap("Graphics/Lightmaps/", filename) if !defined?($randomizer) == nil

      # // -----------------------// #
      # >   Randomizer Override    < #
      # // -----------------------// #
      if filename.start_with?('niko') && $randomizer.NikoPak != nil
        @pak          = $randomizer.NikoPak
        @paksprnam    = $randomizer.PakSprt
        tmpname       =  filename.gsub('.png', '')
        @changed_file = ''
        filename =  @paksprnam
        filename = filename +'_sun'         if tmpname.end_with?('_bulb')                  unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam
        filename = filename +'_gasmask'     if tmpname.end_with?('_gasmask')               unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam
        filename = filename +'_gasmask_sun' if tmpname.end_with?('_gasmask_sun')           unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam
        filename = filename +'_roomba'      if tmpname.end_with?('_roomba3')               unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam
        filename = filename +'_roomba_sun'  if tmpname.end_with?('_roomba2')               unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam
        filename = filename +'_red'         if tmpname.end_with?('_red_interior_sunless')  unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam
        filename = filename +'_red_sun'     if tmpname.end_with?('_red_interior')          unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam
        filename = filename +'_finale'      if tmpname.end_with?('_finale')                unless filename == @changed_file
        @changed_file = filename unless filename == @paksprnam
        
        if !File.exists?(@randomizerfolder + @pak + '/' + 'Lightmaps/' + filename + '.png')
          if filename.end_with?('_sun')
            filename =  @paksprnam + '_sun'
          else
            filename =  @paksprnam
          end
        end
        
        return self.load_bitmap(@randomizerfolder + @pak + '/' + 'Lightmaps/', filename)
      end

      self.load_bitmap("Graphics/Lightmaps/", filename)
      end

# //----------------------------------------------------------
#  * Lights
# //----------------------------------------------------------


      def self.light(filename)
      self.load_bitmap("Graphics/Lights/", filename)
      end

# //----------------------------------------------------------
#  * Misc
# //----------------------------------------------------------

      def self.misc(filename)
      self.load_bitmap("Graphics/Misc/", filename)
      end

# //----------------------------------------------------------
#  * Tileset
# //----------------------------------------------------------

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
