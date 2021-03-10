=begin
#==============================================================================
# ** Method & Class Library
#------------------------------------------------------------------------------
# Build Date  - 09-17-2006
# Version 1.0 - 09-17-2006 - Trickster
# Version 1.1 - 10-03-2006 - Trickster
# Version 1.2 - 11-01-2006 - Trickster & Selwyn
# Version 1.3 - 11-10-2006 - Trickster
# Version 1.4 - 12-01-2006 - Trickster
# Version 1.5 - 01-01-2007 - Trickster, Yeyinde & Lobosque
# Version 2.0 - 04-26-2007 - MACL Authors  
# Version 2.1 - 07-22-2007 - MACL Authors  
# Version 2.2 - 11-20-2007 - MACL Authors & SephirothSpawn
# Version 2.3 - 06-19-2008 - SephirothSpawn & Zeriab
#==============================================================================

#============================================================================== 
# ** Method & Class Library Settings
#------------------------------------------------------------------------------
# ** General MACL Settings
#
#   * Pose Names for Charactersets
#    - Poses = ['down', 'left', 'right', 'up']
#   * Number of Frames Per Pose for charactersets
#    - Frames = 4
#   * Real Elements
#    - Real_Elements = 1, 2, 3, 4, 5, 6, 7, 8
#
# ** Action Test Setup
#
#   * Attack Using
#     - Set this to the basic ids that perform an attack effect
#   * Skill Using
#     - Set this to the kinds that perform an skill effect
#   * Defend Using
#     - Set this to the basic ids that perform an defend effect
#   * Item Using
#     - Set this to the kinds that perform a item using effect
#   * Escape Using
#     - Set this to the basic ids that perform an escape effect
#   * Wait Using
#     - Set this to the basic ids that perform a wait effect
#
# ** Font
#
#   * Default Text Underline Setting
#    - Default_Underline = true or false
#   * Default Text Underline Full Setting
#    - Default_Underline_Full = true or false
#   * Default Text Strikethrough Setting
#    - Default_Strikethrough = true or false
#   * Default Text Stikethrough Full Setting
#    - Default_Strikethrough_Full = true or false
#   * Default Text Shadow Setting
#    - Default_Shadow = true or false
#   * Default Text Shadow Color Setting
#    - Default_Shadow_Color = Color.new(0, 0, 0, 100)
#   * Default Text Outline Setting
#    - Default_Outline = true or false
#   * Default Text Outline Color Setting
#    - Default_Outline_Color = Color.new(0, 0, 0, 100)
#   * Default Text Vertical Gradient Setting
#    - Default_Vert_Grad = true or false
#   * Default Text Horizontal Gradient Setting
#    - Default_Horiz_Grad = true or false
#   * Default Text Gradient Start Color Setting
#    - Default_Grad_S_Color = Color.new(0, 0, 0, 100)
#   * Default Text Gradient End Color Setting
#    - Default_Grad_E_Color = Color.new(0, 0, 0, 100)
#   * Default Font Addon Order (For multi-add settings)
#    - Font_Addon_Order = [:method_name, :method_name, ...]
#
# ** State Icon Settings
#
#   * Normal Icon Filename
#    - Normal_Icon = 'filename'
#   * State Specific Icons
#    - Icon_Name = {state_id => 'filename', ...}
#
# ** Bitmap Draw Settings
#
#   * Bitmap.draw_equip settings (Icon Type Settings When Item Not Equipped)
#    - Draw_Equipment_Icon_Settings = {type_id => icon_name, ...}
#   * Bitmap.draw_blur settings
#    - Blur_Settings = {setting_key => setting, ...}
#    Setting Keys
#     'offset'  - Pixels to be offseted when bluring
#     'spacing' - Number of times to offset blur
#     'opacity' - Max Opacity of blur
#   * Bitmap.draw_anim_sprite settings
#    - Anim_Sprite_Settings = {setting_key => setting, ...}
#    Settings
#     'f' - Frame count reset
#     'w' - Number of frames wide in sprite set
#     'h' - Height of frames wide in sprite set
#==============================================================================

module MACL
    #-------------------------------------------------------------------------
    # * Author Settings (DO NOT TOUCH)
    #-------------------------------------------------------------------------
    Version   = 2.3
    Loaded = []
    #-------------------------------------------------------------------------
    # * General Settings
    #-------------------------------------------------------------------------
    Poses = ['down', 'left', 'right', 'up']
    Frames = 4
    Real_Elements = 1, 2, 3, 4, 5, 6, 7, 8
    #-------------------------------------------------------------------------
    # * Action Test Setup
    #-------------------------------------------------------------------------
    Game_BattleAction::ATTACK_USING = [0]
    Game_BattleAction::SKILL_USING  = [1]
    Game_BattleAction::DEFEND_USING = [1]
    Game_BattleAction::ITEM_USING   = [2]
    Game_BattleAction::ESCAPE_USING = [2]
    Game_BattleAction::WAIT_USING   = [3]
    #-------------------------------------------------------------------------
    # * Font Settings
    #-------------------------------------------------------------------------
    Font::Default_Underline           = false
    Font::Default_Underline_Full      = false 
    Font::Default_Strikethrough       = false
    Font::Default_Strikethrough_Full  = false
    Font::Default_Shadow              = true
    Font::Default_Shadow_Color        = Color.new(0, 0, 0, 100)
    Font::Default_Outline             = false
    Font::Default_Outline_Color       = Color.new(0, 0, 0)
    Font::Default_Vert_Grad           = false
    Font::Default_Horiz_Grad          = false
    Font::Default_Grad_S_Color        = Color.new(255, 255, 255)
    Font::Default_Grad_E_Color        = Color.new(128, 128, 128)
    Font::Addon_Order = [
      :draw_text_shadow, 
      :draw_text_outline, 
      :draw_text, 
      :draw_text_underline, 
      :draw_text_strikethrough, 
      :draw_text_gradient
    ]
    #-------------------------------------------------------------------------
    # * State Icon Settings
    #-------------------------------------------------------------------------
    RPG::State::Normal_Icon = '050-Skill07'
    RPG::State::Icon_Name = {
      1  => '046-Skill03',
      2  => 'Stop',
      3  => 'Venom',
      4  => 'Darkness',
      5  => 'Mute',
      6  => 'Confused',
      7  => 'Sleep',
      8  => 'Paralysis',
      9  => '047-Skill04',
      10 => '047-Skill04',
      11 => 'Slow',
      12 => '047-Skill04',
      13 => '045-Skill06',
      14 => '045-Skill06',
      15 => '045-Skill06',
      16 => '045-Skill06'
    }
    RPG::State::Icon_Name.default = nil
    #-------------------------------------------------------------------------
    # * Bitmap Draw Settings
    #-------------------------------------------------------------------------
    Bitmap::Draw_Equipment_Icon_Settings = {
      0 => '001-Weapon01', 
      1 => '009-Shield01', 
      2 => '010-Head01', 
      3 => '014-Body02', 
      4 => '016-Accessory01'
    }
    Bitmap::Draw_Equipment_Icon_Settings.default = '001-Weapon01'
    Bitmap::Blur_Settings = {
      'offset' => 2, 
      'spacing' => 1, 
      'opacity' => 255
    }
    Bitmap::Anim_Sprite_Settings = {
      'f' => 8, 
      'w' => 4, 
      'h' => 4
    }
    #-------------------------------------------------------------------------
    # * Animated Autotile Settings
    #-------------------------------------------------------------------------
    RPG::Cache::Animated_Autotiles_Frames = 16
  end
  
  #==============================================================================
  # ** SDK Log
  #==============================================================================
  
  if Object.const_defined?(:SDK)
    SDK.log('Method & Class Library', 'MACL Authors', 2.3, '2007-08-29')
  end
  
  #==============================================================================
  # ** Method and Class Library - Documentation
  #------------------------------------------------------------------------------
  # * Outline
  #
  #  This script set provides a utility for other scripters by: adding extra 
  #  methods, classes & modules to prevent other scripters from 
  #  "reinventing the wheel" and adding methods, classes & modules for other 
  #  scripters to use
  #------------------------------------------------------------------------------ 
  # * How to Install
  #
  #  - The main setup should be placed below all default scripts, but above
  #    custom ones, that is, below Scene_Debug, but above main. If SDK is present
  #    then below SDK.
  #  - Non scripters can just add the set so that scripts that utilize these
  #    methods/classes will work without any errors.
  #  - Notice the System Setup this controls constants which may affect some 
  #    scripts using them.
  #------------------------------------------------------------------------------ 
  # * How to Use
  #
  #  - Please refer to the individual files for method/class information
  #  - If you see a method/class you want to use copy the whole set into your 
  #    script preferably in a new script telling what set it is so for people who 
  #    have the whole set can just remove that script since it is already included
  #  - Do not just copy the method/class you want to use copy the whole set since
  #    some methods in a set depend on other methods.
  #  - DO NOT EDIT ANY OF THE METHODS IN MACL!!!
  #     If you want to edit a method make a copy of it change the name and edit it
  #     If you want to edit a class make a new class w/a copy the methods from 
  #     there
  #  - Be sure to follow the method call instructions given
  #  - If you have any questions then post in the following topic:
  #    http://www.rmxp.org/forums/showthread.php?t=9417
  #------------------------------------------------------------------------------ 
  # * Submitting an Item to the library  
  #
  # Naming
  # ------
  #  - Method names should be in all lowercase letters, this is to prevent the
  #    Ruby Interpreter from confusing methods with constants.
  #  - Dangerous (Modifies Itself) Methods should be followed by an !
  #  - Query (Testing, Checking) Methods should be followed by an ?
  #  - Commonly created methods (gradient bars, etc.) should have the author's
  #    name in it as well to prevent incompatibilty
  #  - Class names should begin with a Capital letter
  #  
  # Headers
  # -------
  #  - Methods should use this header
    #-------------------------------------------------------------------------
    # * Name      :
    #   Info      :
    #   Author    :
    #   Call Info :
    #   Comments  :
    #-------------------------------------------------------------------------
  #  - Classes should use this header
  #============================================================================== 
  # ** Class Name                                                       By Author
  #------------------------------------------------------------------------------
  #  A Description of your class here
  #==============================================================================
  #
  # Approval
  # --------
  #  - All Items must be approved before being put in the library, this is to
  #    maintain quality and to ensure that methods/classes work, are functional
  #    and stable.
  #      
  # Improvements
  # ------------
  #  - If you want to improve a method, such as adding new functionality or
  #    improving a method, you can directly edit it, but the old and new calls
  #    to a method must be compatible, that is it should do the same thing it
  #    did with the original call. You must update the method header and then
  #    submit it for approval.
  #==============================================================================
  
  #============================================================================== 
  # ** Ruby.Higher Classes
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Methods created to enhance the higher classes in Ruby.
  #  
  # Method List:
  # ------------
  #
  #   Module
  #   ------
  #   attr_sec_accessor
  #   attr_sec_reader
  #   class_accessor
  #   class_writer
  #   class_reader
  #   class_sec_accessor
  #   class_sec_reader
  #   super_skip
  #     
  #   Kernel
  #   ------
  #   class_type
  #   rand_between
  #   rand_name
  #==============================================================================
  
  MACL::Loaded << 'Ruby.Higher Classes'
  
  #============================================================================== 
  # ** Module     
  #==============================================================================
  
  class Module
    #-------------------------------------------------------------------------
    # * Name      : Secondary Accessor (Reader with a default)
    #   Info      : Creates reader and writer method for one or more 
    #               instance variables, with the reader methods having
    #               default values
    #   Author    : Zeriab
    #   Call Info : Symbol & Default Pairs, and optional Block
    #-------------------------------------------------------------------------
    def attr_sec_accessor(sym, *args, &block)
      if block.nil? # default actions
        args = [0] if args.size == 0 #default = 0
        if args.size < 2 # One pair
          attr_writer sym
          attr_sec_reader sym, *args
        else # loads of methods followed by a default value.
          default = args[-1]
          syms = [sym].concat(args)
          syms.pop
          for sym in syms
            attr_writer sym
            attr_sec_reader sym, default
          end
        end
      else # when a block is given
        # currently just pair sematics
        args.unshift(sym)
        i = 0
        while i < args.size
          attr_writer args[i]
          attr_sec_reader args[i], args[i+1]
          i += 2
        end
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Secondary Reader (Reader with a default)
    #   Info      : Creates reader method for one instance variable, 
    #               with the reader methods having default a value
    #   Author    : Zeriab
    #   Call Info : Symbol & Default Pair
    #-------------------------------------------------------------------------
    def attr_sec_reader(sym, default = 0)
      sym = sym.id2name
      string = "def #{sym};" +
               "  @#{sym} = #{default}  if @#{sym}.nil?;" +
               "  @#{sym};" +
               "end;"
      module_eval(string)
    end
    #-------------------------------------------------------------------------
    # * Name      : Class Attribute
    #   Info      : Calls class_reader/writer for a symbol
    #   Author    : Yeyinde
    #   Call Info : symbol, writable
    #               symbol:   A Symbol
    #               writable: Boolean telling is symbol is writable
    #-------------------------------------------------------------------------
    private
    def class_attr(symbol, writable = false)
      class_reader(symbol)
      class_writer(symbol) if writable
      return nil
    end
    #-------------------------------------------------------------------------
    # * Name       : Class Accessor
    #   Info       : Creates reader and writer methods for one or more class 
    #                variables
    #   Author     : Yeyinde
    #   Call Info  : One or more Symbols
    #-------------------------------------------------------------------------
    def class_accessor(*symbols)
      class_writer(*symbols)
      class_reader(*symbols)
    end
    #-------------------------------------------------------------------------
    # * Name      : Class Writer
    #   Info      : Creates writer method for one or more class variables
    #   Author    : Yeyinde
    #   Call Info : One or more Symbols
    #-------------------------------------------------------------------------
    def class_writer(*symbols)
      symbols.each do |symbol|
        method = symbol.id2name
        module_eval("def self.#{method}=(var); @@#{method} = var; end")
      end
      return nil
    end
    #-------------------------------------------------------------------------
    # * Name      : Class Reader
    #   Info      : Creates reader method for one or more class variables
    #   Author    : Yeyinde
    #   Call Info : One or more Symbols 
    #-------------------------------------------------------------------------
    def class_reader(*symbols)
      symbols.each do |symbol|
        method = symbol.id2name
        module_eval("def self.#{method}; return @@#{method}; end")
      end
      return nil
    end
    #-------------------------------------------------------------------------
    # * Name      : Class Secondary Accessor (Reader with a default)
    #   Info      : Creates reader and writer method for one or more 
    #               class variables, with the reader methods having
    #               default values
    #   Author    : Zeriab, Yeyinde & SephirothSpawn
    #   Call Info : Symbol & Default Pairs, and optional Block
    #-------------------------------------------------------------------------
    def class_sec_accessor(sym, *args, &block)
      if block.nil? # default actions
        args = [0] if args.size == 0 #default = 0
        if args.size < 2 # One pair
          class_writer sym
          class_sec_reader sym, *args
        else # loads of methods followed by a default value.
          default = args[-1]
          syms = [sym].concat(args)
          syms.pop
          for sym in syms
            class_writer sym
            class_sec_reader sym, default
          end
        end
      else # when a block is given
        # currently just pair sematics
        args.unshift(sym)
        i = 0
        while i < args.size
          class_writer args[i]
          class_sec_reader args[i], args[i+1]
          i += 2
        end
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Class Secondary Reader (Reader with a default)
    #   Info      : Creates reader method for one class variable, 
    #               with the reader methods having default a value
    #   Author    : Zeriab, Yeyinde & SephirothSpawn
    #   Call Info : Symbol & Default Pair
    #-------------------------------------------------------------------------
    def class_sec_reader(sym, default = 0)
      sym = sym.id2name
      string = "def self.#{sym};" +
               "  @@#{sym} = #{default}  if @@#{sym}.nil?;" +
               "  @@#{sym};" +
               "end;"
      module_eval(string)
    end
    #-------------------------------------------------------------------------
    # * Name      : Super Skip
    #   Info      : Allows you to call ancestor super method, without calling
    #               ancestors between target ancestor.
    #   Author    : SephirothSpawn
    #   Call Info : Method Name (Symbol)
    #               Target Parent Class (Class Name)
    #               Script Name (String)
    #-------------------------------------------------------------------------
    def super_skip(method_name, tpc, script_name = 'modulemethodskip')
      # Gets String Version of Method Name
      method_name = method_name.id2name
      # Gets Array of Ancstors
      ancestors = self.ancestors
      # If Target Parent Class not part of Ancestors
      unless ancestors.include?(tpc)
        p 'Un-defined Parents Class - ' + tpc.to_s
        return
      end
      # Starts Index
      index = 0
      # Gets Target Parent Index
      target_index = ancestors.index(tpc)
      # Loop
      loop do
        # Adds Index
        index += 1
        # Break if Passed Target Index
        break if index >= target_index
        # Gets Class Names
        cname1 = ancestors[index].to_s
        cname2 = ancestors[index - 1].to_s
        # Gets Alias Name
        aliasn = "seph_#{script_name}_#{cname1.downcase}_#{method_name}"
        # Gets String
        string  = "class ::#{cname1};"
        string += "  alias_method :#{aliasn}, :#{method_name};"
        string += "  def #{method_name}(*args);"
        string += "    super(*args);"
        string += "    return if self.is_a?(#{ancestors[index - 1]});"
        string += "    self.#{aliasn}(*args);"
        string += "  end;"
        string += "end;"
        # Evaulates String
        eval string
      end
    end
  end
  
  #============================================================================== 
  # ** Kernel     
  #==============================================================================
  
  module Kernel
    #-------------------------------------------------------------------------
    #   Name      : Class Type
    #   Info      : Returns a string representing the class type
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def class_type
      # Branch By Object's class
      case self
      when FalseClass, TrueClass, NilClass, Numeric, Range, Regexp, String, Symbol
        # Inspection
        string = inspect
      when Array
        # If Object Is Empty
        if empty?
          # Set String
          string = 'Empty Array'
        else
          # Get Class
          data_type = compact[0].class
          # Setup flag
          flag = true
          # Run Through Compacted data checking class
          compact.each {|data| flag &&= data.class == data_type}
          # Setup Extra String to class if flag is true
          string = 'Array - ' + (flag ? data_type.to_s : 'Object')
        end
      when Hash
        # If Object Is Empty
        if empty?
          # Set String
          string = 'Empty Hash'
        else
          # Get Class
          key_type = keys.compact[0].class
          # Setup flag
          key = true
          # Run Through Compacted data checking class
          keys.compact.each {|data| key &&= data.class == key_type}
          # Get Class
          value_type = values.compact[0].class
          # Setup flag
          value = true
          # Run Through Compacted data checking class
          values.compact.each {|data| value &&= data.class == value_type}
          # Setup Extra String to class if flag is true
          string = 'Hash - ' + (key ? key_type.to_s : 'Object') + ' => ' +
            (value ? value_type.to_s : 'Object')
        end
      when Class
        string = self.to_s + ':Class'
      when Module
        string = self.to_s + ':Module'
      else
        # Get Class Name
        string = self.class.to_s
      end
      # Return String
      return string  
    end
    #-------------------------------------------------------------------------
    # * Name      : Random Number Between
    #   Info      : Creates a random number between two numbers
    #   Author    : SephirothSpawn
    #   Call Info : Min and Max Number
    #-------------------------------------------------------------------------
    def rand_between(min, max)
      return min + rand(max - min + 1)
    end
    #-------------------------------------------------------------------------
    # * Name      : Random Name
    #   Info      : Creates a random name
    #   Author    : Trickster
    #   Call Info : Variable - Format Strings If none then strings from Setup
    #               Are Used
    #   Comments  : Format C - consonant V - vowel
    #-------------------------------------------------------------------------
    def rand_name(*formats)
      format = formats.random
      name = ''
      format.split(//).each do |char|
        case char
        when 'C'
          name += %w( B C D F G H J K L M N P R S T V W X Y Z ).random
        when 'V'
          name += %w( A E I O U Y ).random
        when 'c'
          name += %w( b c d f g h j k l m n p r s t v w x y z ).random
        when 'v'
          name += %w( a e i o u y ).random
        else
          name += char
        end
      end
      return name
    end
  end
  
  #============================================================================== 
  # ** Ruby.Array.find
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Methods created for finding and returning objects inside of an array.
  #  
  # Method List:
  # ------------
  # all_indexes
  # find_index
  # includes?
  # includes_any?
  # include_times
  # of_index
  #==============================================================================
  
  MACL::Loaded << 'Ruby.Array.find'
  
  #============================================================================== 
  # ** Array     
  #==============================================================================
  
  class Array
    #-------------------------------------------------------------------------
    # * Name      : All Indexes 
    #   Info      : Returns All indexes where obj is (see find_index)
    #   Author    : Trickster
    #   Call Info : One Argument. Value (Object)
    #   Comment   : Synonym for find_index
    #-------------------------------------------------------------------------
    def all_indexes(obj)
      # Setup Array
      array = []
      # Run Through Push index if objects are equal
      each_index {|index| array << index if obj == self[index]}
      # Return Array
      return array
    end
    #-------------------------------------------------------------------------
    # * Name      : Finds Index 
    #   Info      : Finds all indexes with the value sent to it
    #   Author    : Trickster
    #   Call Info : One Argument. a Object
    #-------------------------------------------------------------------------
    def find_index(value)
      # Setup Array of Indexes
      indexes = []
      # Run Through each with index and add index if the same
      each_with_index {|element, index| indexes << index if element == value}
      # Return Indexes
      return indexes
    end  
    #-------------------------------------------------------------------------
    #   Name      : Includes?
    #   Info      : Returns true if all of the values sent is included
    #   Author    : Trickster
    #   Call Info : Variable Amount, Objects
    #   Comment   : If using an array and want to check each element, 
    #               use argument expansion to expand the array.
    #-------------------------------------------------------------------------
    def includes?(*args)
      # Return false if object is not included
      args.each {|object| return false unless include?(object)}
      # Everything is included
      return true
    end
    #-------------------------------------------------------------------------
    #   Name      : Includes Any?
    #   Info      : Returns true if any of the values sent is included
    #   Author    : Trickster
    #   Call Info : Variable Amount, Objects
    #   Comment   : If using an array and want to check each element, 
    #               use argument expansion to expand the array.
    #-------------------------------------------------------------------------
    def includes_any?(*args)
      # Return true if args is empty
      return true if args.empty?
      # Return true if any of the objects is included
      args.each {|object| return true if include?(object)}
      # Not Included
      return false
    end
    #-------------------------------------------------------------------------
    # * Name      : Include Times 
    #   Info      : Returns how many times the value sent is included
    #   Author    : Trickster
    #   Call Info : One Argument. anObject
    #-------------------------------------------------------------------------
    def include_times(obj)
      # Setup Local Variable
      times = 0
      # Run Through Each Increaing Times if object is equal
      each {|element| times += 1 if element == obj}
      # Return number of times included
      return times
    end
    #-------------------------------------------------------------------------
    # * Name      : Of index
    #   Info      : Assuming Self is an Array of Arrays returns the values at index
    #   Author    : Trickster
    #   Call Info : One - Integer index index of the values you want to return
    #-------------------------------------------------------------------------
    def of_index(index)
      # Create Array
      array = []
      # Run Through and get array at index
      each {|sub_array| array << sub_array[index] if sub_array.is_a?(Array)}
      # Return Array
      return array
    end
  end
  
  #============================================================================== 
  # ** Ruby.Array.math
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # More Mathematical methods for the Array class, these methods however assume
  # all objects in the array are of class Numeric.
  #  
  # Method List:
  # ------------
  # average
  # geometric_average
  # product
  # sum
  #==============================================================================
  
  MACL::Loaded << 'Ruby.Array.math'
  
  #============================================================================== 
  # ** Array     
  #==============================================================================
  
  class Array
    #---------------------------------------------------------------------------
    # * Name      : Average
    #   Info      : Averages all values in the array
    #   Author    : Trickster
    #   Call Info : Zero To One Arguments Defaults to False
    #               Boolean float if true always returns a Float else returns a
    #               Float or a Integer depending on the Types in the array
    #---------------------------------------------------------------------------
    def average(float = false)
      # Divide By Number
      return sum / (float ? size.to_f : size)
    end
    #---------------------------------------------------------------------------
    # * Name      : Geometric Average
    #   Info      : Returns the Geometric Mean of all values in the array
    #   Author    : Trickster
    #   Call Info : Zero To One Arguments Defaults to False
    #               Boolean to_float if true always returns a Float else 
    #               always returns an Integer regardless of the Types in the 
    #               array
    #---------------------------------------------------------------------------
    def geometric_average(float = false)
      # Return 0 if empty
      return 0 if empty?
      # Get Geometric Average
      average = product ** (1.0 / size)
      # If Float return average else convert to integer
      return (float ? average : average.to_i)
    end
    #---------------------------------------------------------------------------
    # * Name      : Product
    #   Info      : Returns the product of all values in the array
    #   Author    : Trickster
    #   Call Info : No Arguments
    #---------------------------------------------------------------------------
    def product
      # Setup N initialize to 1
      n = 1
      # Run Through and Find Product
      each {|num| n *= num}
      # Return Product
      return n
    end
    #---------------------------------------------------------------------------
    # * Name      : Sum
    #   Info      : Sums all values in the array
    #   Author    : Trickster
    #   Call Info : No Arguments
    #---------------------------------------------------------------------------
    def sum
      # Initialize local variable n
      n = 0
      # Sum Up Values in Array
      each {|num| n += num}
      # Return number
      return n
    end
  end
  
  #============================================================================== 
  # ** Ruby.Array.iterator
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # More Iterator Methods for the array class Iterator methods are methods that
  # iterate over an object Each of these methods require a block as an example
  #
  #  anArray.each {|iterators| <code>}
  #
  #  anArray.each do |iterators|
  #    code_to_execute
  #  end
  #
  #  anArray.each { |iterators|
  #    code_to_execute
  #  }
  #  
  #  
  # Method List:
  # ------------
  # each_nth_index
  # each_nth_index_with_index
  # each_ntuple
  # each_pair
  # each_triple
  # each_with_array
  # each_with_array_and_index
  # each_with_next
  # each_with_next_and_index
  #==============================================================================
  
  MACL::Loaded << 'Ruby.Array.iterator'
  
  #============================================================================== 
  # ** Array     
  #==============================================================================
  
  class Array
    #-------------------------------------------------------------------------
    #   Name      : Each Nth Index
    #   Info      : An Iterator Method calls block for every nth in the 
    #               array of arrays
    #   Author    : Trickster
    #   Call Info : Integer index the index to iterate over, A Block
    #-------------------------------------------------------------------------
    def each_nth_index(index)
      # Run Through Each Sub Array and return the value at index
      each {|array| yield(array[index])}
    end
    #-------------------------------------------------------------------------
    #   Name      : Each Nth Index with index
    #   Info      : An Iterator Method calls block for every nth in the 
    #               array of arrays with index
    #   Author    : Trickster
    #   Call Info : Integer index the index to iterate over, A Block
    #-------------------------------------------------------------------------
    def each_nth_index_with_index(index)
      # Run Through Each Sub Array and return the value at index
      each_with_index {|array, i| yield(array[index], i)}
    end
    #-------------------------------------------------------------------------
    #   Name      : Each N-tuple
    #   Info      : An Iterator Method calls block for every tuple in the array
    #   Author    : Trickster
    #   Call Info : Number an Integer value for how many to iterate over, A Block
    #-------------------------------------------------------------------------
    def each_ntuple(number)
      # Get Last Index (last index divisible by number)
      end_num = size - size % number - 1
      # Run Through each index 0, number, 2*number, ..., end_num 
      # and yield i, i+1, i+2, ... i + (number - 1)
      0.step(end_num, number) {|i| yield(*self[i, number])}
    end
    #-------------------------------------------------------------------------
    #   Name      : Each Pair
    #   Info      : An Iterator Method calls block for every pair in the array
    #   Author    : Trickster
    #   Call Info : A Block
    #-------------------------------------------------------------------------
    def each_pair
      # Get Last Index (last even numbered index)
      end_num = size - size % 2 - 1
      # Run Through each index 0, 2, 4, ..., end_num and yield i and i+1
      0.step(end_num, 2) {|i| yield(*self[i,2])}
    end
    #-------------------------------------------------------------------------
    #   Name      : Each Triple
    #   Info      : An Iterator Method calls block for every triple in the array
    #   Author    : Trickster
    #   Call Info : A Block
    #-------------------------------------------------------------------------
    def each_triple
      # Get Last Index (last index divisible by 3)
      end_num = size - size % 3 - 1
      # Run Through each index 0, 3, 6, ..., end_num and yield i, i+1, and i+2
      0.step(end_num, 3) {|i| yield(*self[i,3])}
    end
    #-------------------------------------------------------------------------
    #   Name      : Each With Array
    #   Info      : An Iterator Method calls block for each object in both arrays
    #   Author    : Trickster
    #   Call Info : Variable Amount, Object obj objects to be iterated over. A Block
    #-------------------------------------------------------------------------
    def each_with_array(*array)
      # Run Through Each Index and yield self at i and array at i
      each_index {|i| yield(self[i], array[i])}
    end
    #-------------------------------------------------------------------------
    #   Name      : Each With Array and Index
    #   Info      : An Iterator Method calls block for each object in both arrays
    #               with the index
    #   Author    : Trickster
    #   Call Info : Variable Amount, Object obj objects to be iterated over. A Block
    #-------------------------------------------------------------------------
    def each_with_array_and_index(*array)
      # Run Through Each Index and yield self at i and array at i and index
      each_index {|i| yield(self[i],array[i], i)}
    end
    #-------------------------------------------------------------------------
    #   Name      : Each With Next
    #   Info      : Runs Through with Next num elements
    #   Author    : Trickster
    #   Call Info : Integer num - next few elements to send as well
    #               A Block
    #-------------------------------------------------------------------------
    def each_with_next(num = 1)
      (size - num).times {|i| yield(*self[i..(i+num)])}
    end
    #-------------------------------------------------------------------------
    #   Name      : Each With Next And Index
    #   Info      : Runs Through with Next num elements with index
    #   Author    : Trickster
    #   Call Info : Integer num - next few elements to send as well
    #               A Block
    #-------------------------------------------------------------------------
    def each_with_next_and_index(num = 1)
      (size - num).times {|i| yield(*(self[i..(i+num)] << i))}
    end
  end
  
  #============================================================================== 
  # ** Ruby.Array.list
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Methods created that treats an array as a list.
  #  
  # Method List:
  # ------------
  # random
  # random!
  # rate
  # series_string
  # sort_by!
  # unsort
  #==============================================================================
  
  MACL::Loaded << 'Ruby.Array.list'
  
  #============================================================================== 
  # ** Array     
  #==============================================================================
  
  class Array
    #-------------------------------------------------------------------------
    #   Name      : Random
    #   Info      : Returns a Random element in the array
    #   Author    : SephirothSpawn
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def random
      return self[rand(size)]
    end
    #-------------------------------------------------------------------------
    #   Name      : Random!
    #   Info      : Returns and Deletes a Random element in the array
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def random!
      return delete_at(rand(size))
    end
    #-------------------------------------------------------------------------
    #   Name      : Rate
    #   Info      : Rates all indexes from least(0) to greatest(size-1)
    #   Author    : Trickster
    #   Call Info : Zero or One Arguemtns Boolean Same (Defaults to true)
    #              If same is true then rating increases for same values in the 
    #              array
    #-------------------------------------------------------------------------
    def rate(same = true)
      # Create Rated Array
      rated = []
      # Create A Copy of the Array
      copy = self.dup
      # Initialize rate
      rate = 1
      # Run Through Size number of times
      size.times do
        # For each index where minimum is found
        copy.find_index(copy.compact.min).each do |index|
          # Set Rated at index to rating
          rated[index] = rate
          # Set Copy at index to nil
          copy[index] = nil
          # Increase Rating if false sent (increase for same)
          rate += 1 if !same
        end
        # Increase Rating if same is true (don't increase for same valued)
        rate += 1 if same
        # Break if no more non nil items
        break if copy.nitems == 0
      end
      # Return Rated Array
      return rated
    end
    #-------------------------------------------------------------------------
    # * Name      : Series String
    #   Info      : Returns a String with a list of the objects in the array
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def series_string
      # Setup String
      series = ''
      # If Size is 1
      if size == 1
        # Set Series to First
        series = self[0].to_s
      elsif size == 2
        # Set Battlers to battler and battler
        series = self[0].to_s + ' and ' + self[1].to_s
      else
        # Run Through Each Item with index
        each_with_index do |string, index|
          # Add String to Series
          series += string.to_s
          # Add , if not at last entry
          series += ', ' if index <= size - 2
          # Add and if at last entry
          series += 'and ' if index == size - 2
        end
      end
      return series
    end
    #-------------------------------------------------------------------------
    #   Name      : Sort By!
    #   Info      : Modifies Itself, Performs sort_by on the array
    #   Author    : Trickster
    #   Call Info : A Block
    #   Comment   : See Enumerable#sort_by
    #-------------------------------------------------------------------------
    def sort_by!(&block)
      # Duplicate Array
      saved = self.dup
      # Sort Array Call Block Sent
      sorted = sort_by {|object| block.call(object)}
      # Modify Original Array
      sorted.each_with_index {|item, index| self[index] = item}
      # If Changes Made Return self else nil
      return (saved == self ? nil : self)
    end
    #-------------------------------------------------------------------------
    # * Name      : self.unsort
    #   Info      : return a array of mixed elements
    #   Author    : Hanmac
    #   Call Info :  with min one Argument from type can this be everything
    #-------------------------------------------------------------------------
    def self.unsort(*arrays)
      array = arrays.flatten
      Array.new(array.size) {
        zufall = rand(array.size)
        array.delete_at(zufall)
      }
    end
  end
  
  #============================================================================== 
  # ** Ruby.Comparable/Enumerable
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Miscellaneous New stuff for the Comparable/Enumerable module
  #  
  # Method List:
  # ------------
  #
  #   Enumerable
  #   ----------
  #   unsort
  #==============================================================================
  
  MACL::Loaded << 'Ruby.Comparable/Enumerable'
  
  #============================================================================== 
  # ** Enumerable
  #============================================================================== 
  
  module Enumerable
    #-------------------------------------------------------------------------
    #   Name      : unsort
    #   Info      : return a array of mixed elements
    #   Author    : Hanmac
    #   Call Info : with no Arguments
    #   Comments  : can make nosense with strings
    #-------------------------------------------------------------------------
    def unsort
      Array.unsort(self.entries)
    end
  end
  
  #============================================================================== 
  # ** Ruby.Dir
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Miscellaneous New stuff for the Dir class.
  #  
  # Method List:
  # ------------
  # make_dir
  #==============================================================================
  
  MACL::Loaded << 'Ruby.Dir'
  
  #============================================================================== 
  # ** Dir     
  #==============================================================================
  
  class Dir
    #-------------------------------------------------------------------------
    # * Name      : Make Dir
    #   Info      : Creates Folder Dir
    #   Author    : ??? - http://www.66rpg.com/htm/news624.htm
    #   Call Info : One Arguments
    #               Path : Path to create directory
    #-------------------------------------------------------------------------
    def self.make_dir(path)
      dir = path.split("/")
      for i in 0...dir.size
        unless dir == "."
          add_dir = dir[0..i].join("/")
          begin
            Dir.mkdir(add_dir)
          rescue
          end
        end
      end
    end
  end
  
  #============================================================================== 
  # ** Ruby.Float
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Miscellaneous New stuff for the Float class.
  #  
  # Method List:
  # ------------
  # float_points
  #==============================================================================
  
  MACL::Loaded << 'Ruby.Float'
  
  #============================================================================== 
  # ** Float   
  #==============================================================================
  
  class Float
    #-------------------------------------------------------------------------
    #   Name      : Float Points
    #   Info      : Sets number of float points
    #   Author    : SephirothSpawn
    #   Call Info : One Argument, an Integer, number of float points
    #-------------------------------------------------------------------------
    def float_points(points = 2)
      # Gets Self
      n = self
      # Multiple N
      n *= 10 ** points
      # Converts N to Integer
      n = n.round.to_f
      # Divide back to float
      n /= 10.0 ** points
      # Return N
      return n
    end
  end
  
  #============================================================================== 
  # ** Ruby.Hash
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Miscellaneous New stuff for the Hash class.
  #  
  # Method List:
  # ------------
  # contains_key?
  # get_value
  #==============================================================================
  
  MACL::Loaded << 'Ruby.Hash'
  
  #============================================================================== 
  # ** Hash     
  #==============================================================================
  
  class Hash
    #-------------------------------------------------------------------------
    #   Name      : Contains Key?
    #   Info      : Compares all Keys using == similiar to has_key?
    #   Author    : Trickster
    #   Call Info : One, Key an Object
    #-------------------------------------------------------------------------
    def contains_key?(key)
      # Run Through and Return true if keys are equal
      each_key {|other_key| return true if key == other_key}
      # Return false
      return false
    end
    #-------------------------------------------------------------------------
    #   Name      : Get Value
    #   Info      : Gets Value using == similiar to []
    #   Author    : Trickster
    #   Call Info : One, Key an Object
    #-------------------------------------------------------------------------
    def get_value(key)
      # Run Through and Return Key if equal
      each_key {|other_key| return self[other_key] if key == other_key}
      # If Default Proc is undefined return default else call proc
      return default_proc.nil? ? default : default_proc.call(self, key)
    end
  end
  
  #============================================================================== 
  # ** Ruby.Integer
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Miscellaneous New stuff for the Integer class.
  #  
  # Method List:
  # ------------
  # factorial
  # primorial
  # multifactorial
  #==============================================================================
  
  MACL::Loaded << 'Ruby.Integer'
  
  #============================================================================== 
  # ** Integer     
  #==============================================================================
  
  class Integer     
    #-------------------------------------------------------------------------
    #   Name      : Factorial
    #   Info      : Return the factorial of number
    #   Author    : Tibuda
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def factorial
      result = 1
      self.downto(2) {|i| result *= i }
      return result
    end            
    #-------------------------------------------------------------------------
    #   Name      : Primorial
    #   Info      : Return the primorial of number
    #   Author    : Tibuda
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def primorial
      result = 1
      self.downto(2) {|i| result *= i if i.is_prime? }
      return result
    end      
    #-------------------------------------------------------------------------
    #   Name      : Multifactorial
    #   Info      : Return the multifactorial of number
    #   Author    : Tibuda
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------  
    def multifactorial(n = 2)
      result = self
      n.downto(1) {|i| result = result.factorial } 
      return result
    end
  end
  
  #============================================================================== 
  # ** Ruby.Math
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Miscellaneous new methods for the Math module
  #  
  # Method List:
  # ------------
  # A (Ackermann function)
  # cw_between_angles?
  # ccw_between_angles?
  # cw_percent_between_angles
  # ccw_percent_between_angles
  #==============================================================================
  
  MACL::Loaded << 'Ruby.Math'
  
  module Math
    #-------------------------------------------------------------------------
    # * Name      : Ackermann function
    #   Info      : returns the Natural Number of an A(m,n) Integer
    #   Author    : Me(tm)
    #   Call Info : m as Integer, n as Integer, both 0 or positive.
    #-------------------------------------------------------------------------  
    def Math.A(m,n)
      raise ArgumentError.new('Ackermann: No negative values allowed.') if m < 0 or n < 0
      return n + 1 if m == 0
      return Math.A(m - 1, 1) if n == 0
      return Math.A(m - 1, Math.A(m, n - 1))
    end
    #-------------------------------------------------------------------------
    # * Name      : Angle Between Angles (Clockwise)
    #   Info      : Returns boolean of angle between 2 angles
    #   Author    : SephirothSpawn
    #   Call Info : Test Angle, Start Angle, End Angle
    #               Radians boolean (if true, converts to degrees)
    #-------------------------------------------------------------------------  
    def self.cw_between_angles?(ang, a1, a2, radians = false)
      # Convert from degrees to radians, if radians
      a1 *= 180 / PI if radians
      a2 *= 180 / PI if radians
      # Make Degrees between 0 - 360
      a1 %= 360 ; a2 %= 360
      # Make a1 Greater than a2
      a1 += 360 if a1 < a2
      # Returns Angle Between Angles
      return ang.between?(a2, 360) || ang.between?(0, a1 - 360) if a1 > 360
      return ang.between?(a2, a1)
    end
    #-------------------------------------------------------------------------
    # * Name      : Angle Between Angles (Counter-Clockwise)
    #   Info      : Returns boolean of angle between 2 angles
    #   Author    : SephirothSpawn
    #   Call Info : Test Angle, Start Angle, End Angle
    #               Radians boolean (if true, converts to degrees)
    #-------------------------------------------------------------------------  
    def self.ccw_between_angles?(ang, a1, a2, radians = false)
      # Convert from degrees to radians, if radians
      a1 *= 180 / PI if radians
      a2 *= 180 / PI if radians
      # Make Degrees between 0 - 360
      a1 %= 360 ; a2 %= 360
      # Make a2 Greater than a1
      a2 += 360 if a2 < a1
      # Returns Angle Between Angles
      return ang.between?(a1, 360) || ang.between?(0, a2 - 360) if a2 > 360
      return ang.between?(a1, a2)
    end
    #-------------------------------------------------------------------------
    # * Name      : Angle Percnt Between Angles (Clockwise)
    #   Info      : Returns boolean of angle between 2 angles
    #   Author    : SephirothSpawn
    #   Call Info : Test Angle, Start Angle, End Angle
    #               Radians boolean (if true, converts to degrees)
    #-------------------------------------------------------------------------  
    def self.cw_percent_between_angles(ang, a1, a2, radians = false)
      # Convert from degrees to radians, if radians
      a1 *= 180 / PI if radians
      a2 *= 180 / PI if radians
      # Make Degrees between 0 - 360
      a1 %= 360 ; a2 %= 360
      # Make aa Greater than a2
      a1 += 360 if a1 < a2
      # Gets Percent
      per = (ang - a2) / (a1 - a2).to_f
      # If Negative, and 360 to Angle
      per = (ang + 360 - a2) / (a1 - a2).to_f if per < 0
      # Return Percent
      return per
    end
    #-------------------------------------------------------------------------
    # * Name      : Angle Percent Between Angles (Counter-Clockwise)
    #   Info      : Returns boolean of angle between 2 angles
    #   Author    : SephirothSpawn
    #   Call Info : Test Angle, Start Angle, End Angle
    #               Radians boolean (if true, converts to degrees)
    #-------------------------------------------------------------------------  
    def self.ccw_percent_between_angles(ang, a1, a2, radians = false)
      # Convert from degrees to radians, if radians
      a1 *= 180 / PI if radians
      a2 *= 180 / PI if radians
      # Make Degrees between 0 - 360
      a1 %= 360 ; a2 %= 360
      # Make a2 Greater than a1
      a2 += 360 if a2 < a1
      # Gets Percent
      per = (ang - a1) / (a2 - a1).to_f
      # If Negative, and 360 to Angle
      per = (ang + 360 - a1) / (a2 - a1).to_f if per < 0
      # Return Percent
      return per
    end
  end
  
  #============================================================================== 
  # ** Ruby.Math.dist
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # This set allows the generation of discrete distributed random values.
  #
  # Class List:
  # -----------
  # Math::Uniform
  # Math::Bernoulli
  # Math::Binomial
  # Math::Geometric
  # Math::Poisson
  #
  # Method List: (avaiable for all classes)
  # ------------
  # initialize
  # generate
  # generate_array
  # prob
  #==============================================================================
  
  MACL::Loaded << 'Ruby.Math.dist'
  
  #============================================================================== 
  # ** Math     
  #==============================================================================
  
  module Math        
    #-------------------------------------------------------------------------
    # * Distribution precision (keep it high and float)
    #-------------------------------------------------------------------------
    Dist_precision = 1000.0
    #============================================================================== 
    # ** Math::Uniform                                                 By: Tibuda
    #-----------------------------------------------------------------------------
    #  A class for generating unform distributed random values. It's used as a
    #  base for other distributions.                                           
    #-----------------------------------------------------------------------------  
    #  The discrete uniform distribution can be characterized by saying that all
    #  values of a finite set of possible values are equally probable.
    #==============================================================================
    class Uniform        
      #--------------------------------------------------------------------------
      # * Public Instance Variables
      #--------------------------------------------------------------------------
      attr_reader :min
      attr_reader :max
      #-------------------------------------------------------------------------
      # * Name      : Initialize
      #   Info      : Object Initialization
      #   Author    : Tibuda
      #   Call Info : Zero to Two
      #               Integer minumum value (default 0)
      #               Integer maximum value (default 1)
      #-------------------------------------------------------------------------
      def initialize(min = 0, max = 1)
        @min = min
        @max = max
        @max += @min if max < min
      end
      #-------------------------------------------------------------------------
      # * Name      : Generate
      #   Info      : Generates uniform distributed value
      #   Author    : Tibuda
      #   Call Info : No Arguments
      #------------------------------------------------------------------------- 
      def generate
        return @min + rand(@max - @min)
      end 
      def gen
        return generate
      end           
      #-------------------------------------------------------------------------
      # * Name      : Generate array
      #   Info      : Generates an array with uniform distributed values
      #   Author    : Tibuda
      #   Call Info : One
      #               Integer array size
      #------------------------------------------------------------------------- 
      def generate_array(size)
        result = []
        for i in 0...size
          result << generate
        end
        return result
      end  
      def gen_array(size)
        return generate_array(size)
      end
      #-------------------------------------------------------------------------
      # * Name      : Probability mass function
      #   Info      : Returns the probability of observing a value
      #   Author    : Tibuda
      #   Call Info : One
      #               Integer tested value
      #-------------------------------------------------------------------------
      def prob(x)
        return (x < @min || x > @max) ? 0 : 1 / (@max - @min)
      end    
    end     
    
    #============================================================================== 
    # ** Math::Bernoulli                                               By: Tibuda
    #-----------------------------------------------------------------------------  
    #  A class for generating Bernoulli distributed random values. It's used as a
    #  base class for binomial and geometric distributions.        
    #-----------------------------------------------------------------------------  
    #  Bernoulli trial is an experiment whose outcome is random and can be either
    #  of two possible outcomes, "success" and "failure". In practice it refers to
    #  a single experiment which can have one of two possible outcomes, like "yes
    #  or no" questions.
    #==============================================================================
    class Bernoulli < Uniform      
      #--------------------------------------------------------------------------
      # * Public Instance Variables
      #--------------------------------------------------------------------------
      attr_reader :p           
      attr_reader :success        
      attr_reader :failure           
      #-------------------------------------------------------------------------
      # * Name      : Initialize
      #   Info      : Object Initialization
      #   Author    : Tibuda
      #   Call Info : Zero to Three
      #               Float probability of success (default 0.5)
      #               Variant success return value (default 1)
      #               Variant failure return value (default 0)
      #-------------------------------------------------------------------------  
      def initialize(p = 0.5, success = 1, failure = 0)
        super(0, Dist_precision)
        @p = p 
        @success = success
        @failure = failure
      end             
      #-------------------------------------------------------------------------
      # * Name      : Generate
      #   Info      : Generates Bernoulli distributed value
      #   Author    : Tibuda
      #   Call Info : No Arguments
      #------------------------------------------------------------------------- 
      def generate
        return super.to_f / Dist_precision <= @p ? @success : @failure
      end   
      #-------------------------------------------------------------------------
      # * Name      : Probability mass function
      #   Info      : Returns the probability of observing a value
      #   Author    : Tibuda
      #   Call Info : One
      #               Integer tested value
      #-------------------------------------------------------------------------
      def prob(x)
        return @p if x == @success
        return 1 - @p if x == @failure
        return 0
      end     
    end
    
    #============================================================================== 
    # ** Math::Binomial                                                By: Tibuda
    #-----------------------------------------------------------------------------     
    #  A class for generating binomial distributed random values.   
    #-----------------------------------------------------------------------------  
    #  The binomial distribution is the probability distribution of the number of
    #  "successes" in n independent Bernoulli trials, with the same probability of
    #  "success" on each trial.
    #==============================================================================
    class Binomial < Bernoulli               
      #--------------------------------------------------------------------------
      # * Public Instance Variables
      #--------------------------------------------------------------------------
      attr_reader :n                        
      #-------------------------------------------------------------------------
      # * Name      : Initialize
      #   Info      : Object Initialization
      #   Author    : Tibuda
      #   Call Info : Zero to Two
      #               Integer number of trials (default 1)
      #               Float probability of success (default 0.5)
      #-------------------------------------------------------------------------
      def initialize(n = 1, p = 0.5)
        super(p, 1, 0)
        @n = n
      end   
      #-------------------------------------------------------------------------
      # * Name      : Generate
      #   Info      : Generates binomial distributed value
      #   Author    : Tibuda
      #   Call Info : No Arguments
      #------------------------------------------------------------------------- 
      def generate  
        result = 0
        for i in 0...@n
          result += super
        end
        return result
      end
      #-------------------------------------------------------------------------
      # * Name      : Probability mass function
      #   Info      : Returns the probability of observing a value
      #   Author    : Tibuda
      #   Call Info : One
      #               Integer tested value
      #-------------------------------------------------------------------------
      def prob(x)
        binomial_coef = @n.factorial / (x.factorial * (@n - x).factorial)
        return  binomial_coef * @p ** x * (1 - @p) ** (@n - x)
      end
    end
    
    #============================================================================== 
    # ** Math::Geometric                                               By: Tibuda
    #-----------------------------------------------------------------------------     
    #  A class for generating geometric distributed random values.   
    #-----------------------------------------------------------------------------  
    #  The geometric distribution is the probability distribution of the number
    #  of Bernoulli trials needed to get one success.
    #==============================================================================
    class Geometric < Bernoulli   
      #-------------------------------------------------------------------------
      # * Name      : Initialize
      #   Info      : Object Initialization
      #   Author    : Tibuda
      #   Call Info : Zero to One
      #               Float probability of success (default 0.5)
      #-------------------------------------------------------------------------
      def initialize(p = 0.5)
        super(p, true, false)
      end         
      #-------------------------------------------------------------------------
      # * Name      : Generate
      #   Info      : Generates geometric distributed value
      #   Author    : Tibuda
      #   Call Info : No Arguments
      #------------------------------------------------------------------------- 
      def generate
        k = 0
        while super == false
          k += 1
        end
        return k
      end         
      #-------------------------------------------------------------------------
      # * Name      : Probability mass function
      #   Info      : Returns the probability of observing a value
      #   Author    : Tibuda
      #   Call Info : One
      #               Integer tested value
      #-------------------------------------------------------------------------
      def prob(x)
        return @p * (1 - @p) ** x
      end
    end
    
    #============================================================================== 
    # ** Math::Poisson                            By: Tibuda using Knuth algorithm
    #-----------------------------------------------------------------------------     
    #  A class for generating Poisson distributed random values.   
    #-----------------------------------------------------------------------------  
    #  The Poisson distribution expresses the probability of a number of events
    #  occurring in a fixed period of time if these events occur with a known
    #  average rate, and are independent of the time since the last event.
    #==============================================================================
    class Poisson < Uniform             
      #--------------------------------------------------------------------------
      # * Public Instance Variables
      #--------------------------------------------------------------------------
      attr_reader :lambda     
      #-------------------------------------------------------------------------
      # * Name      : Initialize
      #   Info      : Object Initialization
      #   Author    : Tibuda
      #   Call Info : One
      #               Float expected number of occurrences
      #-------------------------------------------------------------------------
      def initialize(lambda)    
        super(0, Dist_precision)
        @lambda = lambda
      end                
      #-------------------------------------------------------------------------
      # * Name      : Generate
      #   Info      : Generates Poisson distributed value
      #   Author    : Tibuda using Knuth algorithm
      #   Call Info : No Arguments
      #------------------------------------------------------------------------- 
      def generate
        k = 0
        p = 1.0
        while p >= Math.exp(-@lambda)
          k += 1
          p *= super.to_f / Dist_precision
        end
        return k - 1
      end       
      #-------------------------------------------------------------------------
      # * Name      : Probability mass function
      #   Info      : Returns the probability of observing a value
      #   Author    : Tibuda
      #   Call Info : One
      #               Integer tested value
      #-------------------------------------------------------------------------
      def prob(x)
        return Math.exp(-@lambda) * @lambda ** x / x.factorial
      end
    end
  end
  
  #============================================================================== 
  # ** Ruby.Numeric
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Miscellaneous New stuff for the Numeric class.
  #  
  # Method List:
  # ------------
  # is_prime?
  # linear?
  # sign
  #==============================================================================
  
  MACL::Loaded << 'Ruby.Numeric'
  
  #============================================================================== 
  # ** Numeric     
  #==============================================================================
  
  class Numeric
    #-------------------------------------------------------------------------
    #   Name      : Is Prime?
    #   Info      : Checks if a number is prime or not
    #   Author    : Lobosque/Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def is_prime?
      # Not Prime if 0 or one or even
      return false if [0,1].include?(self) or self % 2 == 0
      # Initialize Check Variable
      check = 3
      # While Check is less than self
      while check < Math.sqrt(self)
        # Return false if divisible
        return false if self % check == 0
        # Increase By 2 (Odd numbers only)
        check += 2
      end
      # Is Prime
      return true
    end
    #-------------------------------------------------------------------------
    # * Name      : Linear?
    #   Info      : Tests if Num falls in a + bx
    #   Author    : Trickster
    #   Call Info : Two or Three Arguments Integer A and B
    #               Boolean Neg X allow for negative x
    #-------------------------------------------------------------------------
    def linear?(a, b, negx = true)
      n = self
      return (b == 0 && n == a) || ((n >= a || negx) && (n - a) % b == 0)
    end
    #-------------------------------------------------------------------------
    #   Name      : Sign
    #   Info      : Returns the Sign of the number (0 if 0 1 if + -1 if -)
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def sign
      return zero? ? 0 : (self / self.abs).to_i
    end
  end
  
  #============================================================================== 
  # ** Ruby.Range
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Methods created for finding and returning objects inside of an array.
  #  
  # Method List:
  # ------------
  # random
  # <=>
  #==============================================================================
  
  MACL::Loaded << 'Ruby.Range'
  
  #============================================================================== 
  # ** Range     
  #==============================================================================
  
  class Range
    #--------------------------------------------------------------------------
    # * Include Comparable
    #--------------------------------------------------------------------------
    include(Comparable)
    #--------------------------------------------------------------------------
    # * Name      : Random
    #   Info      : Returns random object in array
    #   Author    : SephirothSpawn
    #   Call Info : Nil
    #--------------------------------------------------------------------------
    def random
      return self.to_a.random
    end
    #--------------------------------------------------------------------------
    # * Name      : <=>
    #   Info      : Compares ranges
    #   Author    : hanmac
    #   Call Info : One Argument, Other range
    #--------------------------------------------------------------------------
    def <=>(other)
      temp = first <=> other.first
      temp = last <=> other.last if temp = 0
      return temp
    end
  end
  
  #============================================================================== 
  # ** Ruby.String
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Miscellaneous New stuff for the String class.
  #  
  # Method List:
  # ------------
  # clear
  # get_int
  # get_ints
  # seph_encrypt
  # seph_encrypt!
  # seph_decrypt
  # seph_decrypt!
  # to_filename
  # to_filename!
  #==============================================================================
  
  MACL::Loaded << 'Ruby.String'
  
  #============================================================================== 
  # ** String     
  #==============================================================================
  
  class String
    #-------------------------------------------------------------------------
    # * Name      : Clear
    #   Info      : Removes string characters and returns self
    #   Author    : SephirothSpawn
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def clear
      slice!(0, self.size)
    end
    #-------------------------------------------------------------------------
    # * Name      : Get Integer
    #   Info      : Gets the Integer from String
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def get_int
      m = self.gsub(/\D/,'')
      return m.to_i
    end
    #-------------------------------------------------------------------------
    # * Name      : Get Integers
    #   Info      : Gets all Integers from String
    #   Author    : Trickster
    #   Call Info : No Arguments 
    #-------------------------------------------------------------------------
    def get_ints
      array = self.split(/\D/)
      array.collect! {|item| item.to_i}
      return array
    end
    #-------------------------------------------------------------------------
    # * Name      : Seph Encrypt
    #   Info      : Returns an encrypted version of a string with a keyword
    #   Author    : SephirothSpawn
    #   Call Info : Encryption Word String
    #-------------------------------------------------------------------------
    def seph_encrypt(encryption_string = 'encrypt')
      # Collects Encryption String Bytes
      encryption_bytes = []
      encryption_string.each_byte {|c| encryption_bytes << c}
      # Creates New String
      string = ''
      # Pass Through Self
      for i in 0...self.size
        # Gets Encrypted Byte
        byte = self[i] * encryption_bytes[i % encryption_bytes.size]
        # Gets Base & Mod Value
        base, mod = byte / 255, byte % 255
        # Adds Encrypted Character
        string += base.chr + mod.chr
      end
      # Returns Encryption String
      return string
    end
    #-------------------------------------------------------------------------
    # * Name      : Seph Encrypt!
    #   Info      : Encrypts self with a keyword. Returns modified self.
    #   Author    : SephirothSpawn
    #   Call Info : Encryption Word String
    #-------------------------------------------------------------------------
    def seph_encrypt!(encryption_string = 'encrypt')
      # Gets Encryption String
      encrypted_string = seph_encrypt(encryption_string)
      # Clears self
      clear
      # Makes self encrypted string
      self.concat(encrypted_string)
      # Returns Decrypted String
      return self
    end
    #-------------------------------------------------------------------------
    # * Name      : Seph Decrypt
    #   Info      : Returns an decrypted version of a string with a keyword
    #   Author    : SephirothSpawn
    #   Call Info : Encryption Word String
    #-------------------------------------------------------------------------
    def seph_decrypt(encryption_string = 'encrypt')
      # Collects Encryption String Bytes
      encryption_bytes = []
      encryption_string.each_byte {|c| encryption_bytes << c}
      # Creates New String
      string = ''
      # Pass Through Self
      for i in 0...(self.size / 2)
        # Gets Base & Mod Value
        b, m = self[i * 2] * 255, self[i * 2 + 1]
        # Gets New Character
        string += ((b + m) / encryption_bytes[i % encryption_bytes.size]).chr
      end
      # Returns Decrypted String
      return string
    end
    #-------------------------------------------------------------------------
    # * Name      : Seph Decrypt
    #   Info      : Decrypts a string with keyword. Returns modified self.
    #   Author    : SephirothSpawn
    #   Call Info : Encryption Word String
    #-------------------------------------------------------------------------
    def seph_decrypt!(encryption_string = 'encrypt')
      # Gets Decrypted String
      decrypted_string = seph_decrypt(encryption_string)
      # Clears self
      clear
      # Makes self encrypted string
      self.concat(decrypted_string)
      # Returns Decrypted String
      return self
    end
    #-------------------------------------------------------------------------
    # * Name      : To Filename
    #   Info      : Converts the string to a filename
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def to_filename
      string = self.clone
      string.downcase!
      string.gsub!(/\s/,'_')
      return string
    end
    #-------------------------------------------------------------------------
    # * Name      : To Filename!
    #   Info      : Modifies Itself Converts the string to a filename
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def to_filename!
      string = self.clone
      self.downcase!
      self.gsub!(/\s/,'_')
      return string == self ? nil : self
    end
  end
  
  #============================================================================== 
  # ** RGSS.Action Test
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # These Set of Methods test the type of action created by a player/enemy in 
  # battle. If you are adding new commands based on Attack, Skill, Item, Defend,
  # or Escape then see the constants related to this set in the MACL Setup section.
  #  
  # Method List:
  # ------------
  #
  #   Game_Battler
  #   -----------------
  #   action?
  #  
  #   Game_BattleAction
  #   -----------------
  #   is_a_skill?
  #   is_a_attack?
  #   is_a_item?
  #   is_a_defend?
  #   is_a_escape?
  #   is_a_wait?
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Action Test'
  
  #==============================================================================
  # ** Game_Battler
  #==============================================================================
  
  class Game_Battler
    #-------------------------------------------------------------------------
    #   Name      : Action?
    #   Info      : Is Action of kind, basic, skill id, and item id
    #   Author    : Trickster
    #   Call Info : Integer kind, basic, skill id, and item id
    #-------------------------------------------------------------------------
    def action?(kind, basic, skill_id = 0, item_id = 0)
      return (@current_action.kind == kind && @current_action.basic == basic &&
      (@current_action.skill_id == skill_id || skill_id == 0) &&
      (@current_action.item_id == item_id || item_id == 0))
    end
  end
  
  #==============================================================================
  # ** Game_BattleAction
  #==============================================================================
  
  class Game_BattleAction
    #-------------------------------------------------------------------------
    #   Name      : Is a Skill?
    #   Info      : Is Action a Skill (That is, if skill id is not zero
    #               Or if the action's kind is included in skill using)
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def is_a_skill?
      return (@skill_id != 0) && SKILL_USING.include?(@kind)
    end
    #-------------------------------------------------------------------------
    #   Name      : Is a Attack?
    #   Info      : Is Action an Attack (That is, if kind is zero and
    #               if the action's basic is zero or included in attack using)
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def is_a_attack?
      return (@kind == 0) && ((@basic == 0) || ATTACK_USING.include?(@basic))
    end
    #-------------------------------------------------------------------------
    #   Name      : Is a Item?
    #   Info      : Is Action a Item (That is, if item id is not zero
    #               Or if the action's kind is included in item using)
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def is_a_item?
      return ITEM_USING.include?(@kind) && (@item_id != 0)
    end
    #-------------------------------------------------------------------------
    #   Name      : Is a Defend?
    #   Info      : Is Action a Defend (That is, if basic is one
    #               Or if the action's basic is included in defend using and 
    #               the kind is 0)
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def is_a_defend?
      return (@kind == 0) && (DEFEND_USING.include?(@basic) || (@basic == 1))
    end
    #-------------------------------------------------------------------------
    #   Name      : Is a Wait?
    #   Info      : Is Action a wait like command (That is, if basic is three
    #               Or if the action's basic is included in wait using and the 
    #               kind is 0)
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def is_a_wait?
      return (@kind == 0) && (WAIT_USING.include?(@basic) || @basic == 3)
    end
    #-------------------------------------------------------------------------
    #   Name      : Is a Escape?
    #   Info      : Is Action a Escape like command (That is, if basic is two
    #               Or if the action's basic is included in the escape using and 
    #               the kind is 0)
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def is_a_escape?
      return (@kind == 0) && (ESCAPE_USING.include?(@basic) || @basic == 2)
    end
  end
  
  #============================================================================== 
  # ** RGSS.Actor and Party Info
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # These set of methods add observer methods to the Game_Actor and Game_Party
  # classes, you can get information on how weak an enemy is to a state, all
  # of the enemies resistances and weaknesses, etc.
  #  
  # Method List:
  # ------------
  #
  #   Game_Battler
  #   ------------
  #   hp_percent
  #   sp_percent
  #
  #   Game_Actor
  #   ----------
  #   element_effectiveness
  #   state_effectiveness
  #   now_exp
  #   next_exp
  #   weapon_ids
  #   armor_ids
  #   equipment
  #   element_test
  #   weaknesses
  #   resistance
  #   next_exp_percent
  #  
  #   Game_Party
  #   ----------
  #   equipped_weapon?
  #   equipped_armor?
  #   has_actors?
  #   strongest
  #   weakest
  #   existing_actors
  #   average_level
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Actor and Party Info'
  
  #==============================================================================
  # ** Game_Battler
  #==============================================================================
  
  class Game_Battler
    #-------------------------------------------------------------------------
    # * Name      : Hp Percent
    #   Info      : Returns HP Percent
    #   Author    : SephirothSpawn
    #   Call Info : Two Arguments
    #               Integer truth, true for integer, false for float
    #               Float points, integer value for number of float points
    #-------------------------------------------------------------------------
    def hp_percent(integer = false, float_points = 2)
      # Gets Float Percent
      n = (self.hp / self.maxhp.to_f * 100.0)
      # Return Percent
      return integer ? Integer(n) : n.float_points(float_points)
    end
    #-------------------------------------------------------------------------
    # * Name      : Sp Percent
    #   Info      : Returns SP Percent
    #   Author    : SephirothSpawn
    #   Call Info : Two Arguments
    #               Integer truth, true for integer, false for float
    #               Float points, integer value for number of float points
    #-------------------------------------------------------------------------
    def sp_percent(integer = false, float_points = 2)
      # Gets Float Percent
      n = (self.sp / self.maxsp.to_f * 100.0)
      # Return Percent
      return integer ? Integer(n) : n.float_points(float_points)
    end
  end
  
  #==============================================================================
  # ** Game_Actor
  #==============================================================================
  
  class Game_Actor
    #-------------------------------------------------------------------------
    #   Name      : Element Effectiveness
    #   Info      : How Effective Enemy is against an Element
    #               An Integer from 0-5 (5: most effective 0: not effective at all)
    #   Author    : Trickster
    #   Call Info : Integer Element_ID id of the element to check
    #-------------------------------------------------------------------------
    def element_effectiveness(element_id)
      # Get a numerical value corresponding to element effectiveness
      table = [0,5,4,3,2,1,0]
      effective = table[$data_classes[@class_id].element_ranks[element_id]]
      # If protected by state, this element is reduced by half
      for i in @states
        if $data_states[i].guard_element_set.include?(element_id)
          effective = (effective / 2.0).ceil
        end
      end
      # End Method
      return effective
    end
    #-------------------------------------------------------------------------
    #   Name      : State Effectiveness
    #   Info      : How Effective Enemy is against a State
    #               An Integer from 0-5 (5: most effective 0: ineffective)
    #   Author    : Trickster
    #   Call Info : Integer State_ID id of the state to check
    #-------------------------------------------------------------------------
    def state_effectiveness(state_id)
      table = [0,5,4,3,2,1,0]
      effective = table[$data_enemies[@enemy_id].state_ranks[state_id]]
      return effective
    end
    #-------------------------------------------------------------------------
    # * Name      : Now Exp
    #   Info      : Gets Actors Next in Current Level
    #   Author    : Near Fantastica
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def now_exp
      return @exp - @exp_list[@level]
    end
    #-------------------------------------------------------------------------
    # * Name      : Next Exp
    #   Info      : Gets Actors Exp for Next Level
    #   Author    : Near Fantastica
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def next_exp
      exp = @exp_list[@level+1] > 0 ? @exp_list[@level+1] - @exp_list[@level] : 0
      return exp
    end
    #-------------------------------------------------------------------------
    # * Name      : Weapon Ids
    #   Info      : Gets ALL Weapon IDs - An Array of Weapon Ids
    #   Author    : Trickster
    #   Call Info : No Arguments
    #   Comment   : Detects @weapon_id and @weapon(n)_id n >= 2
    #-------------------------------------------------------------------------
    def weapon_ids
      equipment = []
      equipment << @weapon_id
      i = 2
      while instance_eval("@weapon#{i}_id") != nil
        equipment << instance_eval("@weapon#{i}_id")
        i += 1
      end
      return equipment
    end
    #-------------------------------------------------------------------------
    # * Name      : Armor Ids
    #   Info      : Gets All Armor IDs - An Array of Armor Ids
    #   Author    : Trickster
    #   Call Info : No Arguments
    #   Comment   : Detects @armor(n)_id
    #-------------------------------------------------------------------------
    def armor_ids
      equipment = []
      i = 1
      while instance_eval("@armor#{i}_id") != nil
        equipment << instance_eval("@armor#{i}_id")
        i += 1
      end
      return equipment
    end
    #-------------------------------------------------------------------------
    #   Name      : Get Equipment
    #   Info      : Gets All Actor's Equipment
    #               A Hash in this form {'weapons' => ids, 'armors' => ids}
    #   Author    : Trickster
    #   Call Info : No Arguments
    #   Comment   : Must Follow Naming Conventions weapon#{n}_id armor#{n}_id
    #-------------------------------------------------------------------------
    def equipment
      @equipment = {'weapons' => [], 'armors' => []}
      @equipment['weapons'].push(@weapon_id)
      i = 1
      while instance_eval("@weapon#{i}_id") != nil
        @equipment['weapons'].push(instance_eval("@weapon#{i}_id"))
        i += 1
      end
      i = 1
      while instance_eval("@armor#{i}_id") != nil
        @equipment['armors'].push(instance_eval("@armor#{i}_id"))
        i += 1
      end
      return @equipment
    end
    #-------------------------------------------------------------------------
    # * Name      : Element Test
    #   Info      : Returns Element Effiency Value
    #               An Integer 1-6 representing the effiency
    #   Author    : Trickster
    #   Call Info : One Argument Element_Id the element Id to test
    #-------------------------------------------------------------------------
    def element_test(element_id)
      # Get a numerical value corresponding to element effectiveness
      table = [0,6,5,4,3,2,1]
      result = table[$data_classes[@class_id].element_ranks[element_id]]
      return result
    end
    #-------------------------------------------------------------------------
    # * Name      : Weaknesses
    #   Info      : Returns Enemy Weaknesses
    #               An Array of Element Ids for which an A or B effiency
    #   Author    : Trickster
    #   Call Info : None
    #-------------------------------------------------------------------------
    def weaknesses
      weak = []
      MACL::Real_Elements.each {|i| weak << i if [6,5].include?(element_test(i))}
      return weak
    end
    #-------------------------------------------------------------------------
    # * Name      : Resistance
    #   Info      : Returns Enemy Resistance
    #               An Array of Element Ids for which an D, E, or F effiency
    #   Author    : Trickster
    #   Call Info : None
    #-------------------------------------------------------------------------
    def resistance
      resists = []
      MACL::Real_Elements.each {|i| resists << i if [1,2,3].include?(element_test(i))}
      return resists
    end
    #-------------------------------------------------------------------------
    # * Name      : Next Exp Percent
    #   Info      : Returns Exp Percent
    #   Author    : SephirothSpawn
    #   Call Info : Two Arguments
    #               Integer truth, true for integer, false for float
    #               Float points, integer value for number of float points
    #-------------------------------------------------------------------------
    def next_exp_percent(integer = false, float_points = 2)
      lst = @exp_list[@level] > 0     ? @exp_list[@level]     : 0
      nxt = @exp_list[@level + 1] > 0 ? @exp_list[@level + 1] : 0
      rst = nxt - @exp
      begin
        n = 100 - (rst.to_f / (nxt - lst) * 100)
        return integer ? Integer(n) : n.float_points(float_points)
      rescue
        return 100
      end
    end
  end
  
  #==============================================================================
  # ** Game_Party
  #==============================================================================
  
  class Game_Party
    #-------------------------------------------------------------------------
    # * Name      : Equipped Weapon?
    #   Info      : Does Someone in the party have Weapon Equipped
    #               returns true if condition fulfilled false otherwise
    #   Author    : Trickster
    #   Call Info : One Argument - Integer Weapon Id
    #-------------------------------------------------------------------------
    def equipped_weapon?(weapon_id)
      # Run through each actor and return if if weapon equipped
      @actors.each {|actor| return true if actor.weapon_ids.include?(weapon_id)}
      # Don't have it equipped
      return false
    end
    #-------------------------------------------------------------------------
    # * Name      : Equipped Armor?
    #   Info      : Does Soeme in the party have Armor Eqipped
    #               returns true if condition fulfilled false otherwise
    #   Author    : Trickster
    #   Call Info : One Argument - Integer Armor Id
    #-------------------------------------------------------------------------
    def equipped_armor?(armor_id)
      # Run through each actor and return if if weapon equipped
      @actors.each {|actor| return true if actor.armor_ids.include?(armor_id)}
      # Don't have it equipped
      return false
    end
    #-------------------------------------------------------------------------
    # * Name      : Has Actors?
    #   Info      : Are These Actor Ids in party?
    #               returns true if those actors are in the party
    #   Author    : Trickster
    #   Call Info : Variable Amount Integer Actor actor id to check
    #-------------------------------------------------------------------------
    def has_actors?(*actors)
      # Setup Array
      actor_ids = []
      # Get All Actor IDs
      @actors.each {|actor| actor_ids << actor.id}
      # If All Actors included
      return actor_ids.includes?(*actors)
    end
    #-------------------------------------------------------------------------
    #   Name      : Strongest Actor in Party
    #   Info      : Gets Strongest Actor
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def strongest
      array = actors.dup
      array.sort! {|a,b| b.hp - a.hp}
      return array[0]
    end
    #-------------------------------------------------------------------------
    #   Name      : Weakest Actor in Party
    #   Info      : Gets Weakest Actor
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def weakest
      array = existing_actors
      array.sort! {|a,b| b.hp - a.hp}
      return array[-1]
    end
    #-------------------------------------------------------------------------
    #   Name      : Get Existing Actors
    #   Info      : Gets All Non-Dead Actors
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def existing_actors
      array = []
      @actors.each {|actor| array << actor if actor.exist?}
      return array
    end
    #-------------------------------------------------------------------------
    # * Name      : Average Level
    #   Info      : Returns the Average Level of Party
    #   Author    : Trickster
    #   Call Info : None
    #-------------------------------------------------------------------------
    def average_level
      # Return 0 If 0 members are in the party
      return 0 if @actors.size == 0
      # Initialize local variable sum
      sum = 0
      # Sum Up Values in Array
      @actors.each {|actor| sum += actor.level}
      # Return Average
      return sum / @actors.size
    end
  end
  
  #============================================================================== 
  # ** RGSS.Battle
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # These set of methods specialized in the Spriteset & Scene for battle.
  #  
  # Method List:
  # ------------
  #
  #   Spriteset_Battle
  #   ----------------
  #   enemy_sprites
  #   actor_sprites
  #   find_battler
  #
  #   Scene_Battle
  #   ------------
  #   active_battler
  #   priority
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Battle'
  
  #==============================================================================
  # ** Spriteset_Battle
  #==============================================================================
  
  class Spriteset_Battle
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader :enemy_sprites
    attr_reader :actor_sprites
    #-------------------------------------------------------------------------
    #   Name      : Find Sprite Battler
    #   Info      : Returns Sprite_Battler object if found else nil
    #   Author    : Trickster
    #   Call Info : One Argument, Game_Battler batter battler to search
    #-------------------------------------------------------------------------
    def find_battler(battler)
      # Run Through Each Sprite
      (@actor_sprites + @enemy_sprites).each do |sprite|
        # Return sprite if same battler
        return sprite if sprite.battler == battler
      end
      # Return nil
      return nil
    end
  end
  
  #==============================================================================
  # ** Scene_Battle
  #==============================================================================
  
  class Scene_Battle
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader :active_battler
    #-------------------------------------------------------------------------
    #   Name      : Update Priority
    #   Info      : Priority Update Rate
    #   Author    : Trickster
    #   Call Info : One Argument Integer rating the rating of updating
    #   Comment   : Allows for easier aliasing of update_phase3
    #-------------------------------------------------------------------------
    def priority(rating = 0)
      flag = true
      flag &&= @enemy_arrow == nil if rating < 5
      flag &&= @actor_arrow == nil if rating < 4
      flag &&= @skill_window == nil if rating < 3
      flag &&= @item_window == nil if rating < 2
      flag &&= !@actor_command_window.active if rating < 1
      return flag
    end
  end
  
  #============================================================================== 
  # ** RGSS.Bitmap.draw
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Methods created for the Bitmap class that handle general drawing functions.
  # Functions include drawing parts of bitmaps and drawing stretched bitmaps.
  #  
  # Method List:
  # ------------
  # Bitmap.default_blur_settings=
  # Bitmap.default_blur_settings
  # Bitmap.default_anim_sprite_settings=
  # Bitmap.default_anim_sprite_settings
  # blur_settings=
  # blur_settings
  # anim_sprite_settings=
  # anim_sprite_settings
  # draw_char_bar
  # draw_line
  # draw_box
  # draw_circle
  # draw_ellipse
  # draw_polygon
  # draw_gradient_polygon
  # draw_anim_sprite
  # draw_sprite
  # draw_equipment
  # crop_blt
  # fit_blt
  # full_blt
  # full_fill
  # scale_blt
  # shade_section
  # shade_gradient_section
  #
  # Modified Methods:
  # -----------------
  # initialize
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Bitmap.draw'
  
  #==============================================================================
  # ** Bitmap
  #==============================================================================
  
  class Bitmap
    #--------------------------------------------------------------------------
    # * Class Variable Declaration
    #--------------------------------------------------------------------------
    class_accessor :default_blur_settings
    class_accessor :default_anim_sprite_settings
    #--------------------------------------------------------------------------
    # * Class Variable Declaration
    #--------------------------------------------------------------------------
    Bitmap.default_blur_settings        = Blur_Settings
    Bitmap.default_anim_sprite_settings = Anim_Sprite_Settings
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :blur_settings
    attr_accessor :anim_sprite_settings
    #--------------------------------------------------------------------------
    # * Alias Method
    #--------------------------------------------------------------------------
    alias_method :macl_bitmapdraw_init, :initialize
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(*args)
      # Set draw settings
      @blur_settings        = Bitmap.default_blur_settings
      @anim_sprite_settings = Bitmap.default_anim_sprite_settings
      # Original Initialization
      macl_bitmapdraw_init(*args)
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Char Bar
    #   Info      : Draws a Character Bar
    #   Author    : Trickster
    #   Call Info : Integer X, Y - Defines Position
    #               Integer Min, Max - Defines How filled the bar is
    #               Integer Width and height - Defines Dimensions
    #               String Start Content and Finish
    #-------------------------------------------------------------------------
    def draw_char_bar(x, y, min = 1, max = 1, width = nil, height = 32, start = '[',
      content = '¦', finish = ']', color = Color.new(255, 255, 255))
      # Get Width if width is nil
      width = text_size(start + (content * max) + finish).width if width == nil
      # save color
      saved = font.color
      # Set color
      self.font.color = color
      # Get Bar Text
      bar_text = start + content * min.to_i
      # Draw Bar Text
      draw_text(x, y, width, height, bar_text)
      # Draw Finish
      draw_text(x, y, width, height, finish, 2)
      # Restore Color
      self.font.color = saved
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Line
    #   Info      : Draws a line from x1,y1 to x2,y2
    #   Author    : Caesar (Rewrote By Trickster)
    #   Call Info : Integer x1, y1, x2, y2 - Points of the line
    #               Integer width - Thickness of the line
    #               Color color - Color of the line
    #   Comments  : uses the Digital Differential Analyzer Algorithm
    #-------------------------------------------------------------------------
    def draw_line(x1, y1, x2, y2, width = 1, color = Color.new(255, 255, 255))
      # Return if width is less than or 0
      return if width <= 0
      # Reverse all parameters sent if 2 x is less than the first x
      x1, x2, y1, y2 = x2, x1, y2, y1 if x2 < x1    
      # Get S (1/2 width)
      s = width / 2.0
      # If X Coordinates are equal
      if x1 == x2
        # Draw Vertical line
        fill_rect(x1 - s, [y1, y2].min, width, (y2 - y1).abs, color) 
      # If Y Coordinates are equal
      elsif y1 == y2
        # Draw Horizontal line
        fill_rect(x1, y1 - s, x2 - x1, width, color) 
      end
      # Get Length
      length = x2 - x1 < (y2 - y1).abs ? (y2 - y1).abs : x2 - x1
      # Get Increments
      x_increment, y_increment = (x2 - x1) / length.to_f, (y2 - y1) / length.to_f
      # Get Current X and Y
      x, y = x1, y1
      # While Current X is less than end X
      while x < x2
        # Draw Box of width width and width height 
        fill_rect(x-s, y-s, width, width, color)
        # Increment X and Y
        x += x_increment
        y += y_increment
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Box
    #   Info      : Draws a Box
    #   Author    : Trickster
    #   Call Info : Two to Four Arguments Rect Outer Rectangle to Draw Box
    #               Color color color to draw the box in
    #-------------------------------------------------------------------------
    def draw_box(outer, color, width = 1, height = 1)
      fill_rect(outer, color)
      inner = Rect.new(outer.x + width, outer.y + height, outer.width - width * 2, 
      outer.height - height * 2)
      fill_rect(inner, Color.new(0, 0, 0, 0))
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Circle
    #   Info      : Draws A Circle
    #   Author    : SephirothSpawn
    #   Call Info : Integer X and Y Define Position Center Pt of Circle
    #               Integer Radius Radius of the Circle to Draw
    #               Color color Color of the circle to draw
    #-------------------------------------------------------------------------
    def draw_circle(x, y, radius, color = Color.new(255, 255, 255, 255))
      # Starts From Left
      for i in (x - radius)..(x + radius)
        # Finds Distance From Center
        sa = (x - i).abs
        # Finds X Position
        x_ = i < x ? x - sa : i == x ? x : x + sa
        # Finds Top Vertical Portion
        y_ = Integer((radius ** 2 - sa ** 2) ** 0.5)
        # Draws Vertical Bar
        self.fill_rect(x_, y - y_, 1, y_ * 2, color)
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Ellipse
    #   Info      : Draws a Ellispse
    #   Author    : SephirothSpawn
    #   Call Info : Four or Five Arguments
    #               Four Arguments: x, y, a, b
    #                 x the center position of circle
    #                 y the center position of circle
    #                 a the distance from center to right side
    #                 b the distance from center to top side
    #               Five Arguments: (as above) + color
    #                 color the color of the circle drawn (defaults to white)
    #-------------------------------------------------------------------------
    def draw_ellipse(x, y, a, b, color = Color.new(255, 255, 255))
      # Converts Each Argument to Float
      x, y, a, b = x.to_f, y.to_f, a.to_f, b.to_f
      # Gets Square of a and b values
      a2, b2 = a * a, b * b
      # If a is smaller or equal to b
      if a <= b
        # Draws Center Line
        self.fill_rect(x, y - b, 1, b * 2, color)
        # Pass from center to right side
        for i in 1..a
          # Gets Y Distance
          y_ = Integer(Math.sqrt(b2 * (1 - (i ** 2) / a2)))
          # Draws Lines on Each Side
          self.fill_rect(x - i, y - y_, 1, y_ * 2, color)
          self.fill_rect(x + i, y - y_, 1, y_ * 2, color)
        end
      # If b is smaller than b
      else
        # Draws Center Line
        self.fill_rect(x - a, y, a * 2, 1, color)
        # Pass from center to right side
        for i in 1..b
          # Gets X Distance
          x_ = Integer(Math.sqrt(a2 * (1 - i ** 2 / b2)))
          # Draws Lines on Top & Bottom
          self.fill_rect(x - x_, y - i, x_ * 2, 1, color)
          self.fill_rect(x - x_, y + i, x_ * 2, 1, color)
        end
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Polygon
    #   Info      : Draws a Polygon 
    #   Author    : Caesar (Rewrote By Trickster)
    #   Call Info : Array vertices - Points of the polygon
    #               Integer width - Thickness of the lines
    #               Color color - color to draw it in
    #               Boolean filled - false outline true filled
    #               Integer step - fill steps
    #   Comments  : Example of vertices setup [[30, 80], [80, 80], [30, 60]]
    #-------------------------------------------------------------------------
    def draw_polygon(vertices, stroke = 1, color = Color.new(255, 255, 255),
      filled = false, step = 1)
      # Return if no width or not enough points
      return if stroke <= 0 or vertices.size <= 2
      # Get Count
      count = vertices.size
      # Get Points
      x1, y1, x2, y2 = vertices[-1] + vertices[0]
      # Draw Line
      draw_line(x1, y1, x2, y2, stroke, color)
      # Shade if filled
      shade_section(cx, cy, x1, y1, x2, y2, stroke, step, color) if filled
      # Run Through with next
      vertices.each_with_next do |start, point|
        # Get Points
        x1, y1, x2, y2 = start + point
        # Draw Line
        draw_line(x1, y1, x2, y2, stroke, color)
        # Shade if filled
        shade_section(cx, cy, x1, y1, x2, y2, stroke, step, color) if filled
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Gradient Polygon
    #   Info      : Draws a Gradient Polygon  (Filled)
    #   Author    : Caesar (Rewrote By Trickster)
    #   Call Info : Array vertices - Points of the polygon
    #               Integer width - Thickness of the lines
    #               Color color - color to draw it in
    #               Boolean filled - false outline true filled
    #               Integer step - fill steps
    #   Comments  : Example of vertices setup [[30, 80], [80, 80], [30, 60]]
    #-------------------------------------------------------------------------
    def draw_gradient_polygon(cx, cy, vertices, stroke = 1, 
      start_color = Color.new(255, 255, 255), end_color = Color.new(0, 0, 0),
      step = 1)
      # Return if no width or not enough points
      return if stroke <= 0 or vertices.size <= 2
      # Get Count
      count = vertices.size
      # Get Points
      x1, y1, x2, y2 = vertices[-1] + vertices[0]
      # Draw Line
      draw_line(x1, y1, x2, y2, stroke, end_color)
      shade_gradient_section(cx, cy, x1, y1, x2, y2, 2, 1, start_color, end_color)
      # Run Through with next
      vertices.each_with_next do |start, point|
        # Get Points
        x1, y1, x2, y2 = start + point
        # Draw Line
        draw_line(x1, y1, x2, y2, stroke, end_color)
        shade_gradient_section(cx, cy, x1, y1, x2, y2, 1, 0.4, start_color, end_color)
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Animated Sprite
    #   Info      : Draws an Animated Sprite
    #   Author    : SephirothSpawn
    #   Call Info : Six to Seven Arguments Integer x and y Defines Position
    #               Integer W and H Defines Dimensions
    #               String name Character Set Graphic
    #               Integer hue sets hue displacement
    #               Integer stance pose for character
    #-------------------------------------------------------------------------
    def draw_anim_sprite(x, y, w, h, name, hue, stance = 0)
      # Gets Frame
      frame = (Graphics.frame_count / @anim_sprite_settings['f']) % 
              @anim_sprite_settings['w']
      # Draw Sprite
      draw_sprite(x, y, w, h, name, hue, stance, frame)
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Sprite
    #   Info      : Draws an Animated Sprite
    #   Author    : SephirothSpawn
    #   Call Info : Six to Seven Arguments Integer x and y Defines Position
    #               Integer W and H Defines Dimensions
    #               String name Character Set Graphic
    #               Integer hue sets hue displacement
    #               Integer stance pose for character
    #               Integer frame frame of pose to show
    #-------------------------------------------------------------------------
    def draw_sprite(x, y, w, h, name, hue, stance = 0, frame = 0)
      # Gets Bitmap
      bitmap = RPG::Cache.character(name, hue)
      # Bitmap Division
      cw = bitmap.width / @anim_sprite_settings['w']
      ch = bitmap.height / @anim_sprite_settings['h']
      # Gets Animation Offsets
      x_off, y_off = cw * frame, ch * stance
      # Clears Area
      self.fill_rect(Rect.new(x, y, w, h), Color.new(0, 0, 0, 0))
      # Draws Bitmap
      self.scale_blt(Rect.new(x, y, w, h), bitmap, 
        Rect.new(x_off, y_off, cw, ch))
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Equip
    #   Info      : Draws Item or Equipment icon and name
    #   Author    : SephirothSpawn
    #   Call Info : Three to Eight Arguments
    #               Item - RPG::Item, RPG::Weapon or RPG::Armor
    #               X - Position Icon & Text Being drawn
    #               Y - Position Icon & Test Being drawn
    #               W - Width for Icon & Text to be drawn in
    #               H - Height for Icon & Text to be drawn in (24 min)
    #               A - Alignment of text
    #               T - Type of icon to be used when nil item (See MACL Setup)
    #               Txt - Text when Item is nil
    #-------------------------------------------------------------------------
    def draw_equipment(i, x, y, w = 212, h = 32, a = 0, t = 0, txt = 'Nothing')
      # If Nil Item
      if i.nil?
        # Gets Unequipped Bitmap & Font Color
        bitmap = RPG::Cache.icon(Draw_Equipment_Icon_Settings[t])
        c = Color.disabled
      # If Item Exist
      else
        # Gets Bitmap, Font Color & Item Name
        bitmap = RPG::Cache.icon(i.icon_name)
        c, txt = Color.normal, i.name
      end
      # Sets Font Color, Draws Icon & Text
      old_color = self.font.color.dup
      self.blt(x + 4, y + (h - 24) / 2, bitmap, bitmap.rect, c.alpha)
      self.font.color = c
      self.draw_text(x + 32, y, w - 28, h, txt, a)
      self.font.color = old_color
    end
    #-------------------------------------------------------------------------
    # * Name      : Crop BLT
    #   Info      : Crops to Width and Height, if needed
    #   Author    : Trickster
    #   Call Info : Five - Eight Arguments, Integer X and Y Define Position
    #               Integer Width and Height Defines Dimensions
    #               Bitmap bitmap bitmap to transfer
    #               Integer dir, part to crop
    #               Integer align, alignment (0:left, 1:center, 2:right)
    #               Integer opacity, opacity
    #-------------------------------------------------------------------------
    def crop_blt(x, y, width, height, bitmap, dir = 1, align = 1, opacity = 255)
      # Get Width and Height
      w, h = bitmap.width, bitmap.height
      # If Can Fit
      if w < width and h < height
        # Branch By alignment
        case align
        when 1
          # Add To Make it in the center
          x += (width - w) / 2
        when 2
          # Add to Make it in the right
          x += width - w
        end
        # Draw Bitmap
        full_blt(x, y, bitmap, opacity)
        # Return
        return
      end
      # Get I and J (Position)
      i, j = dir % 3, dir / 3
      # Initialize Crop X and Crop Y (Left Top Align)
      crop_x, crop_y = 0, 0
      # Branch by Horizontal Position
      case i
      when 1
        # Center Align
        crop_x = (w - width) / 2
      when 2
        # Right Align
        crop_x = w - width
      end
      # Branch by Vertical Position
      case j
      when 1
        # Center Align
        crop_y = (h - height) / 2
      when 2
        # Bottom Align
        crop_y = h - height
      end
      # Draw Bitmap Cropped
      blt(x, y, bitmap, Rect.new(crop_x, crop_y, width, height), opacity)
    end
    #-------------------------------------------------------------------------
    # * Name      : Fit BLT
    #   Info      : Zooms to Width and Height, if needed
    #   Author    : Trickster
    #   Call Info : Five-Seven Arguments, Integer X and Y Define Position
    #               Integer Width and Height Defines Dimensions
    #               Bitmap bitmap bitmap to transfer
    #               Integer opacity, opacity
    #               Integer Align, Alignment
    #-------------------------------------------------------------------------
    def fit_blt(x, y, width, height, bitmap, opacity = 255, align = 1)
      # Get Width and Height
      w, h = bitmap.width, bitmap.height
      # If Width or Height is Greater
      if w > width or h > height
        # Get Conversion
        conversion = w / h.to_f
        # if Conversion is smaller than or 1
        if conversion <= 1
          # Get Zoom X and Y
          zoom_x, zoom_y = width * conversion, height
        else
          # Get Zoom X and Y
          zoom_x, zoom_y = width, height / conversion
        end
        # Branch By Align
        case align
        when 1
          # Add To Make it in the center
          x += (width - zoom_x) / 2
        when 2
          # Add to Make it in the right
          x += width - zoom_x
        end
        # Get Destination Rect
        dest_rect = Rect.new(x, y, zoom_x, zoom_y)
        # Stretch to Fit
        stretch_blt(dest_rect, bitmap, bitmap.rect, opacity)
      else
        # Branch By alignment
        case align
        when 1
          # Add To Make it in the center
          x += (width - w) / 2
        when 2
          # Add to Make it in the right
          x += width - w
        end
        # Draw Bitmap
        full_blt(x, y, bitmap, opacity)
      end
    end
    #-------------------------------------------------------------------------
    #   Name      : Full Block Transfer
    #   Info      : Draws a Bitmap
    #   Author    : Trickster
    #   Call Info : Three or Four Arguments
    #               Integer X and Y define position
    #               Bitmap bitmap is the bitmap to draw
    #               Integer Opacity is the transparency (defaults to 255)
    #   Comment   : Lazy method for people who don't want to type bitmap.rect
    #-------------------------------------------------------------------------
    def full_blt(x, y, bitmap, opacity = 255)
      blt(x, y, bitmap, bitmap.rect, opacity)
    end
    #-------------------------------------------------------------------------
    #   Name      : Full Fill
    #   Info      : Fills Whole Bitmap
    #   Author    : Trickster
    #   Call Info : One Argument, Color color the color to be filled
    #   Comment   : Lazy method for people who don't want to type bitmap.rect
    #-------------------------------------------------------------------------
    def full_fill(color)
      fill_rect(rect, color)
    end
    #-------------------------------------------------------------------------
    # * Name      : Scale BLT
    #   Info      : Scales Bitmap to fit Rectangle
    #   Author    : SephirothSpawn
    #   Call Info : Two to Four Arguments
    #               Rect Dest_Rect - Destination Rectangle
    #               Bitmap Src_Bitmap - Source Bitmap
    #               Rect Src_Rect - Source Rectangle for Bitmap
    #               Integer Opacity - Opacity
    #-------------------------------------------------------------------------
    def scale_blt(dest_rect, src_bitmap, src_rect = src_bitmap.rect, o = 255)
      w, h = src_rect.width, src_rect.height
      scale = [w / dest_rect.width.to_f, h / dest_rect.height.to_f].max
      ow, oh = (w / scale).to_i, (h / scale).to_i
      ox, oy = (dest_rect.width - ow) / 2, (dest_rect.height - oh) / 2
      stretch_blt(Rect.new(ox + dest_rect.x, oy + dest_rect.y, ow, oh), 
        src_bitmap, src_rect, o)
    end
    #-------------------------------------------------------------------------
    # * Name      : Shade Section
    #   Info      : Shades a section from (cx,cy), (x1,y1), (x2,y2)
    #   Author    : Trickster
    #   Call Info : Six to Nine Arguments
    #               Integer cx, cy, x1, y1, x2, y2 - Points
    #               Integer Thick - Line Thickness
    #               Integer Step - how many lines to draw (lower = higher accuracy)
    #               Color color - color to shade in
    #-------------------------------------------------------------------------
    def shade_section(cx, cy, x1, y1, x2, y2, thick = 1, step = 1, 
        color = Color.new(255, 255, 255))
      # Reverse all parameters sent if 2 x is less than the first x
      x1, x2, y1, y2 = x2, x1, y2, y1 if x2 < x1    
      # Get Slope
      slope = (y2 - y1).to_f / (x2 - x1)
      # If Slope is infinite
      if slope.infinite?
        y1.step(y2, step) {|y| draw_line(cx, cy, x1, y, thick, color)}
      # If Slope is zero
      elsif slope.zero?
        x1.step(x2, step) {|x| draw_line(cx, cy, x, y1, thick, color)}
      elsif not slope.nan?
        # Get Y intercept
        yint = y1 - slope * x1
        x1.step(x2, step) {|x| draw_line(cx, cy, x, slope * x + yint, thick, color)}
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Shade Gradient Section
    #   Info      : Shades a section from (cx,cy), (x1,y1), (x2,y2) w/ gradient
    #   Author    : Trickster
    #   Call Info : Six to Ten Arguments
    #               Integer cx, cy, x1, y1, x2, y2 - Points
    #               Integer Thick - Line Thickness
    #               Integer Step - how many lines to draw (lower = higher accuracy)
    #               Color start_color, end_color - Start and end colors
    #-------------------------------------------------------------------------
    def shade_gradient_section(cx, cy, x1, y1, x2, y2, thick = 1, step = 1,
      start_color = Color.new(0, 0, 0), end_color = start_color)
      # Reverse all parameters sent if 2 x is less than the first x
      x1, x2, y1, y2 = x2, x1, y2, y1 if x2 < x1    
      # Get Slope
      slope = (y2 - y1).to_f / (x2 - x1)
      # If Slope is infinite
      if slope.infinite?
        y1.step(y2, step) {|y| draw_gradient_line(cx, cy, x1, y, thick, start_color, end_color)}
      # If Slope is zero
      elsif slope.zero?
        x1.step(x2, step) {|x| draw_gradient_line(cx, cy, x, y1, thick, start_color, end_color)}
      elsif not slope.nan?
        # Get Y intercept
        yint = y1 - slope * x1
        x1.step(x2, step) {|x| draw_gradient_line(cx, cy, x, slope * x + yint, thick, start_color, end_color)}
      end
    end
  end
  
  #============================================================================== 
  # ** RGSS.Bitmap.gradient
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Methods created for the Bitmap class that draws different types of gradient 
  # bars and other things some gradients from colors and others from images.
  #  
  # Method List:
  # ------------
  # draw_gradient_line
  # draw_meter_line
  # draw_seph_gradient_bar
  # draw_seph_rev_gradient_bar
  # draw_slant_bar
  # draw_rev_slant_bar
  # draw_trick_circular_bar
  # draw_trick_rev_cirular_bar
  # draw_seph_v_gradient_bar
  # draw_seph_v_rev_gradient_bar
  # draw_v_slant_bar
  # draw_v_rev_slant_bar
  # draw_trick_v_circular_bar
  # draw_trick_v_rev_circular_bar
  # draw_cw_arc_region
  # draw_ccw_arc_region
  # draw_cw_grad_arc_region
  # draw_ccw_grad_arc_region
  # draw_trick_function_bar
  # draw_trick_gradient_bar
  # draw_trick_gradient_bar_back
  # draw_trick_gradient_bar_sub
  # shade_gradient_section
  # v_gradient_pixel_change
  # h_gradient_pixel_change
  #  
  # Deprecated Stuff (V 2.0):
  # -------------------------
  # trick_draw_gradient_bar_circ
  # trick_draw_gradient_bar_func
  #  
  # Renamed Stuff (V 2.0):
  # ----------------------
  # trick_draw_circular_bar -> draw_trick_circular_bar
  # trick_draw_function_bar -> draw_trick_function_bar
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Bitmap.gradient'
  
  #==============================================================================
  # ** Bitmap
  #==============================================================================
  
  class Bitmap
    #-------------------------------------------------------------------------
    # * Name      : Draw Gradient Line
    #   Info      : Draws a Gradient Line From (x, y) to (x1, y1) of a thickness
    #   Author    : RXS (Edited by Trickster)
    #   Call Info : Four to Seven Arguments
    #               Integer start_x, start_y, end_x, end_y - Defines Position
    #               Integer thick - thickness of the line
    #               Color start_color and end_color Colors for the line
    #-------------------------------------------------------------------------
    def draw_gradient_line(start_x, start_y, end_x, end_y, width = 1, 
      start_color = Color.new(0, 0, 0), end_color = start_color)
      # Get Distance
      distance = (start_x - end_x).abs + (start_y - end_y).abs
      # If Same Color
      if end_color == start_color
        # Run Through from 1 to distance
        (1..distance).each do |i|
          # Get X and Y
          x = (start_x + (end_x.to_f - start_x) * i / distance).to_i
          y = (start_y + (end_y.to_f - start_y) * i / distance).to_i
          # Fill Rectangle
          fill_rect(x, y, width, width, start_color)
        end
      # Different Colors
      else
        # Run Through from 1 to distance
        (1..distance).each do |i|
          # Get Percent Disance and I Distance
          per_dist, i_dist = (distance - i.to_f) / distance, i.to_f / distance
          # Get Position
          x = (start_x + (end_x.to_f - start_x) * i_dist).to_i
          y = (start_y + (end_y.to_f - start_y) * i_dist).to_i
          # Get Color Information
          r = start_color.red * per_dist + end_color.red * i_dist
          g = start_color.green * per_dist + end_color.green * i_dist
          b = start_color.blue * per_dist + end_color.blue * i_dist
          a = start_color.alpha * per_dist + end_color.alpha * i_dist
          # Fill Rectangle
          fill_rect(x, y, width, width, Color.new(r, g, b, a))
        end
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Meter Line
    #   Info      : Draws a Slanted Gradient Bar
    #   Author    : XRXS Edited By Trickster
    #   Call Info : Four to Nine Arguments Integer x and y Define Position
    #               Integer min and max define percentage of bar's fill
    #               Integer width and height defines dimensions
    #               Color bar_start bar_end and background Defines Colors for bar
    #-------------------------------------------------------------------------
    def draw_meter_line(x, y, min, max, width = 156, height = 4, 
      bar_start = Color.new(255, 0, 0, 192), bar_end = Color.new(255, 255, 0, 192),
      background = Color.new(0, 0, 0, 128))
      # Get Fill Width
      w = width * min / max
      # Do Four Times
      4.times do
        # Draws Background
        fill_rect(x + 8, y + 4, width, height / 4, background)
        # Draw Gradient Line
        draw_gradient_line(x, y, x + w, y, height / 4, bar_start, bar_end)
        # Decrement X
        x -= 1
        # Increment Y by height / 4
        y += height / 4
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Gradient Bar
    #   Info      : Draws a Gradient Bar
    #   Author    : SephirothSpawn
    #   Call Info : Four to Nince Arguments
    #               Integer x and y Defines Position
    #               Integer min and max Defines Dimensions of Bar
    #               Start Bar Color and End Color - Colors for Gradient Bar
    #               Background Bar Color
    #-------------------------------------------------------------------------
    def draw_seph_gradient_bar(x, y, cur, max, width = 152, height = 8,
        s_color = Color.red, e_color = Color.yellow, b_color = Color.black)
      # Draw Border
      self.fill_rect(x, y, width, height, b_color)
      # Draws Bar
      for i in 1...((cur / max.to_f) * (width - 1))
        c = Color.color_between(s_color, e_color, (i / width.to_f))
        self.fill_rect(x + i, y + 1, 1, height - 2, c)
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Reverse Gradient Bar
    #   Info      : Draws a Gradient Bar
    #   Author    : SephirothSpawn
    #   Call Info : Four to Nine Arguments
    #               Integer x and y Defines Position
    #               Integer min and max Defines Dimensions of Bar
    #               Start Bar Color and End Color - Colors for Gradient Bar
    #               Background Bar Color
    #-------------------------------------------------------------------------
    def draw_seph_rev_gradient_bar(x, y, cur, max, width = 152, height = 8,
        s_color = Color.red, e_color = Color.yellow, b_color = Color.black)
      # Draw Border
      self.fill_rect(x, y, width, height, b_color)
      # Draws Bar
      for i in 1...((cur / max.to_f) * (width - 1))
        c = Color.color_between(s_color, e_color, (i / width.to_f))
        self.fill_rect(x + width - 1 - i, y + 1, 1, height - 2, c)
      end
    end  
    #-------------------------------------------------------------------------
    # * Name      : Draw Slant Bar
    #   Info      : Draws a slanted Gradient Bar
    #   Author    : SephirothSpawn
    #   Call Info : Four to Nine Arguments
    #               Integer x and y Defines Position
    #               Integer min and max Defines Dimensions of Bar
    #               Start Bar Color and End Color - Colors for Gradient Bar
    #               Background Bar Color
    #-------------------------------------------------------------------------
    def draw_slant_bar(x, y, cur, max, width = 152, height = 8,
        s_color = Color.red, e_color = Color.yellow, b_color = Color.black)
      # Draw Border
      for i in 0..height
        self.fill_rect(x + i, y + height - i, width - height, 1, b_color)
      end
      # Draws Bar
      for i in 1...((cur / max.to_f) * (width - height - 1))
        for j in 1...(height)
          c = Color.color_between(s_color, e_color, (i / width.to_f))
          self.fill_rect(x + i + j, y + height - j, 1, 1, c)
        end
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Reverse Slant Bar
    #   Info      : Draws a slanted Gradient Bar
    #   Author    : SephirothSpawn
    #   Call Info : Four to Nine Arguments
    #               Integer x and y Defines Position
    #               Integer min and max Defines Dimensions of Bar
    #               Start Bar Color and End Color - Colors for Gradient Bar
    #               Background Bar Color
    #-------------------------------------------------------------------------
    def draw_rev_slant_bar(x, y, cur, max, width = 152, height = 8,
        s_color = Color.red, e_color = Color.yellow, b_color = Color.black)
      # Draw Border
      for i in 0..height
        self.fill_rect(x + i, y + height - i, width - height, 1, b_color)
      end
      # Draws Bar
      for i in 1...((cur / max.to_f) * (width - height - 1))
        for j in 1...(height)
          c = Color.color_between(s_color, e_color, (i / width.to_f))
          self.fill_rect(x + width - 1 - i - j, y + j, 1, 1, c)
        end
      end
    end
    #-------------------------------------------------------------------------
    #   Name      : Draw Circular Gradient Bar
    #   Info      : Draws a Circular Gradient Bar
    #   Author    : Trickster
    #   Call Info : Six to Nine Arguments 
    #               Integer X, Y, Width, Height, Current, and Max
    #               Color start, finish, back all default to Black
    #               X and Y Define Position
    #               Width and Height defines dimensions
    #               Current Defines How Much of the Bar to Draw
    #               Max Defines the Maximum Value
    #               start, finish, back is the starting, ending, and back color
    #-------------------------------------------------------------------------
    def draw_trick_circular_bar(x, y, width, height, current, max, 
        start = Color.red, finish = Color.yellow, back = Color.black)
      # Draw Background
      radius = height / 2
      # Draw Rectangle Center
      fill_rect(x + radius, y, width - height, height, back) 
      # Draws Ends
      (radius + 1).times do |x1|
        # Get Y
        y1 = Math.sqrt(radius ** 2 - (radius - x1) ** 2).round
        # Draw Line of Back Color at Left Edge
        fill_rect(x + x1, y - y1 + radius, 1, 2 * y1, back)
        # Draw Line of Back Color at Right Edge
        fill_rect(x + width - x1, y - y1 + radius, 1, 2 * y1, back)
      end
      # Get Percentage
      percentage = current / max.to_f
      # Return if not a finite number
      return if not percentage.finite?
      # Decrease Width and Height increase x and y
      x, y, width, height = x + 2, y + 2, width - 4, height - 4
      # Get new Radius
      radius = height / 2
      # Get Bar Width
      barwidth = width * percentage
      # Draws Left End
      (radius + 1).times do |x1|
        # Stop if Past Width
        break if x1 > barwidth
        # Get Y
        y1 = Math.sqrt(radius ** 2 - (radius - x1) ** 2).round
        # Get Color
        color = Color.color_between(start, finish, (x1 / width.to_f))
        # Draw Line
        fill_rect(x + x1, y - y1 + radius, 1, 2 * y1, color)
      end
      # Run From Radius upto Rectangles End
      (width - height + 1).times do |t|
        # Get X1
        x1 = t + radius
        # Break if Past Width
        break if x1 > barwidth
        # Get Color
        color = Color.color_between(start, finish, (x1 / width.to_f))
        # Draw Line
        fill_rect(x + x1, y, 1, height, color)
      end
      # Draws Right End
      radius.times do |t|
        # Get X
        x1 = width - radius + t
        # Stop if Past Width
        break if x1 > barwidth
        # Get Y
        y1 = Math.sqrt(radius ** 2 - t ** 2).round
        # Get Color
        color = Color.color_between(start, finish, (x1 / width.to_f))
        # Draw Line
        fill_rect(x + x1, y - y1 + radius, 1, 2 * y1, color)
      end
    end
    #-------------------------------------------------------------------------
    #   Name      : Draw Reverse Circular Gradient Bar
    #   Info      : Draws a Circular Gradient Bar
    #   Author    : Trickster / SephirothSpawn
    #   Call Info : Six to Nine Arguments 
    #               Integer X, Y, Width, Height, Current, and Max
    #               Color start, finish, back all default to Black
    #               X and Y Define Position
    #               Width and Height defines dimensions
    #               Current Defines How Much of the Bar to Draw
    #               Max Defines the Maximum Value
    #               start, finish, back is the starting, ending, and back color
    #-------------------------------------------------------------------------
    def draw_trick_rev_circular_bar(x, y, width, height, current, max, 
        start = Color.red, finish = Color.yellow, back = Color.black)
      # Draw Background
      radius = height / 2
      # Draw Rectangle Center
      fill_rect(x + radius, y, width - height, height, back) 
      # Draws Ends
      (radius + 1).times do |x1|
        # Get Y
        y1 = Math.sqrt(radius ** 2 - (radius - x1) ** 2).round
        # Draw Line of Back Color at Left Edge
        fill_rect(x + x1, y - y1 + radius, 1, 2 * y1, back)
        # Draw Line of Back Color at Right Edge
        fill_rect(x + width - x1, y - y1 + radius, 1, 2 * y1, back)
      end
      # Get Percentage
      percentage = current / max.to_f
      # Return if not a finite number
      return if not percentage.finite?
      # Decrease Width and Height increase x and y
      x, y, width, height = x + 2, y + 2, width - 4, height - 4
      # Get new Radius
      radius = height / 2
      # Get Bar Width
      barwidth = width * percentage
      # Draws Left End
      (radius + 1).times do |x1|
        # Stop if Past Width
        break if x1 > barwidth
        # Get Y
        y1 = Math.sqrt(radius ** 2 - (radius - x1) ** 2).round
        # Get Color
        color = Color.color_between(start, finish, (x1 / width.to_f))
        # Draw Line
        fill_rect(x + width - x1, y - y1 + radius, 1, 2 * y1, color)
      end
      # Run From Radius upto Rectangles End
      (width - height + 1).times do |t|
        # Get X1
        x1 = t + radius
        # Break if Past Width
        break if x1 > barwidth
        # Get Color
        color = Color.color_between(start, finish, (x1 / width.to_f))
        # Draw Line
        fill_rect(x + width - x1, y, 1, height, color)
      end
      # Draws Right End
      radius.times do |t|
        # Get X
        x1 = width - radius + t
        # Stop if Past Width
        break if x1 > barwidth
        # Get Y
        y1 = Math.sqrt(radius ** 2 - t ** 2).round
        # Get Color
        color = Color.color_between(start, finish, (x1 / width.to_f))
        # Draw Line
        fill_rect(x + width - x1, y - y1 + radius, 1, 2 * y1, color)
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Vertical Gradient Bar
    #   Info      : Draws a Gradient Bar
    #   Author    : SephirothSpawn
    #   Call Info : Four to Nine Arguments
    #               Integer x and y Defines Position
    #               Integer min and max Defines Dimensions of Bar
    #               Start Bar Color and End Color - Colors for Gradient Bar
    #               Background Bar Color
    #-------------------------------------------------------------------------
    def draw_seph_v_gradient_bar(x, y, cur, max, width = 8, height = 152,
        s_color = Color.red, e_color = Color.yellow, b_color = Color.black)
      # Draw Border
      self.fill_rect(x, y, width, height, b_color)
      # Draws Bar
      for i in 1...((cur / max.to_f) * (height - 1))
        c = Color.color_between(s_color, e_color, (i / height.to_f))
        self.fill_rect(x + 1, y + i, width - 2, 1, c)
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Vertical Reverse Gradient Bar
    #   Info      : Draws a Gradient Bar
    #   Author    : SephirothSpawn
    #   Call Info : Four to Nine Arguments
    #               Integer x and y Defines Position
    #               Integer min and max Defines Dimensions of Bar
    #               Start Bar Color and End Color - Colors for Gradient Bar
    #               Background Bar Color
    #-------------------------------------------------------------------------
    def draw_seph_v_rev_gradient_bar(x, y, cur, max, width = 8, height = 152,
        s_color = Color.red, e_color = Color.yellow, b_color = Color.black)
      # Draw Border
      self.fill_rect(x, y, width, height, b_color)
      # Draws Bar
      for i in 1...((cur / max.to_f) * (height - 1))
        c = Color.color_between(s_color, e_color, (i / height.to_f))
        self.fill_rect(x + 1, y + height - 1 - i, width - 2, 1, c)
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Vertical Slant Bar
    #   Info      : Draws a slanted Gradient Bar
    #   Author    : SephirothSpawn
    #   Call Info : Four to Nice Arguments
    #               Integer x and y Defines Position
    #               Integer min and max Defines Dimensions of Bar
    #               Start Bar Color and End Color - Colors for Gradient Bar
    #               Background Bar Color
    #-------------------------------------------------------------------------
    def draw_v_slant_bar(x, y, cur, max, width = 8, height = 152,
        s_color = Color.red, e_color = Color.yellow, b_color = Color.black)
      # Draw Border
      for i in 0..width
        self.fill_rect(x + i, y + i, 1, height - width, b_color)
      end
      # Draws Bar
      for i in 1...((cur / max.to_f) * (height - width - 1))
        for j in 1...(width)
          c = Color.color_between(s_color, e_color, (i / height.to_f))
          self.fill_rect(x + j, y + i + j, 1, 1, c)
        end
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Vertical Reverse Slant Bar
    #   Info      : Draws a slanted Gradient Bar
    #   Author    : SephirothSpawn
    #   Call Info : Four to Nine Arguments
    #               Integer x and y Defines Position
    #               Integer min and max Defines Dimensions of Bar
    #               Start Bar Color and End Color - Colors for Gradient Bar
    #               Background Bar Color
    #-------------------------------------------------------------------------
    def draw_v_rev_slant_bar(x, y, cur, max, width = 8, height = 152,
        s_color = Color.red, e_color = Color.yellow, b_color = Color.black)
      # Draw Border
      for i in 0..width
        self.fill_rect(x + i, y + i, 1, height - width, b_color)
      end
      # Draws Bar
      for i in 1...( (cur / max.to_f) * (height - width - 1))
        for j in 1...(width)
          c = Color.color_between(s_color, e_color, (i / height.to_f))
          self.fill_rect(x + width - j, y + height - i - j - 1, 1, 1, c)
        end
      end
    end
    #-------------------------------------------------------------------------
    #   Name      : Draw Vertical Circular Gradient Bar
    #   Info      : Draws a Circular Gradient Bar
    #   Author    : Trickster / SephirothSpawn
    #   Call Info : Six to Nine Arguments 
    #               Integer X, Y, Width, Height, Current, and Max
    #               Color start, finish, back all default to Black
    #               X and Y Define Position
    #               Width and Height defines dimensions
    #               Current Defines How Much of the Bar to Draw
    #               Max Defines the Maximum Value
    #               start, finish, back is the starting, ending, and back color
    #-------------------------------------------------------------------------
    def draw_trick_v_circular_bar(x, y, width, height, current, max, 
        start = Color.red, finish = Color.yellow, back = Color.black)
      # Draw Background
      radius = width / 2
      # Draw Rectangle Center
      fill_rect(x, y + radius, width, height - width, back) 
      # Draws Ends
      (radius + 1).times do |y1|
        # Get X
        x1 = Math.sqrt(radius ** 2 - (radius - y1) ** 2).round
        # Draw Line of Back Color at Left Edge
        fill_rect(x - x1 + radius, y + y1, 2 * x1, 1, back)
        # Draw Line of Back Color at Right Edge
        fill_rect(x - x1 + radius, y + height - y1, 2 * x1, 1, back)
      end
      # Get Percentage
      percentage = current / max.to_f
      # Return if not a finite number
      return if not percentage.finite?
      # Decrease Width and Height increase x and y
      x, y, width, height = x + 2, y + 2, width - 4, height - 4
      # Get new Radius
      radius = width / 2
      # Get Bar Height
      barheight = height * percentage
      # Draws Top End
      (radius + 1).times do |y1|
        # Stop if Past Height
        break if y1 > barheight
        # Get T (Parameter)
        t = radius - y1
        # Get X
        x1 = Math.sqrt(radius ** 2 - t ** 2).round
        # Get Color
        color = Color.color_between(start, finish, (y1 / height.to_f))
        # Draw Line
        fill_rect(x - x1 + radius, y + y1, 2 * x1, 1, color)
      end
      # Run From Radius upto Rectangles End
      (height - width + 1).times do |t|
        # Get Y1
        y1 = t + radius
        # Break if Past Width
        break if y1 > barheight
        # Get Color
        color = Color.color_between(start, finish, (y1 / height.to_f))
        # Draw Line
        fill_rect(x, y + y1, width, 1, color)
      end
      # Draws Bottom End
      radius.times do |t|
        # Get Y
        y1 = height - radius + t
        # Get X
        x1 = Math.sqrt(radius ** 2 - t ** 2).round
        # Stop if Past Height
        break if y1 > barheight
        # Get Color
        color = Color.color_between(start, finish, (y1 / height.to_f))
        # Draw Line
        fill_rect(x - x1 + radius, y + y1, 2 * x1, 1, color)
      end
    end
    #-------------------------------------------------------------------------
    #   Name      : Draw Vertical Reverse Circular Gradient Bar
    #   Info      : Draws a Circular Gradient Bar
    #   Author    : Trickster / SephirothSpawn
    #   Call Info : Six to Nine Arguments 
    #               Integer X, Y, Width, Height, Current, and Max
    #               Color start, finish, back all default to Black
    #               X and Y Define Position
    #               Width and Height defines dimensions
    #               Current Defines How Much of the Bar to Draw
    #               Max Defines the Maximum Value
    #               start, finish, back is the starting, ending, and back color
    #-------------------------------------------------------------------------
    def draw_trick_v_rev_circular_bar(x, y, width, height, current, max, 
        start = Color.red, finish = Color.yellow, back = Color.black)
      # Draw Background
      radius = width / 2
      # Draw Rectangle Center
      fill_rect(x, y + radius, width, height - width, back) 
      # Draws Ends
      (radius + 1).times do |y1|
        # Get X
        x1 = Math.sqrt(radius ** 2 - (radius - y1) ** 2).round
        # Draw Line of Back Color at Left Edge
        fill_rect(x - x1 + radius, y + y1, 2 * x1, 1, back)
        # Draw Line of Back Color at Right Edge
        fill_rect(x - x1 + radius, y + height - y1, 2 * x1, 1, back)
      end
      # Get Percentage
      percentage = current / max.to_f
      # Return if not a finite number
      return if not percentage.finite?
      # Decrease Width and Height increase x and y
      x, y, width, height = x + 2, y + 2, width - 4, height - 4
      # Get new Radius
      radius = width / 2
      # Get Bar Height
      barheight = height * percentage
      # Draws Bottom End
      (radius + 1).times do |y1|
        # Stop if Past Height
        break if y1 > barheight
        # Get X
        x1 = Math.sqrt(radius ** 2 - (radius - y1) ** 2).round
        # Get Color
        color = Color.color_between(start, finish, (y1 / height.to_f))
        # Draw Line
        fill_rect(x - x1 + radius, y + height - y1, 2 * x1, 1, color)
      end
      # Run From Radius upto Rectangles End
      (height - width + 1).times do |t|
        # Get Y1
        y1 = t + radius
        # Break if Past Width
        break if y1 > barheight
        # Get Color
        color = Color.color_between(start, finish, (y1 / height.to_f))
        # Draw Line
        fill_rect(x, y + height - y1, width, 1, color)
      end
      # Draws Bottom End
      radius.times do |t|
        # Get Y
        y1 = radius - t
        # Stop if Past Height
        break if height - y1 > barheight
        # Get X
        x1 = Math.sqrt(radius ** 2 - t ** 2).round
        # Get Color
        color = Color.color_between(start, finish, ((height - y1) / height.to_f))
        # Draw Line
        fill_rect(x - x1 + radius, y + y1, 2 * x1, 1, color)
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Clockwise Circular Arc Region
    #   Info      : Draws Circular Gradient clockwise, from s_angle to e_angle
    #   Author    : SephirothSpawn
    #   Call Info : Eight to Nine Arguments
    #               center_x and center_y
    #               min_radius, max_radius
    #               s_angle & e_angle (in Degrees)
    #               currect_value & max_value
    #               bar_color
    #-------------------------------------------------------------------------
    def draw_cw_arc_region(x, y, min_rad, max_rad, s_angle, e_angle, 
                           cur_v, max_v, color = Color.red)
      # Calculate Inner Regions
      inner_region = {}
      for i in 0..min_rad
        y_ = Integer((min_rad ** 2 - i ** 2) ** 0.5)
        inner_region[x + i] = y_
        inner_region[x - i] = y_
      end
      # Make Degrees between 0 - 360
      s_angle %= 360 ; e_angle %= 360
      # Make s_angle Greater than e_angle
      s_angle += 360 if  s_angle < e_angle
      # Calculate Difference
      diff = s_angle - e_angle
      # Get Percent Difference
      p_diff = Integer(diff * cur_v / max_v.to_f)
      # Modify e_angle with percent Diffence
      e_angle = s_angle - p_diff
      # Pass from left to right
      for i in (x - max_rad)..(x + max_rad)
        # Get Y max at that pixel
        y_max = Integer((max_rad ** 2 - (x - i).abs ** 2) ** 0.5)
        # Pass from top to bottom
        for j in (y - y_max)..(y + y_max)
          # If within inner-region limits
          if i.between?(x - min_rad, x + min_rad)
            # If Inner region has key
            if inner_region.has_key?(i)
              # Get Inner Value
              inner = inner_region[i]
              # Skip if Between inner region limits
              next if j.between?(x - inner, x + inner)
            end
          end
          # Gets Angle of pixel from center
          a = Math.atan2((j - y).abs, (i - x).abs.to_f) * 180 / Math::PI
          # Get 360 Degree Angle
          if (i - x) > 0
            a = 360 - a if (j - y) > 0
          else
            a = 180 + ((j - y) > 0 ? a : -a)
          end
          # Set Pixel if Between Angles
          if Math.cw_between_angles?(a, s_angle, e_angle)
            set_pixel(i, j, color)
          end
        end
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Counter-Clockwise Circular Arc Region
    #   Info      : Draws Circular Gradient ccw, from s_angle to e_angle
    #   Author    : SephirothSpawn
    #   Call Info : Eight to Nine Arguments
    #               center_x and center_y
    #               min_radius, max_radius
    #               s_angle & e_angle (in Degrees)
    #               currect_value & max_value
    #               bar_color
    #-------------------------------------------------------------------------
    def draw_ccw_arc_region(x, y, min_rad, max_rad, s_angle, e_angle, 
                            cur_v, max_v, color = Color.red)
      # Calculate Inner Regions
      inner_region = {}
      for i in 0..min_rad
        sa = i
        y_ = Integer((min_rad ** 2 - sa ** 2) ** 0.5)
        inner_region[x + i] = y_
        inner_region[x - i] = y_
      end
      # Make Degrees between 0 - 360
      s_angle %= 360 ; e_angle %= 360
      # Make s_angle Greater than e_angle
      e_angle += 360 if  e_angle < s_angle
      # Calculate Difference
      diff = e_angle - s_angle
      # Get Percent Difference
      p_diff = Integer(diff * cur_v / max_v.to_f)
      # Modify e_angle with percent Diffence
      e_angle = s_angle + p_diff
      # Pass from left to right
      for i in (x - max_rad)..(x + max_rad)
        # Get Y max at that pixel
        y_max = Integer((max_rad ** 2 - (x - i).abs ** 2) ** 0.5)
        # Pass from top to bottom
        for j in (y - y_max)..(y + y_max)
          # If within inner-region limits
          if i.between?(x - min_rad, x + min_rad)
            # If Inner region has key
            if inner_region.has_key?(i)
              # Get Inner Value
              inner = inner_region[i]
              # Skip if Between inner region limits
              next if j.between?(x - inner, x + inner)
            end
          end
          # Gets Angle of pixel from center
          a = Math.atan2((j - y).abs, (i - x).abs.to_f) * 180 / Math::PI
          # Get 360 Degree Angle
          if (i - x) > 0
            a = 360 - a if (j - y) > 0
          else
            a = 180 + ((j - y) > 0 ? a : -a)
          end
          # Set Pixel if Between Angles
          if Math.cw_between_angles?(a, s_angle, e_angle)
            set_pixel(i, j, color)
          end
        end
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Clockwise Gradient Circular Arc Region
    #   Info      : Draws Circular Gradient clockwise, from s_angle to e_angle
    #   Author    : SephirothSpawn
    #   Call Info : Eight to Ten Arguments
    #               center_x and center_y
    #               min_radius, max_radius
    #               s_angle & e_angle (in Degrees)
    #               currect_value & max_value
    #               start_bar_color & end_bar _color
    #-------------------------------------------------------------------------
    def draw_cw_grad_arc_region(x, y, min_rad, max_rad, s_angle, e_angle, 
                                cur_v, max_v, s_color = Color.red, 
                                e_color = Color.blue)
      # Calculate Inner Regions
      inner_region = {}
      for i in 0..min_rad
        y_ = Integer((min_rad ** 2 - i ** 2) ** 0.5)
        inner_region[x + i] = y_
        inner_region[x - i] = y_
      end
      # Make Degrees between 0 - 360
      s_angle %= 360 ; e_angle %= 360
      # Make s_angle Greater than e_angle
      s_angle += 360 if  s_angle < e_angle
      # Calculate Difference
      diff = s_angle - e_angle
      # Get Percent Difference
      p_diff = Integer(diff * cur_v / max_v.to_f)
      # Modify e_angle with percent Diffence
      e_angle = s_angle - p_diff
      # Pass from left to right
      for i in (x - max_rad)..(x + max_rad)
        # Get Y max at that pixel
        y_max = Integer((max_rad ** 2 - (x - i).abs ** 2) ** 0.5)
        # Pass from top to bottom
        for j in (y - y_max)..(y + y_max)
          # If within inner-region limits
          if i.between?(x - min_rad, x + min_rad)
            # If Inner region has key
            if inner_region.has_key?(i)
              # Get Inner Value
              inner = inner_region[i]
              # Skip if Between inner region limits
              next if j.between?(x - inner, x + inner)
            end
          end
          # Gets Angle of pixel from center
          a = Math.atan2((j - y).abs, (i - x).abs.to_f) * 180 / Math::PI
          # Get 360 Degree Angle
          if (i - x) > 0
            a = 360 - a if (j - y) > 0
          else
            a = 180 + ((j - y) > 0 ? a : -a)
          end
          # If Between Angles
          if Math.cw_between_angles?(a, s_angle, e_angle)
            # Get Color Value
            per = Math.cw_percent_between_angles(a, s_angle, s_angle - diff)
            color = Color.color_between(e_color, s_color, per)
            # Set Pixel
            set_pixel(i, j, color)
          end
        end
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Draw Counter-Clockwise Gradient Circular Arc Region
    #   Info      : Draws Circular Gradient ccw, from s_angle to e_angle
    #   Author    : SephirothSpawn
    #   Call Info : Eight to Ten Arguments
    #               center_x and center_y
    #               min_radius, max_radius
    #               s_angle & e_angle (in Degrees)
    #               currect_value & max_value
    #               start_bar_color & end_bar _color
    #-------------------------------------------------------------------------
    def draw_ccw_grad_arc_region(x, y, min_rad, max_rad, s_angle, e_angle, 
                                 cur_v, max_v, s_color = Color.red, 
                                 e_color = Color.blue)
      # Calculate Inner Regions
      inner_region = {}
      for i in 0..min_rad
        sa = i
        y_ = Integer((min_rad ** 2 - sa ** 2) ** 0.5)
        inner_region[x + i] = y_
        inner_region[x - i] = y_
      end
      # Make Degrees between 0 - 360
      s_angle %= 360 ; e_angle %= 360
      # Make s_angle Greater than e_angle
      e_angle += 360 if  e_angle < s_angle
      # Calculate Difference
      diff = e_angle - s_angle
      # Get Percent Difference
      p_diff = Integer(diff * cur_v / max_v.to_f)
      # Modify e_angle with percent Diffence
      e_angle = s_angle + p_diff
      # Pass from left to right
      for i in (x - max_rad)..(x + max_rad)
        # Get Y max at that pixel
        y_max = Integer((max_rad ** 2 - (x - i).abs ** 2) ** 0.5)
        # Pass from top to bottom
        for j in (y - y_max)..(y + y_max)
          # If within inner-region limits
          if i.between?(x - min_rad, x + min_rad)
            # If Inner region has key
            if inner_region.has_key?(i)
              # Get Inner Value
              inner = inner_region[i]
              # Skip if Between inner region limits
              next if j.between?(x - inner, x + inner)
            end
          end
          # Gets Angle of pixel from center
          a = Math.atan2((j - y).abs, (i - x).abs.to_f) * 180 / Math::PI
          # Get 360 Degree Angle
          if (i - x) > 0
            a = 360 - a if (j - y) > 0
          else
            a = 180 + ((j - y) > 0 ? a : -a)
          end
          # If Between Angles
          if Math.cw_between_angles?(a, s_angle, e_angle)
            # Get Color Value
            per = Math.ccw_percent_between_angles(a, s_angle, s_angle + diff)
            color = Color.color_between(s_color, e_color, per)
            # Set Pixel
            set_pixel(i, j, color)
          end
        end
      end
    end
    #-------------------------------------------------------------------------
    #   Name      : Draw Functional Gradient Bar
    #   Info      : Draws a Functional Gradient Bar
    #   Author    : Trickster
    #   Call Info : Seven to Nine Arguments 
    #               Integer X, Y, Width, Height, Current, and Max
    #               Proc Function
    #               Color start and finish both Default to Black
    #               X and Y Define Position, Width and Height defines dimensions
    #               Function is a function of r and x1
    #                 Example proc {Math.sqrt(r**2 - x1**2)} (Circular)
    #               Current Defines How Much of the Bar to Draw
    #               Max Defines the Maximum Value
    #               start, finish is the starting and Ending Colors Respectively
    #-------------------------------------------------------------------------
    def draw_trick_function_bar(x, y, width, height, function, current, max, 
        start = Color.new(0,0,0), finish = Color.new(0,0,0), 
        back = Color.new(0,0,0))
      # Get Change in Colors
      chred, chblue = finish.red - start.red, finish.blue - start.blue
      chgreen, chalpha = finish.green - start.green, finish.alpha - start.alpha
      # Draw Background
      radius = height / 2
      # Setup Values Array
      values = []
      # Draw Rectangle Center
      fill_rect(x + radius, y, width - height, height, back) 
      # Draws Ends
      (radius + 1).times do |x1|
        # Get Parameter
        t = radius - x1
        # Get Y
        y1 = function.call(radius, t).round
        # Get Height
        h = 2 * y1
        # Draw Line of Back Color at Left Edge
        fill_rect(x + x1, y - y1 + radius, 1, h, back)
        # Draw Line of Back Color at Right Edge
        fill_rect(x + width - x1, y - y1 + radius, 1, h, back)
      end
      # Get Percentage
      percentage = current / max.to_f
      # Return if not a finite number
      return if not percentage.finite?
      # Decrease Width and Height increase x and y
      width -= 4
      height -= 4
      x += 2
      y += 2
      # Get new Radius
      radius = height / 2
      # Get Bar Width
      barwidth = width * percentage
      # Draws Left End
      (radius + 1).times do |x1|
        # Stop if Past Width
        break if x1 > barwidth
        # Get T (Parameter)
        t = radius - x1
        # Get Width Change
        chwidth = x1
        # Get Colors
        red = start.red + chred * chwidth / width
        green = start.green + chgreen * chwidth / width
        blue = start.blue + chblue * chwidth / width
        alpha = start.alpha + chalpha * chwidth / width 
        # Get Y
        y1 = function.call(radius, t).round
        # Push onto Values
        values << y1
        # Get Height
        h = 2 * y1
        # Get Color
        color = Color.new(red, green, blue, alpha) if alpha != 255
        color = Color.new(red, green, blue) if alpha == 255
        # Draw Line
        fill_rect(x + x1, y - y1 + radius, 1, h, color)
      end
      # Run From Radius upto Rectangles End
      (width - height + 1).times do |t|
        # Get X1
        x1 = t + radius
        # Break if Past Width
        break if x1 > barwidth
        # Get Width Change
        chwidth = x1
        # Get Colors
        red = start.red + chred * chwidth / width
        green = start.green + chgreen * chwidth / width
        blue = start.blue + chblue * chwidth / width
        alpha = start.alpha + chalpha * chwidth / width
        # Get Color
        color = Color.new(red, green, blue, alpha) if alpha != 255
        color = Color.new(red, green, blue) if alpha == 255
        # Draw Line
        fill_rect(x + x1, y, 1, height, color)
      end
      # Draws Right End
      radius.times do |t|
        # Get X
        x1 = width - radius + t
        # Stop if Past Width
        break if x1 > barwidth
        # Get Width Change
        chwidth = x1
        # Get Colors
        red = start.red + chred * chwidth / width
        green = start.green + chgreen * chwidth / width
        blue = start.blue + chblue * chwidth / width
        alpha = start.alpha + chalpha * chwidth / width 
        # Get Y
        y1 = values[radius-t]
        # Get Height
        h = 2 * y1
        # Get Color
        color = Color.new(red, green, blue, alpha) if alpha != 255
        color = Color.new(red, green, blue) if alpha == 255
        # Draw Line
        fill_rect(x + x1, y - y1 + radius, 1, h, color)
      end
    end
    #-------------------------------------------------------------------------
    #   Name      : Draw Trick Gradient Bar
    #   Info      : Draws a Gradient Bar (Uses Pictures)
    #   Author    : Trickster
    #   Call Info : Thirteen Arguments 
    #               Integer X and Y Define Position
    #               Integer Min and Max Define How Much is Drawn
    #               String File Is the File to load
    #               Integer Width and Height defines dimensions (def bar size)
    #               String Back and Back2 Are the Backgrounds for the bar
    #               Integer cx,cy,dx,dy Define the Borders of the Backgrounds
    #-------------------------------------------------------------------------
    def draw_trick_gradient_bar(x, y, min, max, file, width = nil, height = nil, 
      back = 'Back', back2 = 'Back2', cx = 1, cy = 1, dx = 1, dy = 1)
      # Get Bar and Background Bitmaps
      bar = RPG::Cache.gradient(file)
      back = RPG::Cache.gradient(back)
      back2 = RPG::Cache.gradient(back2)
      # Get Zoom X and Zoom Y
      zoom_x = width != nil ? width : back.width
      zoom_y = height != nil ? height : back.height
      # Get Percentage
      percent = max == 0 ? 0 : min / max.to_f
      # Create Destination Rect Objects
      back_dest = Rect.new(x, y, zoom_x, zoom_y)
      back2_dest = Rect.new(x + dx, y + dy, zoom_x - dx * 2, zoom_y - dy * 2)
      bar_dest = Rect.new(x + cx, y + cy, zoom_x * percent - cx*2, zoom_y - cy*2)
      # Get Source Rect
      source = Rect.new(0, 0, bar.width * percent, bar.height)
      # Draw Onto Window
      stretch_blt(back_dest, back, back.rect)
      stretch_blt(back2_dest, back2, back2.rect)
      stretch_blt(bar_dest, bar, source)
    end  
    #-------------------------------------------------------------------------
    #   Name      : Draw Trick Vertical Gradient Bar
    #   Info      : Draws a Gradient Bar (Uses Pictures)
    #   Author    : Trickster
    #   Call Info : Thirteen Arguments 
    #               Integer X and Y Define Position
    #               Integer Min and Max Define How Much is Drawn
    #               String File Is the File to load
    #               Integer Width and Height defines dimensions (def bar size)
    #               String Back and Back2 Are the Backgrounds for the bar
    #               Integer cx,cy,dx,dy Define the Borders of the Backgrounds
    #-------------------------------------------------------------------------
    def draw_trick_vertical_gradient_bar(x, y, min, max, file, width = nil, 
      height = nil, back = 'Back', back2 = 'Back2', cx = 1, cy = 1, dx = 1, dy = 1)
      # Ger Bar Bitmaps
      bar = RPG::Cache.gradient(file)
      back = RPG::Cache.gradient(back)
      back2 = RPG::Cache.gradient(back2)
      # Get Zoom X and Zoom Y
      zoom_x = width != nil ? width : back.width
      zoom_y = height != nil ? height : back.height
      # Get Percentage
      percent = max == 0 ? 0 : min / max.to_f
      # Get Bar Y
      bar_y = (zoom_y - zoom_y * percent).ceil
      # Get Bar Source Y
      source_y = bar.height - bar.height * percent
      # Get Bar Dest Y
      dest_y = (zoom_y * percent).to_i
      # Create Destination Rect Objects
      back_dest = Rect.new(x, y, zoom_x, zoom_y)
      back2_dest = Rect.new(x + dx, y + dy, zoom_x - dx * 2, zoom_y - dy * 2)
      bar_dest = Rect.new(x + cx, y + bar_y + cy, zoom_x - cx * 2, dest_y - cy * 2)
      # Get Source Rect
      source = Rect.new(0, source_y, bar.width, bar.height * percent)
      # Draw Onto Window
      stretch_blt(back_dest_rect, back, back_source_rect)
      stretch_blt(back2_dest_rect, back2, back2_source_rect)
      stretch_blt(bar_dest_rect, bar, source)
    end
    #-------------------------------------------------------------------------
    #   Name      : Draw Trick Gradient Bar Background
    #   Info      : Draws a Gradient Bar Background (Uses Pictures)
    #   Author:    Trickster
    #   Call Info : Thirteen Arguments 
    #              Integer X and Y Define Position
    #              Integer Min and Max Define How Much is Drawn
    #              String File Is the File to load
    #              Integer Width and Height is the width and height (Defaults to nil)
    #              String Back and Back2 Are the Backgrounds for the bar
    #              Integer cx,cy,dx,dy Define the Borders of the Backgrounds
    #-------------------------------------------------------------------------
    def draw_trick_gradient_bar_back(x, y, width = nil, height = nil, back = 'Back', 
      back2 = 'Back2', dx = 1, dy = 1)
      # Get Bitmaps
      back = RPG::Cache.gradient(back)
      back2 = RPG::Cache.gradient(back2)
      # Get Zoom X and Zoom Y
      zoom_x = width != nil ? width : back.width
      zoom_y = height != nil ? height : back.height
      # Get Destination Rects
      back_dest_rect = Rect.new(x, y, zoom_x, zoom_y)
      back2_dest_rect = Rect.new(x + dx, y + dy, zoom_x - dx * 2, zoom_y - dy * 2)
      # Draw Border
      stretch_blt(back_dest_rect, back, back.rect)
      # Draw Background
      stretch_blt(back2_dest_rect, back2, back2.rect)
    end
    #-------------------------------------------------------------------------
    #   Name      : Draw Trick Gradient Bar Substance
    #   Info      : Draws a Gradient Bar w/o the Background(Uses Pictures)
    #   Author:    Trickster
    #   Call Info : Ten Arguments 
    #              Integer X and Y Define Position
    #              Integer Min and Max Define How Much is Drawn
    #              String File Is the File to load
    #              Integer Width and Height is the width and height (Defaults to nil)
    #              String Back is the background used for the bar
    #              Integer cx,cy Define the Borders of the Backgrounds
    #-------------------------------------------------------------------------
    def draw_trick_gradient_bar_sub(x, y, min, max, file, width = nil, height = nil, 
      back = 'Back', cx = 1, cy = 1, slanted = false)
      # Get Bitmaps
      bar = RPG::Cache.gradient(file)
      back = RPG::Cache.gradient(back)
      # Get Zoom X and Zoom Y
      zoom_x = width != nil ? width : back.width
      zoom_y = height != nil ? height : back.height
      # Get Percentage
      percent = max == 0 ? 0 : min / max.to_f
      # Get Destination Rect
      bar_dest_rect = Rect.new(x+cx, y+cy, zoom_x * percent - cx*2, zoom_y - cy*2)
      # Get Source Rect
      bar_source_rect = Rect.new(0, 0, bar.width * percent, bar.height)
      # Draw Bitmap
      stretch_blt(bar_dest_rect, bar, bar_source_rect)
      # If Slanted
      if slanted
        # Setup Transparent Color
        color = Color.new(0,0,0,0)
        # Run Through and remove edges
        (0...zoom_y).each do |i|
          # Get Height
          x_i = zoom_y - 1 - i
          # Fill Lines at Start and End
          fill_rect(x + i, y, 1, x_i, color)
          fill_rect(x + zoom_x * percent - cx*2 - i, y + zoom_y - x_i, 1, x_i, color)
        end
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Shade Gradient Section
    #   Info      : Shades a section from (cx,cy), (x1,y1), (x2,y2) w/ gradient
    #   Author    : Trickster
    #   Call Info : Six to Ten Arguments
    #               Integer cx, cy, x1, y1, x2, y2 - Points
    #               Integer Thick - Line Thickness
    #               Integer Step - how many lines to draw (lower = higher accuracy)
    #               Color start_color, end_color - Start and end colors
    #-------------------------------------------------------------------------
    def shade_gradient_section(cx, cy, x1, y1, x2, y2, thick = 1, step = 1,
      start_color = Color.new(0, 0, 0), end_color = start_color)
      # Reverse all parameters sent if 2 x is less than the first x
      x1, x2, y1, y2 = x2, x1, y2, y1 if x2 < x1    
      # Get Slope
      slope = (y2 - y1).to_f / (x2 - x1)
      # If Slope is infinite
      if slope.infinite?
        y1.step(y2, step) {|y| draw_gradient_line(cx, cy, x1, y, thick, start_color, end_color)}
      # If Slope is zero
      elsif slope.zero?
        x1.step(x2, step) {|x| draw_gradient_line(cx, cy, x, y1, thick, start_color, end_color)}
      elsif not slope.nan?
        # Get Y intercept
        yint = y1 - slope * x1
        x1.step(x2, step) {|x| draw_gradient_line(cx, cy, x, slope * x + yint, thick, start_color, end_color)}
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Vertical Gradient Pixel Change
    #   Info      : Changes Pixels to Linear Gradient
    #   Author    : SephirothSpawn
    #   Call Info : Two to Three Arguments
    #               Start Color and End Color
    #               Optional Rect, rect of bitmap being changed
    #-------------------------------------------------------------------------
    def v_gradient_pixel_change(sc = Color.red, ec = Color.blue, r = rect)
      # Pass From Top to Bottom
      for y_ in (r.y)...(r.y + r.height)
        # Get Color
        color = Color.color_between(sc, ec, (y_ / (r.height).to_f))
        # Pass From Left to Right
        for x_ in (r.x)...(r.x + r.width)
          # Gets Alpha Pixel
          a = get_pixel(x_, y_).alpha
          # Skip if 0 Alpha
          next if a == 0
          # Set Color Alpha
          color.alpha = a
          # Set Pixel
          set_pixel(x_, y_, color)
        end
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Horizontal Gradient Pixel Change
    #   Info      : Changes Pixels to Linear Gradient
    #   Author    : SephirothSpawn
    #   Call Info : Two to Three Arguments
    #               Start Color and End Color
    #               Optional Rect, rect of bitmap being changed
    #-------------------------------------------------------------------------
    def h_gradient_pixel_change(sc = Color.red, ec = Color.blue, r = rect)
      # Passes From Left to Right
      for x_ in (r.x)...(r.x + r.width)
        # Get Color
        color = Color.color_between(sc, ec, (x_ / r.width.to_f))
        # Pass From Top to Bottom
        for y_ in (r.y)...(r.y + r.height)
          # Gets Alpha Pixel
          a = get_pixel(x_, y_).alpha
          # Skip if 0 Alpha
          next if a == 0
          # Set Color Alpha
          color.alpha = a
          # Set Pixel
          set_pixel(x_, y_, color)
        end
      end
    end
  end
  
  #============================================================================== 
  # ** RGSS.Bitmap.image
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Methods created for the Bitmap class that manipulates the bitmap. Methods 
  # include flipping, stretching, and erasing.
  #  
  # Method List:
  # ------------
  # erase
  # flip_horizontal
  # flip_horizontal!
  # flip_vertical
  # flip_vertical!
  # frames_flip_horizontal!
  # frames_flip_vertical!
  # stretch
  # blur_area
  # add_bitmap_blend
  # sub_bitmap_blend
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Bitmap.image'
  
  #==============================================================================
  # ** Bitmap
  #==============================================================================
  
  class Bitmap
    #-------------------------------------------------------------------------
    # * Name      : Erase
    #   Info      : This method clears a part of the bitmap
    #   Author    : Selwyn
    #   Call Info : One or Four arguments, 
    #               One Argument : Rect ; Four arguments : Integers
    #               One Argument  : Rect.new(x, y, width, height)
    #               Four Arguments : x, y, width, height
    #   Comment   : works the same as the build-in method 'clear' 
    #               but only for a portion of the bitmap
    #-------------------------------------------------------------------------
    def erase(*args)
      # If One Argument Sent
      if args.size == 1
        # Set Rect
        rect = args
      # If Four Arguments Sent
      elsif args.size == 4
        # Create Rect
        rect = Rect.new(*args)
      end
      # Erase (Set To Transparent Color)
      fill_rect(rect, Color.new(0, 0, 0, 0))
    end
    #-------------------------------------------------------------------------
    #   Name      : Flip Horizontally 
    #   Info      : Flips Bitmap Horizontally
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def flip_horizontal
      # Create Flipped Bitmap
      flipped = Bitmap.new(width, height)
      # Create Rect
      rect = Rect.new(0, 0, 1, height)
      # Do Width Times
      width.times do |i|
        # Set X
        rect.x = width - 1 - i
        # Draw on other side
        flipped.blt(i, 0, self, rect)
      end
      # Return Flipped Bitmap
      return flipped
    end
    #-------------------------------------------------------------------------
    #   Name      : Flip Horizontally!
    #   Info      : Flips Bitmap Horizontally Modifies the Bitmap
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def flip_horizontal!
      # Create Flipped Bitmap
      flipped = Bitmap.new(width, height)
      # Create Rect
      flip_rect = Rect.new(0, 0, 1, height)
      # Do Width Times
      width.times do |i|
        # Set X
        flip_rect.x = width - 1 - i
        # Draw on other side
        flipped.blt(i, 0, self, flip_rect)
      end
      # Clear Bitmap
      clear
      # Draw Flipped
      blt(0, 0, flipped, rect)
      # Dispose Flipped
      flipped.dispose
    end
    #-------------------------------------------------------------------------
    #   Name      : Flip Vertically 
    #   Info      : Flips Bitmap Vertically 
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def flip_vertical
      # Create Flipped Bitmap
      flipped = Bitmap.new(width, height)
      # Create Rect
      flip_rect = Rect.new(0, 0, width, 1)
      # Do Width Times
      height.times do |i|
        # Set Y
        flip_rect.y = height - 1 - i
        # Draw on Other Side
        flipped.blt(0, i, self, flip_rect)
      end
      # Return Flipped
      return flipped
    end
    #-------------------------------------------------------------------------
    #   Name      : Flip Vertically! 
    #   Info      : Flips Bitmap Vertically Modifies the Bitmap
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def flip_vertical!
      # Create Flipped Bitmap
      flipped = Bitmap.new(width, height)
      # Create Rect
      flip_rect = Rect.new(0, 0, width, 1)
      # Do Width Times
      height.times do |i|
        # Set Y
        flip_rect.y = height - 1 - i
        # Draw on Other Side
        flipped.blt(0, i, self, flip_rect)
      end
      # Clear Bitmap
      clear
      # Draw Flipped
      blt(0, 0, flipped, rect)
      # Dispose Flipped
      flipped.dispose
    end
    #-------------------------------------------------------------------------
    #   Name      : Flip Each Frame Horizontally 
    #   Info      : Flips Each Frame Horizontally Modifies Itself 
    #   Author    : Trickster
    #   Call Info : One Argument, Integer Frames the number of frames to split and 
    #               flip
    #-------------------------------------------------------------------------
    def frames_flip_horizontal!(frames)
      # Get Frame Width
      frame_width = width / frames
      # Create A Frame Dummy Bitmap
      frame_bitmap = Bitmap.new(frame_width, height)
      # Create Rect
      rect = Rect.new(0, 0, frame_width, height)
      # Do Frames times
      frames.times do |i|
        # Clear Bitmap
        frame_bitmap.clear
        # Get X
        x = i * frame_width
        # Set Rect.x
        rect.x = x
        # Draw Piece of Bitmap onto dummy
        frame_bitmap.blt(0, 0, self, rect)
        # Flip Horizontally
        frame_bitmap.flip_horizontal!
        # Draw Onto Self
        blt(x, 0, frame_bitmap, frame_bitmap.rect)
      end
      # Dispose Dummy Bitmap
      frame_bitmap.dispose
    end
    #-------------------------------------------------------------------------
    #   Name      : Flip Each Frame Vertically 
    #   Info      : Flips Each Frame Vertically Modifies Itself 
    #   Author    : Trickster
    #   Call Info : One Argument, Integer Frames the number of frames to split and 
    #               flip
    #-------------------------------------------------------------------------
    def frames_flip_vertical!(frames)
      # Get Frame Height
      frame_height = height / frames
      # Create A Frame Dummy Bitmap
      frame_bitmap = Bitmap.new(width, frame_height)
      # Create Rect
      rect = Rect.new(0, 0, width, frame_height)
      # Do Frames times
      frames.times do |i|
        # Clear Bitmap
        frame_bitmap.clear
        # Get Y
        y = i * frame_height
        # Set Rect.y
        rect.y = y
        # Draw Piece Of Bitmap onto Dummy
        frame_bitmap.blt(0, 0, self, rect)
        # Flip Vertically
        frame_bitmap.flip_vertical!
        # Draw onto Self
        blt(0, y, frame_bitmap, frame_bitmap.rect)
      end
      # Dispose Dummy Bitmap
      frame_bitmap.dispose
    end
    #-------------------------------------------------------------------------
    #   Name      : Stretch
    #   Info      : Stretches and Returns Bitmap
    #   Author    : Trickster
    #   Call Info : Two Arguments, Width and Height of Bitmap
    #-------------------------------------------------------------------------
    def stretch(width, height)
      # Create Dummy Bitmap
      dummy = Bitmap.new(width, height)
      # Stretch Blt onto dummy
      dummy.stretch_blt(Rect.new(0, 0, width, height), self, dummy.rect)
      # Return dummy
      return dummy
    end
    #-------------------------------------------------------------------------
    # * Name      : Blur Area
    #   Info      : Blurs area of bitmap
    #   Author    : SephirothSpawn
    #   Call Info : One Argument as hash
    #
    #               Defining Area of Blur
    #                hash['rect']             = Rect object
    #                hash['x'], 'y', 'w', 'h' = Rect properties
    #                nothing = Entire bitmap
    #
    #               Optional Settings (Defaults to @blur_settings)
    #                hash['spacing'] = Space between redraws
    #                hash['opacity'] = Max opacity of blut
    #                hash['offset']  = Number of times to space out blur
    #-------------------------------------------------------------------------
    def blur_area(settings = {})
      # Set Defaults
      @blur_settings.each do |default, setting|
        settings[default] = setting unless settings.has_key?(default)
      end
      # Collects Keys
      keys = settings.keys
      # Rect Defined Flag
      rect_defined = keys.include?('rect')
      # Rect Positions Defined
      rect_p_defined = keys.include?('x') && keys.include?('y') && 
                       keys.include?('w') && keys.include?('h')
      # If Rect Defined
      if rect_defined
        # Gets Rect
        rect = settings['rect']
        # Set Position Arguments
        x, y, w, h = rect.x, rect.y, rect.width, rect.height
      # If Rect Positions Defined
      elsif rect_p_defined
        # Set Position Arguments
        x, y, w, h = settings['x'], settings['y'], settings['w'], settings['h']
      else
        # Set Entire Bitmap
        x, y, w, h = 0, 0, self.width, self.height
      end
      # Duplicated Bitmap
      dummy = self.dup
      # Gets Spacing & Max Opacity
      spacing = settings['spacing']
      opacity = settings['opacity']
      # Number of Offsets
      settings['offset'].times do |i|
        # Collects Src Rect
        src_rects = []
        src_rects << Rect.new(x + i * spacing, y + i * spacing, w, h)
        src_rects << Rect.new(x - i * spacing, y + i * spacing, w, h)
        src_rects << Rect.new(x + i * spacing, y - i * spacing, w, h)
        src_rects << Rect.new(x - i * spacing, y - i * spacing, w, h)
        # Gets Opacity
        o = Integer(opacity * (settings['offset'] - i) / (settings['offset']))
        # Draws Rects
        src_rects.each do |src_rect|
          blt(x, y, dummy, src_rect, o)
        end
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Add Bitmap Blend
    #   Info      : Adds Bitmap Pixel Values to another
    #   Author    : Gibmaker / SephirothSpawn
    #   Call Info : Three to Four Arguments
    #               X and Y position
    #               src bitmap
    #               src bitmap rect
    #-------------------------------------------------------------------------
    def add_bitmap_blend(x, y, bitmap, src_rect = bitmap.rect)
      for i in 0...src_rect.width
        for j in 0...src_rect.height
          c1 = get_pixel(x + i, y + j)
          c2 = bitmap.get_pixel(src_rect.x + i, src_rect.y + j)
          nc = Color.new(c1.red + c2.red, c1.green + c2.green, c1.blue + c2.blue)
          set_pixel(x + i, y + j, nc)
        end
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Subtract Bitmap Blend
    #   Info      : Subtracts Bitmap Pixel Values to another
    #   Author    : Gibmaker / SephirothSpawn
    #   Call Info : Three to Four Arguments
    #               X and Y position
    #               src bitmap
    #               src bitmap rect
    #-------------------------------------------------------------------------
    def sub_bitmap_blend(x, y, bitmap, src_rect = bitmap.rect)
      for i in 0...src_rect.width
        for j in 0...src_rect.height
          c1 = get_pixel(x + i, y + j)
          c2 = bitmap.get_pixel(src_rect.x + i, src_rect.y + j)
          nc = Color.new(c1.red - c2.red, c1.green - c2.green, c1.blue - c2.blue)
          set_pixel(x + i, y + j, nc)
        end
      end
    end
  end
  
  #============================================================================== 
  # ** RGSS.Bitmap.memory
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Specialized Methods for tbe bitmap class for remembering text. Also includes
  # a non-laggy draw_text method based on the original draw text which stores the
  # text in memory and calls blt instead of draw_text if it is needed again. One
  # thing to remember is to call Bitmap.clear_text_memory
  # Bitmap.clear_formatted_text_memory to dispose of all memorized sprites 
  # when you are finished (preferably at the end of a scene).
  #    
  # When Benchmarked drawing the string 'Hello World '*5 100 times the results
  #   draw_text_memory around 0.266 seconds
  #   draw_wrap_text_memory around 1.969 seconds
  #   draw_formatted_text_memory around 0.266 seconds
  #   draw_text around 6.235 seconds
  #  
  # Method List:
  # ------------
  # Bitmap.clear_text_memory
  # Bitmap.clear_formatted_text_memory
  # clear_memory
  # cleat_to_memory
  # draw_formatted_text_memory
  # draw_text_memory
  # draw_wrap_text_memory
  # get_formatted_size (from Bitmap.text)
  # set_memory
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Bitmap.memory'
  
  #==============================================================================
  # ** Bitmap
  #==============================================================================
  
  class Bitmap
    #--------------------------------------------------------------------------
    # * Class Variables
    #--------------------------------------------------------------------------
    class_reader :text_memory, :formatted_text_memory
    #-------------------------------------------------------------------------
    # * Class Variables
    #-------------------------------------------------------------------------
    @@text_memory, @@formatted_text_memory = {}, {}
    #-------------------------------------------------------------------------
    #   Name      : Clear Text Memory
    #   Info      : Clears Text Memory
    #   Author    : Trickster
    #   Call Info : No Arguments
    #   Comment   : Should be called at the end of every scene where
    #               draw_text_memory or draw_wrap_text_memory is used
    #-------------------------------------------------------------------------
    def self.clear_text_memory
      # Run Through Each Bitmap In Text Memory and dispose
      @@text_memory.each_value {|bitmap| bitmap.dispose}
      # Clear
      @@text_memory.clear
    end
    #-------------------------------------------------------------------------
    #   Name      : Clear Formatted Text Memory
    #   Info      : Clears Formatted Text Memory
    #   Author    : Trickster
    #   Call Info : No Arguments
    #   Returns   : Nothing
    #   Comment   : Should be called at the end of every scene where
    #               draw_formatted_text_memory is used
    #-------------------------------------------------------------------------
    def self.clear_formatted_text_memory
      # Run Through Each Bitmap In Text Memory and dispose
      @@formatted_text_memory.each_value {|bitmap| bitmap.dispose}
      # Clear
      @@formatted_text_memory.clear
    end
    #-------------------------------------------------------------------------
    #   Name      : Clear Memory
    #   Info      : Clears Bitmap Memory
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def clear_memory
      # Dispose Memory
      @memory.dispose
      # Set To nil
      @memory = nil
    end
    #-------------------------------------------------------------------------
    #   Name      : Clear To Memory
    #   Info      : Clears to Bitmap Memory
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def clear_to_memory
      # Clear Bitmap 
      clear
      # Draw Memory if it is a Bitmap
      blt(0, 0, @memory, rect) if @memory.is_a?(Bitmap)
    end
    #-------------------------------------------------------------------------
    #   Name      : Draw Formatted Text Memory
    #   Info      : Draws Formatted Wrapped Text from Memory
    #   Author    : Trickster
    #   Call Info : Five Arguments
    #               Integer Offset_x and Offset_Y, define starting position
    #               Integer Width, defines the width of the text rectangle
    #               Integer Height, defines the height of the text drawn
    #               String Text, The text to be drawn
    #   Comment   : C[rrggbb] -> Change Color values are in hex
    #               C[N] -> Change Color to Normal Color
    #               B[] -> Turns on/off Bold
    #               I[] -> Turns on/off Italics
    #               T[] -> Tab (4 Spaces)
    #               N[] -> Newline 
    #-------------------------------------------------------------------------
    def draw_formatted_text_memory(x, y, width, height, text)
      # If Already drawn
      if @@formatted_text_memory.has_key?(text)
        # Get Bitmap
        bitmap = @@formatted_text_memory[text]
        # Draw Bitmap
        blt(x, y, bitmap, bitmap.rect)
      else
        # Get Height of Text Drawn
        height = get_formatted_size(x, y, width, height, text).height
        # Create Text Bitmap
        text_bitmap = Bitmap.new(width, height)
        # Initialize X and Y
        cx, cy = 0, 0
        # Setup Font Color
        text_bitmap.font.color = Color.new(255, 255, 255)
        # Setup Save String
        string = text.dup
        # Make a Copy of Text
        text = text.dup
        # Replace C[Hex+] or C[N] with \001[Matched]
        text.gsub!(/[Cc]\[([A-F a-f 0-9]+|N)\]/) {" \001[#{$1}] "}
        # Replace B[] with \002
        text.gsub!(/[Bb]\[\]/) {" \002 "}
        # Replace I[] with \003
        text.gsub!(/[Ii]\[\]/) {" \003 "}
        # Replace T[] with \004
        text.gsub!(/[Tt]\[\]/) {" \004 "}
        # Replace N[] with \005
        text.gsub!(/[Nn]\[\]/) {" \005 "}
        # Run Through each text
        text.split(/\s/).each do |word|
          # If String \001 is included
          if word.include?("\001")
            # Slice from String
            word.slice!("\001")
            # Change text color
            word.sub!(/[Cc]\[([A-F a-f 0-9]+|N)\]/, '')
            # If matched is not nil and size of match is > 1
            if $1 != nil and $1.size > 1
              # Create Color
              color = Color.new($1[0..1].hex, $1[2..3].hex, $1[4..5].hex)
            else
              # Normal Color
              color = Color.new(255, 255, 255)
            end
            # Set Color
            self.font.color = color
            # Go to next text
            next
          end
          # If String \002 is included
          if word.include?("\002")
            # Invert Bold Status
            self.font.bold = !self.font.bold
            # Go to next text
            next
          end
          # If String \003 is included
          if word.include?("\003")
            # Invert Italic Status
            self.font.italic = !self.font.italic
            # Go to next text
            next
          end
          # If String \004 is included
          if word.include?("\004")
            # Add Four Spaces
            x += text_size('    ').width
            # Go to next text
            next
          end
          # If String \005 is included
          if word.include?("\005")
            # Move to new line
            cy = cx / width + 1
            # Move to start
            cx = cy * width
            # Go to next text
            next
          end
          # Get Word Width
          word_width = text_size("#{word} ").width
          # If can't fit on line
          if (cx + word_width) % width < x % width
            # Move to new line
            cy = cx / width + 1
            # Move to start
            cx = cy * width
          end
          # Get Draw X
          dx = cx % width + x
          # Get Draw Y
          dy = cx / width * height + y
          # Draw Text
          text_bitmap.draw_text(dx, dy, word_width, 32, word)
          # Increase by Word Width
          cx += word_width
        end
        # Save Copy of Bitmap
        @@formatted_text_memory[string] = text_bitmap
        # Draw onto Bitmap
        blt(x, y, text_bitmap, text_bitmap.rect)
      end
    end
    #-------------------------------------------------------------------------
    #   Name      : Draw Text Memory
    #   Info      : Draws Text and Saves it to Text_Memory
    #   Author    : Trickster
    #   Call Info : Two,Three,Five or Six Arguments
    #               Two Arguments: rect, str
    #                 Rect rect for the text to be drawn
    #                 String str text to be drawn
    #               Three Arguments: rect, str, align 
    #                 Rect rect for the text to be drawn
    #                 String str text to be drawn
    #                 Integer align 0: left 1: center 2:right
    #               Five Arguments: x,y,width,height,str 
    #                 Integer X and Y, Defines Position
    #                 Width and Height, Defines Width and Hieght of the text drawn
    #                 String str text to be drawn
    #               Six Arguments: x,y,width,height,str,align
    #                 Integer X and Y, Defines Position
    #                 Width and Height, Defines Width and Hieght of the text drawn
    #                 String str text to be drawn
    #                 Integer align 0: left 1: center 2:right
    #-------------------------------------------------------------------------
    def draw_text_memory(*args)
      # If Two Arguments Sent
      if args.size == 2
        # Default align, Rect and String were sent
        align, rect, str = 0, *args
      # If Three Arguments Sent
      elsif args.size == 3
        # All Were Sent Rect String and Alignment
        rect, str, align = args
      # If Five Arguments Sent
      elsif args.size == 5
        # Create Rect from (X,Y,Width,Height), Set String, Default align
        rect, str, align = Rect.new(*args[0, 4]), args[4], 0
      # If Six Arguments Sent
      elsif args.size == 6
        # Create Rect from (X,Y,Width,Height), Set String and align      
        rect, str, align = Rect.new(*args[0, 4]), *args[4, 2]
      end
      # Create Text Rect from Rect
      txt_rect = Rect.new(0, 0, rect.width, rect.height)
      # If Key is contained
      if @@text_memory.contains_key?([font, txt_rect, str])
        # Get Bitmap
        bitmap = @@text_memory.get_value([font, txt_rect, str])
        # Draw Bitmap by getting value from hash
        blt(rect.x, rect.y, bitmap, txt_rect)
      else
        # Create Bitmap
        bitmap = Bitmap.new(rect.width, rect.height)
        # Make A Copy of the Font
        bitmap.font = font.dup
        # Draw Text on bitmap
        bitmap.draw_text(txt_rect, str, align)
        # Draw Bitmap
        blt(rect.x, rect.y, bitmap, txt_rect)
        # Set Text Memory
        @@text_memory[[font.dup, txt_rect, str]] = bitmap
      end
    end
    #-------------------------------------------------------------------------
    #   Name      : Draw Wrapped Text From Memory
    #   Info      : Draws Text with Text Wrap and Saves it
    #   Author    : Trickster
    #   Call Info : Five
    #               Integer X and Y, Define Position
    #               Integer Width, defines the width of the text rectangle
    #               Integer Height, defines the height of the text
    #               String Text, Text to be drawn
    #-------------------------------------------------------------------------
    def draw_wrap_text_memory(x, y, width, height, text)
      # Get Array of Text
      strings = text.split
      # Run Through Array of Strings
      strings.each do |string|
        # Get Word
        word = string + ' '
        # Get Word Width
        word_width = text_size(word).width
        # If Can't Fit on Line move to next one
        x, y = 0, y + height if x + word_width > width
        # Draw Text Memory
        draw_text_memory(x, y, word_width, height, word)
        # Add To X
        x += word_width
      end
    end
    #-------------------------------------------------------------------------
    #   Name      : Get Formatted Text Size
    #   Info      : Gets Rect information for drawing formatted text
    #               The Rect Object Returned will have this information
    #               x, x coordinate where drawing ends
    #               y, y coordinate where drawing ends
    #               width, the width sent to this method
    #               height, the height of all of the text drawn
    #   Author    : Trickster
    #   Call Info : Five
    #               Integer X and Y, Define Position
    #               Integer Width, defines the width of the text rectangle
    #               Integer Height, defines the height of the text
    #               String Text, Text to get information for 
    #-------------------------------------------------------------------------
    def get_formatted_size(x, y, width, height, text)
      # Make a Copy and Save
      text = text.dup
      # Replace C[Hex+ or N] I[] B[] with nothing
      text.gsub!(/[BbIiCc]\[([A-F a-f 0-9]+|N)*\]/) {''}
      # Replace T[] with \004
      text.gsub!(/[Tt]\[\]/) {" \004 "}
      # Replace N[] with \005
      text.gsub!(/[Nn]\[\]/) {" \005 "}
      # Setup Cx and Cy
      cx, cy = 0, 0
      # Declare Dx and Dx as local variables
      dx, dy = 0, 0
      # Run Through each text
      text.split(/\s/).each do |word|
        # If \004 is included
        if word.include?("\004")
          # Add Four Spaces
          x += text_size(' '*4).width
          # Go to Next Text
          next
        end
        # If \005 is included
        if word.include?("\005")
          # Move to new line
          cy = cx / width + 1
          # Move to start
          cx = cy * width
          # Go to Next Text
          next
        end
        # Get Word Width
        word_width = text_size("#{word} ").width
        # If can't fit on line
        if (cx + word_width) % width < x % width
          # Move to new line
          cy = cx / width + 1
          # Move to start
          cx = cy * width
        end
        # Add Width to X
        cx += word_width
        # Get Draw X and Y
        dx = cx % width + x
        dy = cx / width * height + y
      end
      # Return Rect Object
      return Rect.new(dx, dy, width, (dy - y + height).to_i)
    end
    #-------------------------------------------------------------------------
    #   Name      : Set Memory
    #   Info      : Sets Bitmap Memory
    #   Author    : Trickster
    #   Call Info : No Arguments
    #   Comment   : Use with Clear To Memory 
    #-------------------------------------------------------------------------
    def set_memory
      # Make A Clone of itself
      @memory = self.dup
    end
  end
  
  #============================================================================== 
  # ** RGSS.Bitmap.misc
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Miscellaneous New stuff for the Bitmap class.
  #  
  # Method List:
  # ------------
  # make_png
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Bitmap.misc'
  
  #============================================================================== 
  # ** Bitmap     
  #==============================================================================
  
  class Bitmap
    #-------------------------------------------------------------------------
    # * Name      : Make PNG
    #   Info      : Saves Bitmap to File
    #   Author    : ??? - http://www.66rpg.com/htm/news624.htm
    #   Call Info : Zero to Three Arguments
    #               Name : Name of filenam
    #               Path : Directory in Game Folder
    #               Mode : Mode of Writing
    #-------------------------------------------------------------------------
    def make_png(name = 'like', path = '', mode = 0)
      Dir.make_dir(path) if path != ''
      Zlib::Png_File.open('temp.gz')   { |gz| gz.make_png(self, mode) }
      Zlib::GzipReader.open('temp.gz') { |gz| $read = gz.read }
      f = File.open(path + name + '.png', 'wb')
      f.write($read)
      f.close
      File.delete('temp.gz')
    end
  end
  
  #============================================================================== 
  # ** RGSS.Bitmap.text
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Methods created for the Bitmap class that handle text drawing such as
  # drawing wrapped text and formatted text see Bitmap.memory for more text 
  # drawing functions.
  #  
  # Method List:
  # ------------
  # Bitmap.dummy=
  # Bitmap.dummy
  # Bitmap.text_size
  # Bitmap.string_to_text_icons
  # Bitmap.icon_text_sizes
  # get_formatted_size
  # text_wrap_size
  # draw_formatted_text
  # draw_paragraph
  # draw_wrap_text
  # draw_icon_text
  # draw_text_shadow
  # draw_text_outline
  # draw_text_underline
  # draw_text_strikethrough
  # draw_text_gradient
  #
  # Modified Methods:
  # -----------------
  # draw_text -> basic_draw_text
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Bitmap.text'
  
  #==============================================================================
  # ** Bitmap
  #==============================================================================
  
  class Bitmap
    #--------------------------------------------------------------------------
    # * Class Variable Declaration
    #--------------------------------------------------------------------------
    class_accessor :dummy
    Bitmap.dummy = Bitmap.new(32, 32)
    #--------------------------------------------------------------------------
    # * Name      : Text Size
    #   Info      : Gets text size based off dummy bitmap
    #   Author    : SephirothSpawn
    #   Call Info : One Argument, a String
    #--------------------------------------------------------------------------
    def Bitmap.text_size(text)
      return Bitmap.dummy.text_size(text)
    end
    #--------------------------------------------------------------------------
    #   Name      : Format String to Text & Icons
    #   Info      : Changes Strint to Array of Strings and Bitmaps
    #               (Used for draw_icon_text)
    #   Author    : SephirothSpawn
    #   Call Info : One Argument, a String
    #   Comments  : Format for String : "text [icon_filename] text text..."
    #--------------------------------------------------------------------------
    def Bitmap.string_to_text_icons(text)
      # Splits Text
      text = text.split
      # Start Icon List
      icons = []
      # Pass Through Text List
      for i in 0...text.size
        # Get Word
        word = text[i]
        # Sub [icon_filename]
        word.gsub(/\[(.+?)\]/, '')
        # Skip if nothing substituted
        next if $1.nil?
        # Replace Text Word with nil
        text[i] = nil
        # Add Icon to Icon List
        icons << RPG::Cache.icon($1)
      end
      # Return Text & Icons
      return text, icons
    end
    #--------------------------------------------------------------------------
    #   Name      : Get Icon Text Widths
    #   Info      : Determines size required to draw_icon_text
    #               (Used for draw_icon_text)
    #   Author    : SephirothSpawn
    #   Call Info : Two Arguments, an Array of strings and an Array of bitmaps
    #--------------------------------------------------------------------------
    def Bitmap.icon_text_sizes(text, icons)
      # Gets Icon Width
      icn_w = 0
      icons.each {|b| icn_w += b.width}
      # Gets Text Width
      txt_w = 0
      text.each do |w|
        next if w.nil?
        txt_w += @@dummy.text_size(w).width
      end
      # Gets Space Width
      spc_w = Bitmap.text_size(' ').width
      # Gets Total Width
      tot_w = icn_w + txt_w + (text.size - 1) * spc_w
      # Return Icon, Text, Space & Total Width
      return icn_w, txt_w, spc_w, tot_w
    end
    #-------------------------------------------------------------------------
    #   Name      : Get Formatted Text Size
    #   Info      : Gets Rect information for drawing formatted text
    #               And Returns A Rect with this information
    #               x, x coordinate where drawing ends
    #               y, y coordinate where drawing ends
    #               width, the width sent to this method
    #               height, the height of all of the text drawn
    #   Author    : Trickster
    #   Call Info : Five Arguments
    #               Integer X and Y, Define Position
    #               Integer Width, defines the width of the text rectangle
    #               Integer Height, defines the height of the text
    #               String Text, Text to get information for
    #-------------------------------------------------------------------------
    def get_formatted_size(x, y, width, height, text)
      # Make a Copy and Save
      text = text.dup
      # Replace C[Hex+ or N] I[] B[] with nothing
      text.gsub!(/[BbIiCc]\[([A-F a-f 0-9]+|N)*\]/) {''}
      # Replace T[] with \004
      text.gsub!(/[Tt]\[\]/) {" \004 "}
      # Replace N[] with \005
      text.gsub!(/[Nn]\[\]/) {" \005 "}
      # Setup Cx and Cy
      cx, cy = 0, 0
      # Run Through each text
      text.split(/\s/).each do |word|
        # If \004 is included
        if word.include?("\004")
          # Add Four Spaces
          x += text_size('    ').width
          # Go to Next Text
          next
        end
        # If \005 is included
        if word.include?("\005")
          # Move to new line
          cy = cx / width + 1
          # Move to start
          cx = cy * width
          # Go to Next Text
          next
        end
        # Get Word Width
        word_width = text_size("#{word} ").width
        # If can't fit on line
        if (cx + word_width) % width < x % width
          # Move to new line
          cy = cx / width + 1
          # Move to start
          cx = cy * width
        end
        # Add Width to X
        cx += word_width
        # Get Draw X and Y
        dx = cx % width + x
        dy = cx / width * height + y
      end
      # Return Rect Object
      return Rect.new(dx, dy, width, (dy - y + height).to_i)
    end
    #-------------------------------------------------------------------------
    #   Name      : Get Wrapped Text Size
    #   Info      : Gets Rect information for drawing wrapped text
    #               And Returns A Rect with this information
    #               x, x coordinate where drawing ends
    #               y, y coordinate where drawing ends
    #               width, the width sent to this method
    #               height, the height of all of the text drawn
    #   Author    : Trickster
    #   Call Info : Five Arguments
    #               Integer X and Y, Define Position
    #               Integer Width, defines the width of the text rectangle
    #               Integer Height, defines the height of the text
    #               String Text, Text to get information for
    #-------------------------------------------------------------------------
    def text_wrap_size(x, y, width, height, text)
      # Get Array of Text
      strings = text.split
      # Form Rect Object
      rect = Rect.new(x, y, width, 1)
      # Run Through Array of Strings
      strings.each do |string|
        # Get Word
        word = string + ' '
        # Get Word Width
        word_width = text_size(word).width
        # If Can't Fit on Line move to next one
        x, y = 0, y + height if x + word_width > width
        # Add To X
        x += word_width
      end
      # Set Rect Information
      rect.x, rect.height = x, y - rect.y
      rect.y = y
      # Return Rect
      return rect
    end
    #--------------------------------------------------------------------------
    #   Name      : Draw Formatted Text
    #   Info      : Draws Formatted Wrapped Text
    #   Author    : Trickster
    #   Call Info : Five Arguments
    #               Integer Offset_x and Offset_Y, define starting position
    #               Integer Width, defines the width of the text rectangle
    #               Integer Height, defines the height of the text drawn
    #               String Text, The text to be drawn
    #   Comment   : C[rrggbb] -> Change Color values are in hex
    #               C[N] -> Change Color to Normal Color (255, 255, 255)
    #               B[] -> Turns on/off Bold
    #               I[] -> Turns on/off Italics
    #               T[] -> Tab (4 Spaces)
    #               N[] -> Newline 
    #-------------------------------------------------------------------------
    #-------------------------------------------------------------------------
    #   Name:      Draw Formatted Text
    #   Info:      Draws Formatted Wrapped Text
    #   Author:    Trickster
    #   Call Info: Five Arguments
    #              Integer Offset_x and Offset_Y, define starting position
    #              Integer Width, defines the width of the text rectangle
    #              Integer Height, defines the height of the text drawn
    #              String Text, The text to be drawn
    #   Comments:  C[rrggbb] -> Change Color values are in hex
    #              C[N] -> Change Color to Normal Color
    #              B[] -> Turns on/off Bold
    #              I[] -> Turns on/off Italics
    #              T[] -> Tab (4 Spaces)
    #              N[] -> Newline 
    #-------------------------------------------------------------------------
    def draw_formatted_text(x, y, width, height, text)
      # Set to Normal Color (White)
      self.font.color = Color.new(255, 255, 255)
      # Make Copy of Text Sent
      text = text.dup
      # Replace C[Hex+] or C[N] with \001[Matched]
      text.gsub!(/[Cc]\[((([A-F]|[a-f]|[0-9])+)|N)\]/) {" \001[#{$1}] "}
      # Replace B[] with \002
      text.gsub!(/[Bb]\[\]/) {" \002 "}
      # Replace I[] with \003
      text.gsub!(/[Ii]\[\]/) {" \003 "}
      # Replace T[] with \004
      text.gsub!(/[Tt]\[\]/) {" \004 "}
      # Replace N[] with \005
      text.gsub!(/[Nn]\[\]/) {" \005 "}
      # Setup Cx and Cy
      cx, cy = 0, 0
      # Run Through each text
      while ((word = text.slice!(/(\S+\s)|(\S+)/m)) != nil)
        # If String \001 is included
        if word.include?("\001")
          # Slice from String
          word.slice!("\001")
          # Change text color
          word.sub!(/\[((([A-F]|[a-f]|[0-9])+)|N)\]\s/, "")
          # If matched is not nil and size of match is > 1
          if $1 != nil and $1.size > 1
            # Create Color
            color = Color.new($1[0..1].hex, $1[2..3].hex, $1[4..5].hex)
          else
            # Normal Color
            color = Color.new(255, 255, 255)
          end
          # Set Color
          self.font.color = color
          # Go to next text
          next
        end
        # If String \002 is included
        if word.include?("\002")
          # Invert Bold Status
          self.font.bold = !self.font.bold
          # Go to next text
          next
        end
        # If String \003 is included
        if word.include?("\003")
          # Invert Italic Status
          self.font.italic = !self.font.italic
          # Go to next text
          next
        end
        # If String \004 is included
        if word.include?("\004")
          # Add Four Spaces
          x += text_size('    ').width
          # Go to next text
          next
        end
        # If String \005 is included
        if word.include?("\005")
          # Move to new line
          cy = cx / width + 1
          # Move to start
          cx = cy * width
          # Go to next text
          next
        end
        # Get Word Width
        word_width = text_size("#{word} ").width
        # If can't fit on line
        if (cx + word_width) % width < x % width
          # Move to new line
          cy = cx / width + 1
          # Move to start
          cx = cy * width
        end
        # Get Draw X
        dx = cx % width + x
        # Get Draw Y
        dy = cx / width * height + y
        # Draw Text
        draw_text(dx, dy, word_width, 32, word)
        # Increase by Word Width
        cx += word_width
      end
    end
    #-------------------------------------------------------------------------
    #   Name      : Draw Paragraph
    #   Info      : Draws a Paragraph
    #   Author    : SephirothSpawn
    #   Call Info : Five
    #               Integer X and Y, Define Position
    #               Integer Width, defines the width of the text rectangle
    #               String Text, Information to Draw
    #               Integer Indent Amount of Space to indent by
    #               Integer Line_Height line height
    #-------------------------------------------------------------------------
    def draw_paragraph(x, y, width, text, indent = 32, line_height = 24)
      ox, oy = indent, 0
      for word in text.split
        ow = text_size(word).width
        if ow + ox > width
          ox = 0
          oy += line_height
        end
        ow = [ow, width].min
        draw_text(x + ox, y + oy, ow, line_height, word)
        ox += ow + text_size(' ').width
      end
    end
    #-------------------------------------------------------------------------
    #   Name      : Draw Wrapped Text
    #   Info      : Draws Text with Text Wrap
    #   Author    : Trickster
    #   Call Info : Five Arguments
    #               Integer X and Y, Define Position
    #               Integer Width, defines the width of the text rectangle
    #               Integer Height, defines the height of the text
    #               String Text, Text to be drawn
    #-------------------------------------------------------------------------
    def draw_wrap_text(x, y, width, height, text)
      # Get Array of Text
      strings = text.split
      # Run Through Array of Strings
      strings.each do |string|
        # Get Word
        word = string + ' '
        # Get Word Width
        word_width = text_size(word).width
        # If Can't Fit on Line move to next one
        x, y = 0, y + height if x + word_width > width
        # Draw Text Memory
        self.draw_text(x, y, word_width, height, word)
        # Add To X
        x += word_width
      end
    end
    #--------------------------------------------------------------------------
    #   Name      : Draw Icon Text
    #   Info      : Draws Icons & Text together
    #   Author    : SephirothSpawn
    #   Call Info : Five or Six Arguments
    #               X & Y - Top-left coordinates of text rectangle
    #               Width & Height - Size of text rectangle
    #               Text - String or text and icons
    #               A - alignment, same as draw_text alignment
    #   Comments  : Format for String : "text [icon_filename] text text..."
    #--------------------------------------------------------------------------
    def draw_icon_text(x, y, width, height, text, a = 0)
      # Gets Text & Icons
      text, icons = *Bitmap.string_to_text_icons(text)
      # Gets Icon, Text, Space & Total Width
      icn_w, txt_w, spc_w, tot_w = *Bitmap.icon_text_sizes(text, icons)
      # If Icon Width Greater than Width
      if icn_w + (icons.size - 1) * spc_w > width
        # Print Error
        p 'Text Width Not Big Enough.'
        return
      end
      # If Total Width Less than Text W
      if tot_w <= width
        # Gets Start Point
        ox = a == 0 ? 0 : a == 1 ? width / 2 - tot_w / 2 : width - tot_w
        # Pass Through Text
        text.each do |word|
          # If Word is nil
          if word.nil?
            # Gets Icon
            icon = icons.shift
            # Next if Nil Icon
            next if icon.nil?
            # Draws Icon
            x_, y_ = x + ox, y + (height - icon.height) / 2
            self.blt(x_, y_, icon, icon.rect, self.font.color.alpha)
            # Adds to OX
            ox += icon.width + spc_w
            next
          end
          # Draws Text
          self.draw_text(x + ox, y, width, height, word)
          # Adds to OX
          ox += self.text_size(word).width + spc_w
        end
      # If Total Width Greater than Text W
      else
        # Gets Difference
        diff = width - icn_w
        # Percent Txt Width
        percent = (txt_w + (icons.size - 1) * spc_w) / width.to_f
        # Alter Space Width
        spc_w = Integer(spc_w * percent)
        # Gets Start Point
        ox = 0
        # Pass Through Text
        text.each do |word|
          # If Word is nil
          if word.nil?
            # Gets Icon
            icon = icons.shift
            # Next if Nil Icon
            next if icon.nil?
            # Draws Icon
            x_, y_ = x + ox, y + (height - icon.height) / 2
            self.blt(x_, y_, icon, icon.rect, self.font.color.alpha)
            # Adds to OX
            ox += icon.width + spc_w
            next
          end
          # Draws Text
          w_ = Integer(self.text_size(word).width * percent)
          self.draw_text(x + ox, y, w_, height, word)
          # Adds to OX
          ox += w_ + spc_w
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Object Aliasing
    #--------------------------------------------------------------------------
    if @font_addons_alias.nil?
      alias_method :basic_draw_text, :draw_text
      @font_addons_alias = true
    end
    #--------------------------------------------------------------------------
    # * Draw Text
    #--------------------------------------------------------------------------
    def draw_text(*args)
      # Create Conditions Hash
      conditions = {
        :draw_text_shadow        => self.font.shadow, 
        :draw_text_outline       => self.font.outline,
        :draw_text_underline     => self.font.underline,
        :draw_text_strikethrough => self.font.strikethrough, 
        :draw_text_gradient      => self.font.vert_grad || self.font.horiz_grad
      }
      # Pass through font effects
      for effect in Font::Addon_Order
        # If Draw Text
        if effect == :draw_text
          basic_draw_text(*args)
          next
        end
        # If Condition
        if conditions[effect]
          # Call Method
          send(effect, *args)
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Draw Text : Get Positions
    #--------------------------------------------------------------------------
    def draw_text_positions(*args)
      if (r = args[0]).is_a?(Rect)
        x, y, w, h, t = r.x, r.y, r.width, r.height, args[1]
        a = args.size == 3 ? args[2] : 0
      else
        x, y, w, h, t = args[0], args[1], args[2], args[3], args[4]
        a = args.size == 6 ? args[5] : 0
      end
      return x, y, w, h, t, a
    end
    #--------------------------------------------------------------------------
    # * Draw Text : Effect Shadow
    #--------------------------------------------------------------------------
    def draw_text_shadow(*args)
      orig_color = font.color.dup
      self.font.color = self.font.shadow_color
      x, y, w, h, t, a = *draw_text_positions(*args)
      basic_draw_text(x + 2, y + 2, w, h, t, a)
      self.font.color = orig_color
    end
    #--------------------------------------------------------------------------
    # * Draw Text : Outline Shadow
    #--------------------------------------------------------------------------
    def draw_text_outline(*args)
      orig_color = font.color.dup
      self.font.color = self.font.outline_color
      x, y, w, h, t, a = *draw_text_positions(*args)
      for i in -1..1
        for j in -1..1
          basic_draw_text(x + i, y + j, w, h, t, a)
        end
      end
      self.font.color = orig_color
    end
    #--------------------------------------------------------------------------
    # * Draw Text : Effect Underline
    #--------------------------------------------------------------------------
    def draw_text_underline(*args)
      u_color = font.color.dup
      x, y, w, h, t, a = *draw_text_positions(*args)
      ux = x
      uy = y + h / 2 + font.size / 3
      if font.underline_full
        uw = w
      else
        uw = text_size(args[1]).width
        ux += a == 1 ? w / 2 - uw / 2 : w - uw
      end
      fill_rect(u_x, u_y, u_width, 1, u_color)
    end
    #--------------------------------------------------------------------------
    # * Draw Text : Effect Strikethrough
    #--------------------------------------------------------------------------
    def draw_text_strikethrough(*args)
      x, y, w, h, t, a = *draw_text_positions(*args)
      sx = x
      sy = y + h / 2
      if font.strikethrough_full
        sw = w
      else
        sw = text_size(args[1]).width
        sx += a == 1 ? w / 2 - sw / 2 : w - sw
      end
      fill_rect(s_x, s_y, s_width, 1, s_color)
    end
    #--------------------------------------------------------------------------
    # * Draw Text : Effect Gradient
    #--------------------------------------------------------------------------
    def draw_text_gradient(*args)
      x, y, w, h, t, a = *draw_text_positions(*args)
      # If Draw Vertical Font Gradient
      if self.font.vert_grad || self.font.horiz_grad
        # Creates Dummy Bitmap
        dummy = Bitmap.new(w, h)
        dummy.font = font
        dummy.font.vert_grad = false
        dummy.font.horiz_grad = false
        dummy.basic_draw_text(0, 0, w, h, t, a)
        # Gets Cached Bitmap
        if font.vert_grad
          # Applys Gradient Pixel Change
          dummy.v_gradient_pixel_change(font.grad_s_color, font.grad_e_color)
        else
          # Applys Gradient Pixel Change
          dummy.h_gradient_pixel_change(font.grad_s_color, font.grad_e_color)
        end
        # Draw Dummy Bitmap over self
        self.blt(x, y, dummy, dummy.rect)
      end
    end
  end
  
  
  #============================================================================== 
  # ** RGSS.Color.compare
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Adds Color Comparision methods too the color class
  #  
  # Method List:
  # ------------
  # ==
  # same?
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Color.compare'
  
  #==============================================================================
  # ** Color
  #==============================================================================
  
  class Color
    #-------------------------------------------------------------------------
    #   Name      : == (Equals Comparison)
    #   Info      : Comparision Method (checks if r, g, b, and a are equal)
    #   Author    : Trickster
    #   Call Info : Color other color to test
    #-------------------------------------------------------------------------
    def ==(other)
      return (red == other.red && green == other.green && blue == other.blue && 
      alpha == other.alpha)
    end
    #-------------------------------------------------------------------------
    #   Name      : Same?
    #   Info      : Same Color (r, g, and b are equal)
    #   Author    : Trickster
    #   Call Info : Color other color to test
    #-------------------------------------------------------------------------
    def same?(other)
      return (red == other.red && green == other.green && blue == other.blue)
    end
  end
  
  #============================================================================== 
  # ** RGSS.Color.hsb
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Adds a new color space to the Color class that allows to change the hue
  # saturation and value (brightness). Also adds methods to create new colors
  # based on an Hue, Saturation, and Brightness value. The Domain and Range
  # of the three new values are Hue - [0-360), Saturation [0-100], 
  # Brightness [0-100].
  # Formula is from the wikipedia.
  #  
  # Method List:
  # ------------
  # Color.to_hsb
  # Color.hsb_new
  # Color.hsb_to_rgb
  # to_hsb
  # to_rgb
  # hue
  # saturation
  # brightness
  # value
  # hue=
  # saturation=
  # brightness=
  # value=
  #  
  # Modified Methods:
  # -----------------
  # initialize
  # set
  # red=
  # green=
  # blue=
  #  
  # Deprecated Methods from V1.5:
  # -----------------------------
  # hsb_to_rgb
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Color.hsb'
  
  #==============================================================================
  # ** Color
  #==============================================================================
  
  class Color
    #-------------------------------------------------------------------------
    # * Alias Listings
    #-------------------------------------------------------------------------
    unless self.method_defined?(:trick_color_hsb_initialize)
      alias_method :trick_color_hsb_initialize, :initialize
      alias_method :trick_color_hsb_set, :set
      alias_method :trick_color_hsb_red=, :red=
      alias_method :trick_color_hsb_green=, :green=
      alias_method :trick_color_hsb_blue=, :blue=
    end
    #-------------------------------------------------------------------------
    # * Object Initialization
    #-------------------------------------------------------------------------
    def initialize(*args)
      trick_color_hsb_initialize(*args)
      @hue, @saturation, @brightness = to_hsb
    end
    #-------------------------------------------------------------------------
    # * Set
    #-------------------------------------------------------------------------
    def set(*args)
      trick_color_hsb_set(*args)
      @hue, @saturation, @brightness = to_hsb
    end
    #-------------------------------------------------------------------------
    # * Red
    #-------------------------------------------------------------------------
    def red=(red)
      # The Usual
      self.trick_color_hsb_red=(red)
      # Update HSB
      @hue, @saturation, @brightness = to_hsb
    end
    #-------------------------------------------------------------------------
    # * Green
    #-------------------------------------------------------------------------  
    def green=(green)
      # The Usual
      self.trick_color_hsb_green=(green)
      # Update HSB
      @hue, @saturation, @brightness = to_hsb
    end
    #-------------------------------------------------------------------------
    # * Blue
    #-------------------------------------------------------------------------
    def blue=(blue)
      # The Usual
      self.trick_color_hsb_blue=(blue)
      # Update HSB
      @hue, @saturation, @brightness = to_hsb
    end
    #-------------------------------------------------------------------------
    # * Name      : To HSB (Class method)
    #   Info      : Converts to Hue, Saturation, and Brightness
    #               returns an array setup like so: [hue, sat, bright]
    #   Author    : Trickster
    #   Call Info : One or Three Arguments
    #               For One Argument - Color color Color to convert
    #               For Three Arguments - Integer red, blue, green color values to
    #                convert
    #-------------------------------------------------------------------------
    def self.to_hsb(r, g, b)
      # Correction if Greater than 255
      r,g,b = [r,g,b].collect! {|color| color = 255 if color > 255}
      # Get Maximum
      max = [r,g,b].max.to_f
      # Get Minimum
      min = [r,g,b].min.to_f
      # Calculate hue
      h = 60 * (g - b) / (max - min) if max == r and g >= b
      h = 60 * (g - b) / (max - min) + 360 if max == r and g < b
      h = 60 * (b - r) / (max - min) + 120 if max == g
      h = 60 * (r - g) / (max - min) + 240 if max == b
      h = 0 if max == min
      # Calculate Saturation
      s = max == 0 ? 0 : 100 * (1-min/max)
      # Calculate Brightness
      v = 100 * max / 255
      # Return Hue, Saturation, And Value
      return h,s,v
    end 
    #-------------------------------------------------------------------------
    # * Name      : To HSB
    #   Info      : Converts to Hue, Saturation, and Brightness
    #               returns an array setup like so: [hue, sat, bright]
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def to_hsb
      return self.class.to_hsb(red, green, blue)
    end
    #-------------------------------------------------------------------------
    # * Name      : HSB New (Class Method)
    #   Info      : Creates a new color based on Hue Sat and Brightness + Alpha
    #   Author    : Trickster
    #   Call Info : Three or Four Arguements
    #               Integer hue,sat,bri - Hue, Saturation, and Brightness
    #               Integer Alpha - Transparency Defaults to 255
    #-------------------------------------------------------------------------
    def self.hsb_new(hue, sat, bri, alpha = 255)
      # Get Colors
      red, green, blue = Color.hsb_to_rgb(hue, sat, bri)
      # Create and Return Color
      return Color.new(red, green, blue, alpha)
    end 
    #-------------------------------------------------------------------------
    # * Name      : HSB To RGB
    #   Info      : HSB to RGB Color Conversion
    #               An array setup like so [red, green, blue]
    #   Author    : Trickster
    #   Call Info : Three Arguments.
    #               Integer hue,sat,bri - Hue, Saturation, and Brightness
    #-------------------------------------------------------------------------
    def self.hsb_to_rgb(hue, sat, bri)
      # Convert All To Floats
      hue, sat, bri = hue.to_f, sat.to_f , bri.to_f
      # Ensure Hue is [0, 360)
      hue %= 360
      # Reduce to [0, 1]
      sat = sat > 100 ? 1.0 : sat / 100
      bri = bri > 100 ? 1.0 : bri / 100
      # Get Sector
      sector = (hue / 60).to_i
      f = hue / 60 - sector
      p = bri * (1 - sat)
      q = bri * (1 - f * sat)
      t = bri * (1 - (1 - f) * sat)
      # Branch By Sector and get r,g,b values
      case sector
      when 0...1
        r,g,b = bri,t,p
      when 1...2
        r,g,b = q,bri,p
      when 2...3
        r,g,b = p,bri,t
      when 3...4
        r,g,b = p,q,bri
      when 4...5
        r,g,b = t,p,bri
      when 5..6
        r,g,b = bri,p,q
      end
      # Set Color
      color = [r,g,b]
      # Convert to [0, 255] Range
      color.collect! {|value| value * 255}
      # Return Color
      return color
    end
    #-------------------------------------------------------------------------
    # * Name      : To RGB
    #   Info      : Converts to Red, Green, Blue
    #   Author    : Trickster
    #   Call Info : An Array setup like so [red, green, blue]
    #   Comment   : Not Very Useful, but included anyway.
    #-------------------------------------------------------------------------
    def to_rgb 
      return red, green, blue
    end
    #-------------------------------------------------------------------------
    # * Name      : Get Hue
    #   Info      : Gets the hue
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def hue
      # If Hue is undefined set HSB
      @hue, @saturation, @brightness = to_hsb if @hue == nil
      # Return hue
      return @hue
    end
    #-------------------------------------------------------------------------
    # * Name      : Get Saturation
    #   Info      : Gets the Saturation
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def saturation
      # If Saturation is undefined set HSB
      @hue, @saturation, @brightness = to_hsb if @saturation == nil
      # Return Saturation
      return @saturation
    end
    #-------------------------------------------------------------------------
    # * Name      : Get Brightness
    #   Info      : Gets the Brightness
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def brightness
      # If Brightness is undefined set HSB
      @hue, @saturation, @brightness = to_hsb if @brightness == nil
      # Return Brightness
      return @brightness
    end
    #-------------------------------------------------------------------------
    # * Name      : Get Value
    #   Info      : Gets the Value
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def value
      return brightness
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Hue
    #   Info      : Sets the Hue, Updates RGB
    #   Author    : Trickster
    #   Call Info : One Arguement Integer new_hue, The New Hue
    #   Comment   : May be used as a replacement to <bitmap>.hue_change, which
    #               lags and when used many times creates graphical errors
    #-------------------------------------------------------------------------  
    def hue=(new_hue)
      # Set HSB if Hue is nil
      @hue, @saturation, @brightness = to_hsb if @hue == nil
      # Ensure domain [0, 360) and set to new hue
      @hue = new_hue % 360
      # Get RGB Values
      rgb = Color.hsb_to_rgb(@hue, @saturation, @brightness)
      # Set Red Green And Blue Values by Converting to rgb
      self.red, self.green, self.blue = rgb
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Saturation
    #   Info      : Sets the Saturation, Updates RGB
    #   Author    : Trickster
    #   Call Info : One Arguement Integer new_sat, The New Saturation
    #-------------------------------------------------------------------------
    def saturation=(new_sat)
      # Set HSB if Saturation is nil
      @hue, @saturation, @brightness = self.to_hsb if @saturation == nil
      # Set Saturation
      @saturation = new_sat
      # Get RGB Values
      rgb = Color.hsb_to_rgb(@hue, @saturation, @brightness)
      # Set Red Green And Blue Values by Converting to rgb
      self.red, self.green, self.blue = rgb
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Brightness
    #   Info      : Sets the Brightness, Updates RGB
    #   Author    : Trickster
    #   Call Info : One Arguement Integer new_bri, The New Brightness
    #-------------------------------------------------------------------------
    def brightness=(new_bri)
      # Set HSB if Brightness is nil
      @hue, @saturation, @brightness = self.to_hsb if @brightness == nil
      # Set New Brightness
      @brightness = new_bri
      # Get RGB Values
      rgb = Color.hsb_to_rgb(@hue, @saturation, @brightness)
      # Set Red Green And Blue Values by Converting to rgb
      self.red, self.green, self.blue = rgb
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Value
    #   Info      : Sets the Value, Updates RGB
    #   Author    : Trickster
    #   Call Info : One Arguement Integer new_val, The New Value
    #   Comment   : Synomym for brightness=
    #-------------------------------------------------------------------------
    def value=(val)
      # Set Brightness
      self.brightness = val
    end
  end
  
  #============================================================================== 
  # ** RGSS.Enemy and Troop Info
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # These set of methods add observer methods to the Game_Enemy and Game_Troop
  # classes, you can get information on how weak an enemy is to a state, all
  # of the enemies resistances and weaknesses, etc.
  #  
  # Method List:
  # ------------
  #
  #   Game_Enemy
  #   ----------
  #   character_name
  #   character_hue
  #   element_effectiveness
  #   state_effectiveness
  #   skills
  #   elements
  #   element_test
  #   weaknesses
  #   resistance
  #    
  #   Game_Troop
  #   ----------
  #   strongest
  #   weakest
  #   existing_enemies
  #   has_enemies?
  #
  #   RGP::Enemy
  #   ----------
  #   element_test
  #   weakness
  #   resistance
  #
  #   RPG::Troop
  #   ----------
  #   has_enemy?
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Enemy and Troop Info'
  
  #==============================================================================
  # ** Game_Enemy
  #==============================================================================
  
  class Game_Enemy
    #-------------------------------------------------------------------------
    # * Name      : Character Name
    #   Info      : Returns Character Filename (Battler Name by Default)
    #   Author    : SephirothSpawn
    #   Call Info : None
    #-------------------------------------------------------------------------
    def character_name
      return self.battler_name
    end
    #-------------------------------------------------------------------------
    # * Name      : Character Hue
    #   Info      : Returns Character Filename Hue (Battler Hue by Default)
    #   Author    : SephirothSpawn
    #   Call Info : None
    #-------------------------------------------------------------------------
    def character_hue
      return self.battler_hue
    end
    #-------------------------------------------------------------------------
    #   Name      : Element Effectiveness
    #   Info      : How Effective Enemy is against an Element
    #               An Integer from 0-5 (5: most effective 0: not effective at all)
    #   Author    : Trickster
    #   Call Info : Integer Element_ID id of the element to check
    #-------------------------------------------------------------------------
    def element_effectiveness(element_id)
      # Get a numerical value corresponding to element effectiveness
      table = [0,5,4,3,2,1,0]
      effective = table[$data_enemies[@enemy_id].element_ranks[element_id]]
      # If protected by state, this element is reduced by half
      for i in @states
        if $data_states[i].guard_element_set.include?(element_id)
          effective = (effective / 2.0).ceil
        end
      end
      # End Method
      return effective
    end
    #-------------------------------------------------------------------------
    #   Name      : State Effectiveness
    #   Info      : How Effective Enemy is against a State
    #               An Integer from 0-5 (5: most effective 0: ineffective)
    #   Author    : Trickster
    #   Call Info : Integer State_ID id of the state to check
    #-------------------------------------------------------------------------
    def state_effectiveness(state_id)
      table = [0,5,4,3,2,1,0]
      effective = table[$data_enemies[@enemy_id].state_ranks[state_id]]
      return effective
    end
    #-------------------------------------------------------------------------
    #   Name      : Enemies Skills
    #   Info      : Returns all skills enemy can use
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def skills
      data = []
      actions.each {|action| data << action.skill_id if action.kind == 1}
      return data
    end
    #-------------------------------------------------------------------------
    #   Name      : Enemy's Elements
    #   Info      : Returns All Elements Enemy can use
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def elements
      elements = []
      skills.each {|skill_id| elements += $data_skills[skill_id].element_set}
      elements += element_set
      elements.uniq!
      return elements
    end
    #-------------------------------------------------------------------------
    # * Name      : Element Test
    #   Info      : Returns Element Effiency Value
    #               An Integer 1-6 representing the effiency
    #   Author    : Trickster
    #   Call Info : One Argument Element_Id the element Id to test
    #-------------------------------------------------------------------------
    def element_test(element_id)
      # Get a numerical value corresponding to element effectiveness
      table = [0,6,5,4,3,2,1]
      result = table[$data_enemies[@enemy_id].element_ranks[element_id]]
      return result
    end
    #-------------------------------------------------------------------------
    # * Name      : Weaknesses
    #   Info      : Returns Enemy Weaknesses
    #               An Array of Element Ids for which an A or B effiency
    #   Author    : Trickster
    #   Call Info : None
    #-------------------------------------------------------------------------
    def weaknesses
      weak = []
      MACL::Real_Elements.each {|i| weak << i if [6,5].include?(element_test(i))}
      return weak
    end
    #-------------------------------------------------------------------------
    # * Name      : Resistance
    #   Info      : Returns Enemy Resistance
    #               An Array of Element Ids for which an F or E or D effiency
    #   Author    : Trickster
    #   Call Info : None
    #-------------------------------------------------------------------------
    def resistance
      resists = []
      MACL::Real_Elements.each {|i| resists << i if [1,2,3].include?(element_test(i))}
      return resists
    end
  end
  
  #==============================================================================
  # ** Game_Troop
  #==============================================================================
  
  class Game_Troop
    #-------------------------------------------------------------------------
    #   Name      : Strongest Enemy in Troop
    #   Info      : Gets Strongest Enemy, in terms of hp
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def strongest
      array = enemies.sort {|a,b| b.hp - a.hp}
      return array[0]
    end
    #-------------------------------------------------------------------------
    #   Name      : Weakest Enemy in Troop
    #   Info      : Gets Weakest Enemy, in terms of hp
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def weakest
      array = existing_enemies.sort! {|a,b| b.hp - a.hp}
      return array[-1]
    end
    #-------------------------------------------------------------------------
    #   Name      : Get Existing Enemies
    #   Info      : Gets All Non-Dead, Non-Hidden Enemies
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def existing_enemies
      array = []
      enemies.each {|enemy| array << enemy if enemy.exist?}
      return array
    end
    #-------------------------------------------------------------------------
    # * Name      : Has Enemies?
    #   Info      : Are These Enemy Ids in troop?
    #   Author    : Trickster
    #   Call Info : Variable Amount Integer Enemy enemy id to check
    #-------------------------------------------------------------------------
    def has_enemies?(*enemies)
      # Setup Array
      enemy_ids = []
      # Get All Enemy IDs
      @enemies.each {|enemy| enemy_ids << enemy.id}
      # Run Through All Enemies Sent
      enemies.each_with_index do |enemy_id, index|
        # Return false if not included
        return false if not enemy_ids.include?(enemy_id)
        # Delete from Enemies
        enemies.delete_at(index)
        # Delete ONE from Enemy Ids
        enemy_ids.delete_at(enemy_ids.index(enemy_id))
      end
      # All Are Included
      return true
    end
  end
  
  #==============================================================================
  # ** RPG::Enemy
  #==============================================================================
  
  class RPG::Enemy
    #-------------------------------------------------------------------------
    # * Name      : Element Test
    #   Info      : Returns Element Effiency Value
    #               An Integer 1-6 representing the effiency
    #   Author    : Trickster
    #   Call Info : One Argument Element_Id the element Id to test
    #-------------------------------------------------------------------------
    def element_test(element_id)
      # Get a numerical value corresponding to element effectiveness
      return [0,6,5,4,3,2,1][element_ranks[element_id]]
    end
    #-------------------------------------------------------------------------
    # * Name      : Weaknesses
    #   Info      : Returns Enemy Weaknesses
    #               An Array of Element Ids for which an A or B effiency
    #   Author    : Trickster
    #   Call Info : None
    #-------------------------------------------------------------------------
    def weaknesses
      weak = []
      MACL::Real_Elements.each do |element_id|
        weak << element_id if [6,5].include?(element_test(element_id))
      end
      return weak
    end
    #-------------------------------------------------------------------------
    # * Name      : Resistance
    #   Info      : Returns Enemy Resistance
    #               An Array of Element Ids for which an F or E effiency
    #   Author    : Trickster
    #   Call Info : None
    #-------------------------------------------------------------------------
    def resistance
      resists = []
      MACL::Real_Elements.each do |element_id|
        resists << element_id if [1,2].include?(self.element_test(element_id))
      end
      return resists
    end
  end
  
  #==============================================================================
  # ** RPG::Troop
  #==============================================================================
  
  class RPG::Troop
    #-------------------------------------------------------------------------
    # * Name      : Has Enemy?
    #   Info      : Does Troop have enemy id in members
    #   Author    : Trickster
    #   Call Info : One Argument Integer Enemy id - Enemy Id to check
    #-------------------------------------------------------------------------
    def has_enemy?(enemy_id)
      # Run through each member and return true if included
      self.members.each {|member| return true if member.enemy_id == enemy_id}
      # Not In Troop
      return false
    end
  end
  
  #============================================================================== 
  # ** RGSS.Font
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # This sections improves the font class to allow for more font styles, such as
  # shadow and outline and strikethrough.
  #  
  # Method List:
  # ------------
  # Font.default_underline=
  # Font.default_underline
  # Font.default_underline_full=
  # Font.default_underline_full
  # Font.default_strikethrough=
  # Font.default_strikethrough
  # Font.default_strikethrough_full=
  # Font.default_strikethrough_full
  # Font.default_shadow=
  # Font.default_shadow
  # Font.default_shadow_color=
  # Font.default_shadow_color
  # Font.default_outline=
  # Font.default_outline
  # Font.default_outline_color=
  # Font.default_outline_color
  # Font.default_vert_grad=
  # Font.default_vert_grad
  # Font.default_horiz_grad=
  # Font.default_horiz_grad
  # Font.default_grad_s_color=
  # Font.default_grad_s_color
  # Font.default_grad_e_color=
  # Font.default_grad_e_color
  # underline=
  # underline
  # underline_full=
  # underline_full
  # strikethrough=
  # strikethrough
  # strikethrough_full=
  # strikethrough_full
  # shadow_color=
  # shadow_color
  # outline_color=
  # outline_color
  # shadow=
  # shadow
  # outline=
  # outline
  # vert_grad=
  # vert_grad
  # horiz_grad=
  # horiz_grad
  # grad_s_color=
  # grad_s_color
  # grad_e_color=
  # grad_e_color
  # ==(other)
  #  
  # Modified Methods:
  # -----------------
  # initailzie
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Font'
  
  #==============================================================================
  # ** Font
  #==============================================================================
  
  class Font
    #--------------------------------------------------------------------------
    # * Class Variables
    #--------------------------------------------------------------------------
    class_accessor :default_underline
    class_accessor :default_underline_full
    class_accessor :default_strikethrough
    class_accessor :default_strikethrough_full
    class_accessor :default_shadow
    class_accessor :default_shadow_color
    class_accessor :default_outline
    class_accessor :default_outline_color
    class_accessor :default_vert_grad
    class_accessor :default_horiz_grad
    class_accessor :default_grad_s_color
    class_accessor :default_grad_e_color
    #--------------------------------------------------------------------------
    # * Class Variable Declaration
    #--------------------------------------------------------------------------
    Font.default_underline          = Default_Underline
    Font.default_underline_full     = Default_Underline_Full
    Font.default_strikethrough      = Default_Strikethrough
    Font.default_strikethrough_full = Default_Strikethrough_Full
    Font.default_shadow             = Default_Shadow
    Font.default_shadow_color       = Default_Shadow_Color
    Font.default_outline            = Default_Outline
    Font.default_outline_color      = Default_Outline_Color
    Font.default_vert_grad          = Default_Vert_Grad
    Font.default_horiz_grad         = Default_Horiz_Grad
    Font.default_grad_s_color       = Default_Grad_S_Color
    Font.default_grad_e_color       = Default_Grad_E_Color
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :underline
    attr_accessor :underline_full
    attr_accessor :strikethrough
    attr_accessor :strikethrough_full
    attr_accessor :shadow_color
    attr_accessor :outline_color
    attr_reader   :shadow
    attr_reader   :outline
    attr_reader   :vert_grad
    attr_reader   :horiz_grad
    attr_accessor :grad_s_color
    attr_accessor :grad_e_color
    #--------------------------------------------------------------------------
    # * Alias Listings
    #--------------------------------------------------------------------------
    alias_method :macl_rgssfont_init, :initialize
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(*args)
      # Set font settings
      @underline          = Font.default_underline
      @underline_full     = Font.default_underline_full
      @strikethrough      = Font.default_strikethrough
      @strikethrough_full = Font.default_strikethrough_full
      @shadow_color       = Font.default_shadow_color
      @outline_color      = Font.default_outline_color
      @shadow             = Font.default_shadow
      @outline            = Font.default_outline
      @vert_grad          = Font.default_vert_grad
      @horiz_grad         = Font.default_horiz_grad
      @grad_s_color       = Font.default_grad_s_color
      @grad_e_color       = Font.default_grad_e_color
      # Original Initialization
      macl_rgssfont_init(*args)
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Shadow
    #   Info      : Sets Shadow Flag
    #   Author    : Yeyinde
    #   Call Info : One Argument Boolean bool flag
    #-------------------------------------------------------------------------
    def shadow=(bool)
      @shadow = bool
      @outline = false unless bool == false
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Outline
    #   Info      : Sets Outline Flag
    #   Author    : Yeyinde
    #   Call Info : One Argument Boolean bool flag
    #-------------------------------------------------------------------------
    def outline=(bool)
      @shadow = false unless bool == false
      @outline = bool
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Vert Gradient
    #   Info      : Sets Vert Gradient Flag
    #   Author    : SephirothSpawn
    #   Call Info : One Argument Boolean bool flag
    #-------------------------------------------------------------------------
    def vert_grad=(bool)
      @vert_grad = bool
      @horiz_grad = false unless bool == false
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Horiz Gradient
    #   Info      : Sets Horiz Gradient Flag
    #   Author    : SephirothSpawn
    #   Call Info : One Argument Boolean bool flag
    #-------------------------------------------------------------------------
    def horiz_grad=(bool)
      @vert_grad = false unless bool == false
      @horiz_grad = bool
    end
    #-------------------------------------------------------------------------
    #   Name      : == (Comparision Equals)
    #   Info      : Compares two Fonts
    #   Author    : Trickster
    #   Call Info : One Argument Font other, Font to Check
    #-------------------------------------------------------------------------
    def ==(other)
      attr = %w( name size color bold italic underline underline_full strikethrough
      strikethrough_full shadow_color outline_color shadow outline vert_grad
      horiz_grad grad_s_color grad_e_color)
      attr.each do |var| 
        return false if method(var).call != other.method(var).call
      end
      return true
    end
  end
  
  
  #============================================================================== 
  # ** RGSS.Interpreter
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Miscellaneous methods for RGSS classes.
  #  
  # Method List:
  # ------------
  # event
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Interpreter'
  
  #==============================================================================
  # ** Interpreter
  #==============================================================================
  
  class Interpreter
    #--------------------------------------------------------------------------
    # * Name      : Event
    #   Info      : Returns Interpreter Event
    #   Author    : Near Fantastica
    #   Call Info : Nothing
    #--------------------------------------------------------------------------
    def event
      return $game_map.events[@event_id]
    end
  end
  
  #============================================================================== 
  # ** RGSS.Map
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # These set of methods add to the map classes, game, spriteset & scene.
  #  
  # Method List:
  # ------------
  #
  #   Game_Map
  #   --------
  #   characters
  #   add_event
  #   delete_event
  #   add_character
  #   delete_character
  #   event?
  #   event_at
  #   character?
  #   character_at
  #   tile_terrain
  #   terrain_ids
  #    
  #   Spriteset_Map
  #   -------------
  #   add_character
  #   delete_character
  #
  #   Scene_Map
  #   ---------
  #   spriteset
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Map'
  
  #==============================================================================
  # ** Game_Map
  #==============================================================================
  
  class Game_Map
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :characters
    #--------------------------------------------------------------------------
    # * Alias Listings
    #--------------------------------------------------------------------------
    alias_method :seph_macl_gmmap_setup,   :setup
    alias_method :seph_macl_gmmap_refresh, :refresh
    alias_method :seph_macl_gmmap_passbl?, :passable?
    alias_method :seph_macl_gmmap_update,  :update
    #--------------------------------------------------------------------------
    # * Setup
    #--------------------------------------------------------------------------
    def setup(map_id)
      # Set map characters data
      @characters = {}
      # Original Setup
      seph_macl_gmmap_setup(map_id)
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      # Original Refresh
      seph_macl_gmmap_refresh
      # If map ID is effective
      if @map_id > 0
        # Refresh all map characters
        for character in @characters.values
          character.refresh
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Determine if Passable
    #--------------------------------------------------------------------------
    def passable?(x, y, d, self_event = nil)
      # Return false if Previous Test False
      return false unless seph_macl_gmmap_passbl?(x, y, d, self_event)
      # Change direction (0,2,4,6,8,10) to obstacle bit (0,1,2,4,8,0)
      bit = (1 << (d / 2 - 1)) & 0x0f
      # Loop in all characters
      for character in @characters.values
        # If tiles other than self are consistent with coordinates
        if character.tile_id >= 0 and character != self_event and
           character.x == x and character.y == y and not character.through
          # If obstacle bit is set
          if @passages[character.tile_id] & bit != 0
            # impassable
            return false
          # If obstacle bit is set in all directions
          elsif @passages[character.tile_id] & 0x0f == 0x0f
            # impassable
            return false
          # If priorities other than that are 0
          elsif @priorities[character.tile_id] == 0
            # passable
            return true
          end
        end
      end
      # passable
      return true
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      # Original Update
      seph_macl_gmmap_update
      # Update map characters
      for character in @characters.values
        character.update
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Add Event
    #   Info      : Adds Game_Event to Game_Map#events list
    #   Author    : SephirothSpawn
    #   Call Info : RPG::Event object
    #-------------------------------------------------------------------------
    def add_event(event)
      # Change Id if Already Taken
      event.id = @events.keys.max + 1 if @events.has_key?(event.id)
      # Creates New Event
      @events[event.id] = Game_Event.new(@map_id, event)
      # Adds To Spriteset
      if $scene.is_a?(Scene_Map) && $scene.spriteset.is_a?(Spriteset_Map)
        $scene.spriteset.add_character(@events[event.id])
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Delete Event
    #   Info      : Deletes Game_Event to Game_Map#events list
    #   Author    : SephirothSpawn
    #   Call Info : Event ID
    #-------------------------------------------------------------------------
    def delete_event(event_id = 1)
      # Return if event not present
      return unless @events.has_key?(event_id)
      # Removes event from spriteset
      if $scene.is_a?(Scene_Map) && $scene.spriteset.is_a?(Spriteset_Map)
        $scene.spriteset.delete_character(@events[event_id])
      end
      # Deletes event from events list
      @events.delete(event_id)
    end
    #-------------------------------------------------------------------------
    # * Name      : Add Character
    #   Info      : Adds Game_Character to Game_Map#characters list
    #   Author    : SephirothSpawn
    #   Call Info : Game_Character, ID of Event (Auto-corrects if taken)
    #-------------------------------------------------------------------------
    def add_character(character, id = nil)
      # If ID Already taken or nil
      if id.nil? || @characters.has_key?(id)
        id = @characters.empty? ? 1 : @characters.keys.max + 1
      end
      # Creates New Event
      @characters[id] = character
      # Adds To Spriteset
      if $scene.is_a?(Scene_Map) && $scene.spriteset.is_a?(Spriteset_Map)
        $scene.spriteset.add_character(character)
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Delete Character
    #   Info      : Deletes Game_Character to Game_Map#characters list
    #   Author    : SephirothSpawn
    #   Call Info : Character ID
    #-------------------------------------------------------------------------
    def delete_character(character_id = 1)
      # Return if character not present
      return unless @characters.has_key?(character_id)
      # Removes character from spriteset
      if $scene.is_a?(Scene_Map) && $scene.spriteset.is_a?(Spriteset_Map)
        $scene.spriteset.delete_character(@characters[character_id])
      end
      # Deletes character from characters list
      @characters.delete(character_id)
    end
    #-------------------------------------------------------------------------
    # * Name      : Event?
    #   Info      : Is there an event on x and y
    #   Author    : Trickster
    #   Call Info : Two Arguments Integer X, Y - Position to Check
    #-------------------------------------------------------------------------
    def event?(x, y)
      @events.each_value do |event|
        return true if event.x == x and event.y == y
      end
      return false
    end
    #-------------------------------------------------------------------------
    # * Name      : Event at
    #   Info      : Returns event at location or nil
    #   Author    : SephirothSpawn
    #   Call Info : Two Arguments Integer X, Y - Position to Check
    #-------------------------------------------------------------------------
    def event_at(x, y)
      for event in @events.values
        return event if event.x == x && event.y == y
      end
      return nil
    end
    #-------------------------------------------------------------------------
    # * Name      : Character?
    #   Info      : Is there an character on x and y
    #   Author    : SephirothSpawn
    #   Call Info : Two Arguments Integer X, Y - Position to Check
    #-------------------------------------------------------------------------
    def character?(x, y)
      @characters.each_value do |character|
        return true if character.x == x and character.y == y
      end
      return false
    end
    #-------------------------------------------------------------------------
    # * Name      : Character at
    #   Info      : Returns character at location or nil
    #   Author    : SephirothSpawn
    #   Call Info : Two Arguments Integer X, Y - Position to Check
    #-------------------------------------------------------------------------
    def character_at(x, y)
      @characters.each_value do |character|
        return character if character.x == x and character.y == y
      end
      return nil
    end
    #-------------------------------------------------------------------------
    # * Name      : Tile Terrain
    #   Info      : Returns tile specific terrain from given x, y and layer
    #   Author    : Hanmac
    #   Call Info : x, y, z (Integer) Position
    #-------------------------------------------------------------------------
    def tile_terrain(x, y, z)
      tile_id = data[x, y, z]
      return tile_id.nil? ? 0 : @terrain_tags[tile_id]
    end
    #-------------------------------------------------------------------------
    # * Name      : Terrain IDs
    #   Info      : Returns a list of terrain ids at a x y locations
    #   Author    : Hanmac
    #   Call Info : x, y (Integer) Position
    #-------------------------------------------------------------------------
    def terrain_ids(x, y)
      return [0, 1, 2].collect {|i| tile_terrain(x, y, i)}
    end
  end
  
  #==============================================================================
  # ** Spriteset_Map
  #==============================================================================
  
  class Spriteset_Map
    #--------------------------------------------------------------------------
    # * Add Character
    #--------------------------------------------------------------------------
    def add_character(game_character)
      # Returns if Character already has sprite
      for sprite in @character_sprites
        return if sprite.character == game_character
      end
      # Adds New Sprite
      @character_sprites << Sprite_Character.new(@viewport1, game_character)
    end
    #--------------------------------------------------------------------------
    # * Delete Character
    #--------------------------------------------------------------------------
    def delete_character(game_character)
      # Pass Through Sprites
      for sprite in @character_sprites
        # If Character Matches
        if sprite.character == game_character
          # Dispose Sprite
          sprite.dispose
          # Delete from List
          @character_sprites.delete(sprite)
          break
        end
      end
    end
  end
  
  #==============================================================================
  # ** Scene_Map
  #==============================================================================
  
  class Scene_Map
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader :spriteset
  end
  
  #============================================================================== 
  # ** RGSS.RPG::AudioFile
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # New methods to add to the RPG::AudioFile class
  #  
  # Method List:
  # ------------
  # is_a_bgm?
  # is_a_bgm=
  # is_a_bgm
  # is_a_bgs?
  # is_a_bgs=
  # is_a_bgs
  # is_a_me?
  # is_a_me=
  # is_a_me
  # is_a_se?
  # is_a_se=
  # is_a_se
  # play
  # stop
  #==============================================================================
  
  MACL::Loaded << 'RGSS.RPG::AudioFile'
  
  #==============================================================================
  # ** RPG::AudioFile
  #==============================================================================
  
  class RPG::AudioFile
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :is_a_bgm
    attr_accessor :is_a_bgs
    attr_accessor :is_a_me
    attr_accessor :is_a_se
    #-------------------------------------------------------------------------
    # * Name      : Is a BGM?
    #   Info      : Test if AudioFile is BGM (In theory)
    #   Author    : SephirothSpawn
    #-------------------------------------------------------------------------
    def is_a_bgm?
      return @is_a_bgm.nil? ? @name.include?('BGM/') : @is_a_bgm
    end
    #-------------------------------------------------------------------------
    # * Name      : Is a BGS?
    #   Info      : Test if AudioFile is BGS (In theory)
    #   Author    : SephirothSpawn
    #-------------------------------------------------------------------------
    def is_a_bgs?
      return @is_a_bgs.nil? ? @name.include?('BGS/') : @is_a_bgs
    end
    #-------------------------------------------------------------------------
    # * Name      : Is a ME?
    #   Info      : Test if AudioFile is ME (In theory)
    #   Author    : SephirothSpawn
    #-------------------------------------------------------------------------
    def is_a_me?
      return @is_a_me.nil? ? @name.include?('ME/') : @is_a_me
    end
    #-------------------------------------------------------------------------
    # * Name      : Is a SE?
    #   Info      : Test if AudioFile is SE (In theory)
    #   Author    : SephirothSpawn
    #-------------------------------------------------------------------------
    def is_a_se?
      return @is_a_se.nil? ? @name.include?('SE/') : @is_a_se
    end
    #-------------------------------------------------------------------------
    # * Name      : Play
    #   Info      : Autoplays AudioFile
    #   Author    : SephirothSpawn
    #-------------------------------------------------------------------------
    def play
      if is_a_bgm?
        Audio.bgm_play(@name, @volume, @pitch)
      elsif is_a_bgs?
        Audio.bgs_play(@name, @volume, @pitch)
      elsif is_a_me?
        Audio.me_play(@name, @volume, @pitch)
      elsif is_a_se?
        Audio.se_play(@name, @volume, @pitch)
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Stop
    #   Info      : Stops AudioFile
    #   Author    : SephirothSpawn
    #-------------------------------------------------------------------------
    def stop
      if is_a_bgm?
        Audio.bgm_stop
      elsif is_a_bgs?
        Audio.bgs_stop
      elsif is_a_me?
        Audio.me_stop
      elsif is_a_se?
        Audio.se_stop
      end
    end
  end
  
  #============================================================================== 
  # ** RGSS.RPG::Cache
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # These set of methods add to the RPG::Cache.
  #  
  # Method List:
  # ------------
  # autotile_tile
  # gradient
  #==============================================================================
  
  MACL::Loaded << 'RGSS.RPG::Cache'
  
  #==============================================================================
  # ** RPG::Cache
  #==============================================================================
  
  module RPG::Cache
    #--------------------------------------------------------------------------
    # * Auto-Tiles
    #--------------------------------------------------------------------------
    Autotiles = [
      [[27, 28, 33, 34], [ 5, 28, 33, 34], [27,  6, 33, 34], [ 5,  6, 33, 34],
       [27, 28, 33, 12], [ 5, 28, 33, 12], [27,  6, 33, 12], [ 5,  6, 33, 12]],
      [[27, 28, 11, 34], [ 5, 28, 11, 34], [27,  6, 11, 34], [ 5,  6, 11, 34],
       [27, 28, 11, 12], [ 5, 28, 11, 12], [27,  6, 11, 12], [ 5,  6, 11, 12]],
      [[25, 26, 31, 32], [25,  6, 31, 32], [25, 26, 31, 12], [25,  6, 31, 12],
       [15, 16, 21, 22], [15, 16, 21, 12], [15, 16, 11, 22], [15, 16, 11, 12]],
      [[29, 30, 35, 36], [29, 30, 11, 36], [ 5, 30, 35, 36], [ 5, 30, 11, 36],
       [39, 40, 45, 46], [ 5, 40, 45, 46], [39,  6, 45, 46], [ 5,  6, 45, 46]],
      [[25, 30, 31, 36], [15, 16, 45, 46], [13, 14, 19, 20], [13, 14, 19, 12],
       [17, 18, 23, 24], [17, 18, 11, 24], [41, 42, 47, 48], [ 5, 42, 47, 48]],
      [[37, 38, 43, 44], [37,  6, 43, 44], [13, 18, 19, 24], [13, 14, 43, 44],
       [37, 42, 43, 48], [17, 18, 47, 48], [13, 18, 43, 48], [ 1,  2,  7,  8]]
    ]
    #--------------------------------------------------------------------------
    # * Autotile Cache
    #
    #   @autotile_cache = { 
    #     filename => { [autotile_id, frame_id, hue] => bitmap, ... },
    #     ...
    #    }
    #--------------------------------------------------------------------------
    @autotile_cache = {}
    #--------------------------------------------------------------------------
    # * Autotile Tile
    #--------------------------------------------------------------------------
    def self.autotile_tile(filename, tile_id, hue = 0, frame_id = nil)
      # Gets Autotile Bitmap
      autotile = self.autotile(filename)
      # Configures Frame ID if not specified
      if frame_id.nil?
        # Animated Tiles
        frames = autotile.width / 96
        # Configures Animation Offset
        fc = Graphics.frame_count / Animated_Autotiles_Frames
        frame_id = (fc) % frames * 96
      end
      # Creates list if already not created
      @autotile_cache[filename] = {} unless @autotile_cache.has_key?(filename)
      # Gets Key
      key = [tile_id, frame_id, hue]
      # If Key Not Found
      unless @autotile_cache[filename].has_key?(key)
        # Reconfigure Tile ID
        tile_id %= 48
        # Creates Bitmap
        bitmap = Bitmap.new(32, 32)
        # Collects Auto-Tile Tile Layout
        tiles = Autotiles[tile_id / 8][tile_id % 8]
        # Draws Auto-Tile Rects
        for i in 0...4
          tile_position = tiles[i] - 1
          src_rect = Rect.new(tile_position % 6 * 16 + frame_id, 
            tile_position / 6 * 16, 16, 16)
          bitmap.blt(i % 2 * 16, i / 2 * 16, autotile, src_rect)
        end
        # Saves Autotile to Cache
        @autotile_cache[filename][key] = bitmap
        # Change Hue
        @autotile_cache[filename][key].hue_change(hue)
      end
      # Return Autotile
      return @autotile_cache[filename][key]
    end
    #-------------------------------------------------------------------------
    # * Name      : Gradient
    #   Info      : Loads A Gradient Bar
    #   Author    : Trickster
    #   Call Info : One to Two Arguments 
    #               String filename of Bar to load
    #               Integer hue - hue displacement
    #   Comment   : Files are to be located in Graphics/Gradients
    #-------------------------------------------------------------------------
    def self.gradient(filename, hue = 0)
      self.load_bitmap("Graphics/Gradients/", filename, hue)
    end
  end
  
  #============================================================================== 
  # ** RGSS.RPG::State
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Miscellaneous New stuff for the RPG::State class.
  #  
  # Method List:
  # ------------
  # RPG::State.normal_icon_name
  # RPG::State.normal_icon
  # icon_name
  # icon
  #==============================================================================
  
  MACL::Loaded << 'RGSS.RPG::State'
  
  #============================================================================== 
  # ** RPG::State
  #==============================================================================
  
  class RPG::State
    #--------------------------------------------------------------------------
    # * Normal Icon Name
    #--------------------------------------------------------------------------
    def self.normal_icon_name
      return Normal_Icon
    end
    #--------------------------------------------------------------------------
    # * Normal Icon
    #--------------------------------------------------------------------------
    def self.normal_icon
      begin
        return RPG::Cache.icon(Normal_Icon)
      rescue
        return nil
      end
    end
    #--------------------------------------------------------------------------
    # * Icon Name
    #--------------------------------------------------------------------------
    def icon_name
      return Icon_Name[@id].nil? ? self.name : Icon_Name[@id]
    end
    #--------------------------------------------------------------------------
    # * Icon
    #--------------------------------------------------------------------------
    def icon
      begin
        return RPG::Cache.icon(icon_name)
      rescue
        return nil
      end
    end
  end
  
  #============================================================================== 
  # ** RGSS.Windows
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Methods created for window classes
  #  
  # Method List:
  # ------------
  #
  #   Window_Base
  #   -----------
  #   rect=
  #   rect
  #
  #   Window_Selectable
  #   -----------------
  #   oh
  #
  # Rewrote Methods:
  # ----------------
  #
  #   Window_Selectable
  #   -----------------
  #   top_row
  #   top_row=(top_row)
  #   page_row_max
  #   update_cursor_rect
  #==============================================================================
  
  MACL::Loaded << 'RGSS.Windows'
  
  #==============================================================================
  # ** Window_Base
  #==============================================================================
  
  class Window_Base
    #--------------------------------------------------------------------------
    # * Name      : Set Window Rect
    #   Info      : Sets rect size of window
    #   Author    : SephirothSpawn
    #   Call Info : Rect Object
    #--------------------------------------------------------------------------
    def rect=(r)
      self.x, self.y, self.width, self.height = r.x, r.y, r.width, r.height
    end
    #--------------------------------------------------------------------------
    # * Name      : Window Rect
    #   Info      : Gets rect size of window
    #   Author    : SephirothSpawn
    #   Call Info : None
    #--------------------------------------------------------------------------
    def rect
      return Rect.new(self.x, self.y, self.width, self.height)
    end
  end
  
  #==============================================================================
  # ** Window_Selectable
  #==============================================================================
  
  class Window_Selectable
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_writer :oh
    #--------------------------------------------------------------------------
    # * Text Cursor Height
    #--------------------------------------------------------------------------
    def oh
      return @oh.nil? ? 32 : @oh
    end
    #--------------------------------------------------------------------------
    # * Get Top Row
    #--------------------------------------------------------------------------
    def top_row
      # Divide y-coordinate of window contents transfer origin by 1 row
      # height of self.oh
      return self.oy / self.oh
    end
    #--------------------------------------------------------------------------
    # * Set Top Row
    #     row : row shown on top
    #--------------------------------------------------------------------------
    def top_row=(row)
      # If row is less than 0, change it to 0
      # If row exceeds row_max - 1, change it to row_max - 1
      row = [[row, 0].max, row_max - 1].min
      # Multiply 1 row height by 32 for y-coordinate of window contents
      # transfer origin
      self.oy = row * self.oh
    end
    #--------------------------------------------------------------------------
    # * Get Number of Rows Displayable on 1 Page
    #--------------------------------------------------------------------------
    def page_row_max
      # Subtract a frame height of 32 from the window height, and divide it by
      # 1 row height of self.oh
      return (self.height - 32) / self.oh
    end
    #--------------------------------------------------------------------------
    # * Update Cursor Rectangle
    #--------------------------------------------------------------------------
    def update_cursor_rect
      # If cursor position is less than 0
      if @index < 0
        self.cursor_rect.empty
        return
      end
      # Get current row
      row = @index / @column_max
      # If current row is before top row
      if row < self.top_row
        # Scroll so that current row becomes top row
        self.top_row = row
      end
      # If current row is more to back than back row
      if row > self.top_row + (self.page_row_max - 1)
        # Scroll so that current row becomes back row
        self.top_row = row - (self.page_row_max - 1)
      end
      # Calculate cursor width
      cursor_width = self.width / @column_max - 32
      # Calculate cursor coordinates
      x = @index % @column_max * (cursor_width + 32)
      y = @index / @column_max * self.oh - self.oy
      if self.active == true
        # Update cursor rectangle
        self.cursor_rect.set(x, y, cursor_width, self.oh)
      end
    end
  end
  
  #==============================================================================
  # ** Classes.Array_2D                                                By: Selwyn
  #------------------------------------------------------------------------------
  # Two Dimensional Array
  #   
  #   - by default, resizing the array will destroy the data it contains.
  #   - calling any of the following methods of the Array class might mess up
  #     the data's indexes, so be careful before using them.
  #
  #    unshift   uniq!   slice!   shift   reverse!   replace   reject!
  #    push   <<    pop   map!   flatten!   fill   delete_if   delete_at
  #    delete   concat   compact!   collect!
  #
  #==============================================================================
  
  MACL::Loaded << 'Classes.Array_2D'
  
  #==============================================================================
  # ** Array_2D
  #==============================================================================
  
  class Array_2D
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :xsize
    attr_reader   :ysize
    #-------------------------------------------------------------------------
    # * Name      : Object Initialization
    #   Info      : Creates a new 2D Array Object
    #   Author    : Selwyn
    #   Call Info : Two Arguments Integer xsize, ysize - dimensions
    #-------------------------------------------------------------------------
    def initialize(xsize, ysize)
      @xsize = xsize
      @ysize = ysize
      make_array
    end
    #-------------------------------------------------------------------------
    # * Name      : Element Reference
    #   Info      : Gets an Element returns Element At ID or X,Y
    #   Author    : Selwyn
    #   Call Info : One-Two Arguments
    #               One - Integer id - id of the element to get
    #               Two - Integer x,y - X and Y.
    #-------------------------------------------------------------------------
    def [](*args)
      case args.size
      when 1
        return @data[args[0]]
      when 2
        return @data[id(*args)]
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Element Assignment
    #   Info      : Assigns an Object to Element
    #   Author    : Selwyn
    #   Call Info : Two-Three Arguments
    #               Two Integer id - id of the Element to set 
    #                  Object obj - object assigned to id
    #               Three Integer x,y - X and Y.
    #                  Object obj - object assigned to id.
    #-------------------------------------------------------------------------
    def []=(*args)
      case args.size
      when 2
        @data[args[0]] = args[1]
      when 3
        @data[id(args[0], args[1])] = args[2]
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Set X Size
    #   Info      : Sets Width of 2D Array
    #   Author    : Selwyn
    #   Call Info : One or Two - Integer xsize - new size 
    #               Boolean clear - clears array
    #-------------------------------------------------------------------------
    def xsize=(xsize, clear = true)
      @xsize = xsize
      make_array if clear
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Y Size
    #   Info      : Sets Height of 2D Array
    #   Author    : Selwyn
    #   Call Info : One or Two - Integer ysize - new size 
    #               Boolean clear - clears array
    #-------------------------------------------------------------------------
    def ysize=(ysize, clear = true)
      @ysize = ysize
      make_array if clear
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Size
    #   Info      : Sets Dimensions of 2D Array
    #   Author    : Selwyn
    #   Call Info : Two or Three - Integer xsize, ysize - Dimensions
    #               Boolean clear - clears array
    #-------------------------------------------------------------------------
    def resize(xsize, ysize, clear = true)
      @xsize = xsize
      @ysize = ysize
      make_array if clear
    end
    #-------------------------------------------------------------------------
    # * Name      : Make Array
    #   Info      : Creates Data Array
    #   Author    : Selwyn
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def make_array
      max = id(@xsize, @ysize)
      @data = nil
      @data = Array.new(max)
    end
    #-------------------------------------------------------------------------
    # * Name      : ID
    #   Info      : Retunrs id of element
    #   Author    : Selwyn
    #   Call Info : Two Arguments Integer X and Y
    #-------------------------------------------------------------------------
    def id(x, y)
      return x + y * (@xsize + 1)
    end
    #-------------------------------------------------------------------------
    # * Name      : Coord
    #   Info      : Gets Coordinates returns Array - [x, y]
    #   Author    : Selwyn
    #   Call Info : One Integer ID, Id to get coordinates from
    #-------------------------------------------------------------------------
    def coord(id)
      x = id % (@xsize + 1)
      y = id / (@xsize + 1)
      return x, y
    end
    #--------------------------------------------------------------------------
    # * All other Array methods
    #--------------------------------------------------------------------------
    def method_missing(symbol, *args)
      @data.method(symbol).call(*args)
    end
  end
  
  #==============================================================================
  # ** Classes.Background_Sprite                                     By: Trickster
  #------------------------------------------------------------------------------
  #  This class is for displaying a sprite used as a background it inherits from
  #  class Sprite. Allows for the programmer to specify a bitmap and a viewport
  #  when creating a sprite and the sprite will automatically adjust itself to
  #  fir the viewport specified.
  #==============================================================================
  
  MACL::Loaded << 'Classes.Background_Sprite'
  
  #==============================================================================
  # ** Background_Sprite
  #==============================================================================
  
  class Background_Sprite < Sprite
    #-------------------------------------------------------------------------
    #   Name      : Initialize
    #   Info      : Object initialization
    #   Author    : Trickster
    #   Call Info : Zero to Two Arguments
    #               Bitmap bitmap bitmap to be loaded
    #               Viewport viewport viewport used with the sprite
    #-------------------------------------------------------------------------
    def initialize(bitmap = Bitmap.new(32,32), viewport = nil)
      super(viewport)
      self.bitmap = bitmap
      adjust
    end
    #-------------------------------------------------------------------------
    #   Name      : Set Bitmap
    #   Info      : Sets the Sprite's Bitmap
    #   Author    : Trickster
    #   Call Info : One Argument Bitmap bitmap the bitmap to be loaded
    #-------------------------------------------------------------------------
    def bitmap=(bitmap)
      super(bitmap)
      adjust
    end
    #-------------------------------------------------------------------------
    #   Name      : Set Viewport
    #   Info      : Sets the Sprite's Viewport
    #   Author    : Trickster
    #   Call Info : One Argument Viewport viewport the viewport to use
    #-------------------------------------------------------------------------
    def viewport=(viewport)
      super(viewport)
      adjust
    end
    #-------------------------------------------------------------------------
    #   Name      : Adjust (Private)
    #   Info      : Adjusts the Zoom Level
    #   Author    : Trickster
    #   Call Info : No Arguments (can't be called outside this class)
    #-------------------------------------------------------------------------
    private
    def adjust
      if viewport != nil
        x, y = viewport.rect.x, viewport.rect.y
        width, height = viewport.rect.width, viewport.rect.height
      else
        x, y, width, height = 0, 0, 640, 480
      end
      src_rect.set(x, y, width, height)
      self.x = x
      self.y = y
      self.zoom_x = width / bitmap.width.to_f
      self.zoom_y = height / bitmap.height.to_f
    end
  end
  
  #============================================================================== 
  # ** Classes.Level Generation V4                By Trickster and SephirothSpawn
  #------------------------------------------------------------------------------
  # Format for Calling this class
  # Level_Generation.new(min, mid, max, minL, midL, maxL, early, late, steady,
  #  curve1, curve2, int)
  #
  # Where:
  # min    - the minimum value of the stat
  # mid    - the middle value at midL
  # max    - the maximum value of the stat
  # minL   - the minimum level
  # midL   - the middle level (stat will be mid here)
  # maxL   - the maximum level
  # early  - the early influence
  # late   - the late influence
  # steady - the steady influence
  # curve1 - the early->late influence
  # curve2 - the late->early influence
  # int    - if true returns integers
  #
  # Notes:
  #
  # The Default Values for the Curve Options
  # minL = 1, midL = 50, maxL = 99, influence options = 0, int = true
  #
  # You must set at least one of the curve options to a number other than 0
  #
  # Using the Steady Curve Option will throw off the middle value option, since
  # the steady curve grows steadily and its middle value will always occur on the
  # middle level, that is, (maxL - minL) / 2.
  #============================================================================== 
  
  MACL::Loaded << 'Classes.Level_Generation'
  
  #==============================================================================
  # ** Level_Generation
  #==============================================================================
  
  class Level_Generation
    #-------------------------------------------------------------------------
    # * Name      : Initialize
    #   Info      : Object Initialization
    #   Author    :  Trickster
    #   Call Info : Three to Twelve Arguments
    #               Numeric Min, Mid, Max - Minimum Middle and Maximum Value
    #               Numeric Min1, Mid1, Max1 - Min, Mid, and Max Level (1, 50, 99)
    #-------------------------------------------------------------------------
    def initialize(min, mid, max, minl = 1, midl = 50, maxl = 99, early = 0,
                   late = 0, steady = 0, curve1 = 0, curve2 = 0, int = true)
      # Set Instance Variables
      @min   = min.to_f
      @mid   = mid.to_f
      @max   = max.to_f
      @minl  = minl.to_f
      @midl  = midl.to_f
      @maxl  = maxl.to_f
      @early = early
      @late  = late
      @steady = steady
      @curve1 = curve1
      @curve2 = curve2
      @int = int
      # Error Checking
      error_checking
      # Calculate constants
      calculate_constants
    end
    #-------------------------------------------------------------------------
    # * Name      : Get Initial Level
    #   Info      : Initial Level
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def initial_level
      return @minl.to_i
    end
    #-------------------------------------------------------------------------
    # * Name      : Get Final Level
    #   Info      : Final Level
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def final_level
      return @maxl.to_i
    end
    #-------------------------------------------------------------------------
    # * Name      : Export
    #   Info      : Exports Object to Text File to YourProject/File.txt
    #   Author    : Trickster
    #   Call Info : One or Two Argument - String File Filename to Save to
    #               Boolean ints - Flag for Integer Arguments Sent (min - maxl)   
    #   Comments  : Output Sample (Not Accurate with Curve)
    #
    #   min = 100, mid = 150, max = 200
    #   minl = 1, midl = 50, maxl = 99
    #   early = 0, late = 0, steady = 1, curve1 = 0, cruve2 = 0
    #
    #   1 = 100
    #   2 = 102
    #   [...]
    #-------------------------------------------------------------------------
    def export(file_name, ints = true)
      # Create File
      file = File.open("#{file_name}.txt", 'w')
      # Export Stat and Level Values
      if ints
        file.print("min = #{@min.to_i}, mid = #{@mid.to_i}, max = #{@max.to_i}\n")
      else
        file.print("min = #{@min.to_i}, mid = #{@mid.to_i}, max = #{@max.to_i}\n")
      end
      file.print("minl = #{@minl.to_i}, midl = #{@midl.to_i}, maxl = #{@maxl.to_i}\n")
      # Setup Arrays
      keys = %w( early late steady curve1 curve2 )
      values = @early, @late, @steady, @curve1, @curve2
      # Setup Text
      text = ''
      # Setup Local Variable Counter
      counter = 0
      # Run Through Keys with Values (MACL)
      keys.each_with_array(*values) do |key, value|
        # Skip if value is 0
        next if value == 0
        # Add to text
        text += counter == 0 ? "#{key} = #{value}" : ", #{key} = #{value}"
        # Increate Counter
        counter += value
      end
      # Print Text
      file.print(text)
      # Add two new lines
      file.print("\n\n")
      # Print Values for each level
      self.each {|level, value| file.print("#{level} = #{value}\n")}
      # Close File
      file.close
    end
    #-------------------------------------------------------------------------
    # * Name      : Generate Table
    #   Info      : Generates Hash Table for levels (format: level => stat_value)
    #   Author    : Trickster (Mods By SephirothSpawn)
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def generate_table(data_type = 0)
      # Organizes Key (For Use in Saving Table)
      key = @min,@mid,@max,@minl,@midl,@maxl,@early,@late,@steady,@curve1,@curve2
      # Loads Tables
      tables = load_tables
      # If Key Already Saved Return Saved table
      return tables[key] if tables.has_key?(key)
      # Create Hash table
      table = Hash.new(0) if data_type == 0
      table = Table.new(@maxl + 1) if data_type == 1
      # Run Through Each Level
      self.each {|level, value| table[level] = value}
      # Saves Table
      save_table(table)
      # Return Created Table
      return table
    end
    #-------------------------------------------------------------------------
    # * Name      : Save Table
    #   Info      : Saves Table Data into LevelGeneration.rxdata
    #   Author    : SephirothSpawn
    #   Call Info : Hash Table
    #-------------------------------------------------------------------------
    def save_table(table)
      # Sets Up Key
      key = @min,@mid,@max,@minl,@midl,@maxl,@early,@late,@steady,@curve1,@curve2
      # Collects Saved Tables
      tables = load_tables
      # Saves Table to Data File
      tables[key] = table
      # Resaves Tables to File
      save_data(tables, 'Data/LevelGeneration.rxdata')    
    end
    #-------------------------------------------------------------------------
    # * Name      : Load Tables
    #   Info      : Loads Table Data From LevelGeneration.rxdata
    #             : A Hash in this forum table_parameters => hash_table
    #   Author    : SephirothSpawn
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def load_tables
      # Test For Saved Solution File
      unless FileTest.exist?('Data/LevelGeneration.rxdata')
        # Creates LevelGeneration RXdata File
        save_data({}, 'Data/LevelGeneration.rxdata')
      end
      # Returns Saved Tables
      return load_data('Data/LevelGeneration.rxdata')
    end
    #-------------------------------------------------------------------------
    # * Name      : Each
    #   Info      : Iterator Method, Calculates Value for each level
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def each
      # Get Minimum level and Maximum Level
      minimum, maximum = @minl.to_i, @maxl.to_i
      # Run Through Minimum and Maximum and Yield Level and Value
      (minimum..maximum).each {|level| yield(level, get_stat(level))}
    end
    #-------------------------------------------------------------------------
    # * Name      : Element Reference
    #   Info      : Gets Stat for level
    #   Author    : Trickster
    #   Call Info : One Argument Integer Level, Level to get stat from
    #-------------------------------------------------------------------------
    def [](level)
      return get_stat(level)
    end
    #-------------------------------------------------------------------------
    # * Name      : Get Stat
    #   Info      : Gets Stat for level
    #   Author    : Trickster
    #   Call Info : One Argument Integer Level, Level to get stat from
    #-------------------------------------------------------------------------
    def get_stat(level)
      return @int ? @min.to_i : @min if level <= @minl
      return @int ? @max.to_i : @max if level >= @maxl
      # Setup Total
      total = 0
      # Get Values for Every Stat if greater than 0
      total += @late * late_curve(level) if @late > 0
      total += @early * early_curve(level) if @early > 0
      total += @steady * steady_curve(level) if @steady > 0
      total += @curve1 * early_late_curve(level) if @curve1 > 0
      total += @curve2 * late_early_curve(level) if @curve2 > 0
      # Get Average
      total /= @late + @early + @steady + @curve1 + @curve2
      # Limit Value
      total = level < @midl ? [total, @mid].min : [total, @mid].max
      # Further Limit Value
      total = [[total, @min].max, @max].min
      # Return Value
      return @int ? total.to_i : total
    end
    #-------------------------------------------------------------------------
    # * Name      : Calculate Constants (Private)
    #   Info      : Calculates Constants "infimi", "infi", and "inmi"
    #   Author    : Trickster
    #   Call Info : No Arguments
    #               Can not be called outside class
    #-------------------------------------------------------------------------
    private
    def calculate_constants
      # Calculate "infi" and "inmi"
      @inmi = (@mid - @min) / (@midl - @minl)
      @infi = (@max - @min) / (@maxl - @minl)
      # Calculate "infimi"
      @infimi = (@infi - @inmi) / (@maxl - @midl)
    end
    #-------------------------------------------------------------------------
    # * Name      : Late Curve (Private)
    #   Info      : Late Curve Influence, Formula
    #   Author    : Trickster
    #   Call Info : One Argument Integer Level, Level to get stat from
    #               Can not be called outside class
    #-------------------------------------------------------------------------
    def late_curve(level)
      # Calculate "A"
      a_num = @infimi * (3 * @minl + @midl) + @inmi
      a_den = (@maxl - @minl) * (@midl - @minl)
      a = - a_num / a_den
      # Return Value
      return curve(a, level)
    end
    #-------------------------------------------------------------------------
    # * Name      : Early Curve (Private)
    #   Info      : Early Curve Influence, Formula
    #   Author    : Trickster
    #   Call Info : One Argument Integer Level, Level to get stat from
    #               Can not be called outside class
    #-------------------------------------------------------------------------
    def early_curve(level)
      # Calculate "A"
      a_num = @infimi * (2 * @maxl + @minl + @midl) + @inmi
      a_den = (@maxl - @midl) * (@maxl - @minl)
      a = - a_num / a_den
      # Return Value
      return curve(a, level)
    end
    #-------------------------------------------------------------------------
    # * Name      : Early -> Late Curve (Private)
    #   Info      : Early Late Curve Formula (Curve 1)
    #   Author    : Trickster
    #   Call Info : One Argument Integer Level, Level to get stat from
    #               Can not be called outside class
    #-------------------------------------------------------------------------
    def early_late_curve(level)
      # Calculate "A"
      a = @infimi / (@maxl + @minl - 2 * @midl)
      # Return Value
      return curve(a, level)
    end
    #-------------------------------------------------------------------------
    # * Name      : Late -> Early Curve (Private)
    #   Info      : Late Early Curve Formula (Curve 2)
    #   Author    : Trickster
    #   Call Info : One Argument Integer Level, Level to get stat from
    #               Can not be called outside class
    #-------------------------------------------------------------------------
    def late_early_curve(level)
      # If Less than Mid Level
      if level < @midl
        # Return Late Curve for level
        return late_curve(level)
      # If Greater than Mid Level
      elsif level > @midl
        # Return Early Curve for Level
        return early_curve(level)
      # If at Mid Level
      elsif level == @midl
        # Return Mid Value
        return @mid
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Steady Curve (Private)
    #   Info      : Steady Curve Influence, Formula
    #   Author    : Trickster
    #   Call Info : One Argument Integer Level, Level to get stat from
    #               Can not be called outside class
    #-------------------------------------------------------------------------
    def steady_curve(level)
      ch_level = @maxl - @minl
      ch_stat = @max - @min
      base = ch_stat / ch_level * level
      mod = @max * @minl - @min * @maxl
      base2 = mod / ch_level
      return base - base2
    end
    #-------------------------------------------------------------------------
    # * Name      : Curve (Private)
    #   Info      : Curve Formula
    #   Author    : Trickster
    #   Call Info : Two Arguments Numeric A, "A" Influence
    #               Integer Level, Level to get stat from
    #               Can not be called outside class
    #-------------------------------------------------------------------------
    def curve(a, level)
      # Calculate "B"
      b = @infimi - a * (@minl + @midl + @maxl)
      # Calculate "C"
      c = @inmi - a * (@midl ** 2 + @minl * @midl + @minl ** 2) - b * (@midl + @minl)
      # Calculate "D"
      d = @min - (a * @minl ** 3 + b * @minl ** 2 + c * @minl)
      # Calculate Stat
      stat = a * level ** 3 + b * level ** 2 + c * level + d
      # Return Stat
      return stat
    end
    #-------------------------------------------------------------------------
    # * Name      : Error Checking (Private)
    #   Info      : Checks For Errors
    #   Author    : Trickster
    #   Call Info : No Arguments
    #               Can not be called outside class
    #-------------------------------------------------------------------------
    def error_checking
      if @late + @early + @steady + @curve1 + @curve2 == 0
        raise(GeneratorError, "No Influences Have Been Defined")
      elsif @minl == @midl or @minl == @maxl or @midl == @maxl
        raise(GeneratorError, "Can't Use Same Level for Min, Mid, or Max Level")
      end
    end
    #-------------------------------------------------------------------------
    # * Generator Error
    #-------------------------------------------------------------------------
    class GeneratorError < StandardError; end
  end
  
  #============================================================================== 
  # ** Classes.Linked_List                                             By: Zeriab
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # This class represents a double linked list. Has a reference to the tail
  # and the head of the list.
  #  
  # Method List:
  # ------------
  # []=
  # add
  # insert
  # push
  # <<
  # unshift
  # delete
  # pop
  # shift
  # get
  # []
  # size=
  # insert_element
  # insert_element_tail
  # delete_element
  # search
  # get_element
  #
  #  Linked_List::Element
  #  --------------------
  #  value=
  #  value
  #  previous_element=
  #  previous_element
  #  next_element=
  #  next_element
  #==============================================================================
  
  MACL::Loaded << 'Classes.Linked_list'
  
  #==============================================================================
  # ** Linked_List
  #==============================================================================
  
  class Linked_List
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :head
    attr_accessor :tail
    attr_reader   :size
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      self.size = 0
    end
    #--------------------------------------------------------------------------
    # * []=
    # Change the value of the nth element in the list
    # Return true if the change succeeds otherwise false
    #--------------------------------------------------------------------------
    def []=(n, value)
      # Return nil if the list is empty
      element = get_element(n)
      if element.nil?
        return false
      else
        element.value = value
        return true
      end
    end
    #--------------------------------------------------------------------------
    # * Add
    # Add an object to the list (HEAD)
    #--------------------------------------------------------------------------
    def add(value)
      element = Linked_List::Element.new
      element.value = value
      insert_element(element)
      self.size += 1
    end
    # Synonyms
    def insert(value) add(value) end
    def push(value)   add(value) end
    def <<(value)     add(value) end
    #--------------------------------------------------------------------------
    # * Unshift
    # Add an object to the back of the list (TAIL)
    #--------------------------------------------------------------------------
    def unshift(value)
      element = Linked_List::Element.new
      element.value = value
      insert_element_tail(element)
      self.size += 1
    end
    #--------------------------------------------------------------------------
    # * Delete
    # Delete an object from the list
    # Return the deleted object
    # Return nil if the deletion has no effect on the list.
    #--------------------------------------------------------------------------
    def delete(value)
      element = self.search(value)
      if element.nil?
        return nil
      else
        self.delete_element(element)
        self.size -= 1
        return element.value
      end
    end
    #--------------------------------------------------------------------------
    # * Pop
    # Delete and return the head of the list.
    #--------------------------------------------------------------------------
    def pop
      # Return nil if the list is empty
      if self.head.nil?
        return nil
      end
      self.size -= 1
      return delete_element(self.head).value
    end
    #--------------------------------------------------------------------------
    # * Shift
    # Delete and return the tail of the list.
    #--------------------------------------------------------------------------
    def shift
      # Return nil if the list is empty
      if self.head.nil?
        return nil
      end
      self.size -= 1
      return delete_element(self.tail).value
    end
    #--------------------------------------------------------------------------
    # * Get
    # Get the object at the nth element in the list
    #--------------------------------------------------------------------------
    def get(n)
      # Return nil if the list is empty
      element = get_element(n)
      if element.nil?
        return nil
      end
      return element.value
    end
    # Synonyms
    def [](n) get(n) end
    #--------------------------------------------------------------------------
    # * Private Method
    #--------------------------------------------------------------------------
    private
    #--------------------------------------------------------------------------
    # * Size
    # Sets the size of the list
    #--------------------------------------------------------------------------
    def size=(value)
      @size = value if value >= 0
    end
    #--------------------------------------------------------------------------
    # * Insert Element
    # Insert an element into the list.
    # Assumes 'element' is a Linked_List::Element.
    #--------------------------------------------------------------------------
    def insert_element(element)
      if head.nil?
        self.head = element
        self.tail = element
        return
      end
      element.next_element = self.head
      self.head.previous_element = element
      self.head = element
      element.previous_element = nil
    end
    #--------------------------------------------------------------------------
    # * Insert Element Tail
    # Insert an element into the list at the tail.
    # Assumes 'element' is a Linked_List::Element.
    #--------------------------------------------------------------------------
    def insert_element_tail(element)
      if head.nil?
        self.head = element
        self.tail = element
        return
      end
      element.previous_element = self.tail
      self.tail.next_element = element
      self.tail = element
      element.next_element = nil
    end
    #--------------------------------------------------------------------------
    # * Delete Element
    # Delete the given element from the list
    # Assumes 'element' is a Linked_List::Element.
    #--------------------------------------------------------------------------
    def delete_element(element)
      if element.next_element.nil?
        self.tail = element.previous_element
      else
        element.next_element.previous_element = element.previous_element
      end
      if element.previous_element.nil?
        self.head = element.next_element
      else
        element.previous_element.next_element = element.next_element
      end
      return element
    end
    #--------------------------------------------------------------------------
    # * Search
    # Search for an element with the specified value.
    # Return the first element found with the corresponding value
    # Return nil if no element is found.
    #--------------------------------------------------------------------------
    def search(value)
      # If the head is nil the list is empty
      if self.head.nil?
        return nil
      end
      # Start with the head
      element = self.head
      loop do
        # Check if the element has the correct value
        if element.value == value
          return element
        end
        # Return nil if the tail has been reached
        if element == self.tail
          return nil
        end
        # Look at the next element in the list
        element = element.next_element
      end
    end
    #--------------------------------------------------------------------------
    # * Get Element
    # Get the object at the nth element in the list
    #--------------------------------------------------------------------------
    def get_element(n)
      # Return nil if the list is empty
      if self.head.nil?
        return nil
      end
      element = self.head
      for i in 0...n
        if self.tail == element
          return nil
        end
        element = element.next_element
      end
      return element
    end
  end
  
  #==============================================================================
  # ** Linked_List::Element
  #==============================================================================
  
  class Linked_List::Element
    attr_accessor :value
    attr_accessor :previous_element
    attr_accessor :next_element
  end
  
  #============================================================================== 
  # ** Classes.Random                                               By: Trickster
  #------------------------------------------------------------------------------
  #  A Random class for generating objects
  #==============================================================================
  
  MACL::Loaded << 'Classes.Random'
  
  #==============================================================================
  # ** Random
  #==============================================================================
  
  class Random
    #-------------------------------------------------------------------------
    # * Name      : Initialize
    #   Info      : Object Initialization
    #   Author    : Trickster
    #   Call Info : Variable Amount
    #               If a Range every object within the Range is added
    #               If a Numeric adds that object is added
    #               If a String then that string is added
    #               If an Array then all values within the array are added
    #-------------------------------------------------------------------------
    def initialize(*args)
      # Setup Data
      @data = []
      # Push Arguments to List
      push(*args)
    end
    #-------------------------------------------------------------------------
    # * Name      : Generate
    #   Info      : Generates an Object
    #               returns An Object if number is 1 and Array of Objects if 
    #               number is > 1
    #   Author    : Trickster
    #   Call Info : Zero to One
    #               Integer number Number of objects to generate (Defaults to 1)
    #-------------------------------------------------------------------------
    def generate(number = 1)
      # Create Array
      random = []
      # If Number is greater than 1
      if number > 1
        # Push Object Number Times
        number.times {random << @data[rand(@data.size)]}
        # Return Random Objects
        return random
      else
        # Retunr Random Object
        return @data[rand(@data.size)]
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Generate!
    #   Info      : Generates and Deletes Object
    #               returns An Object if number is 1 and Array of Objects if 
    #               number is > 1
    #   Author    : Trickster
    #   Call Info : Zero to One
    #               Integer number Number of objects to generate (Defaults to 1)
    #-------------------------------------------------------------------------
    def generate!(number = 1)
      # Create Array
      random = []
      # If Number is greater than 1
      if number > 1
        # Run Through Number times
        number.times {random << @data.delete_at(rand(@data.size)) if !empty?}
        # Return Array of Random
        return random
      else
        # Return Random Object And Delete
        return @data.delete_at(rand(@data.size))
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Push
    #   Info      : Push Objects to be generated
    #   Author    : Trickster
    #   Call Info : Variable Amount
    #               If a Range every object within the Range is added
    #               If a Numeric adds that object is added
    #               If a String then that string is added
    #               If an Array then all values within the array are added
    #-------------------------------------------------------------------------
    def push(*args)
      # Run Through Arguments Sent
      args.each do |argument|
        # Branch By Arguments Class
        case argument
        when Range
          # Add All Values of Range
          @data += argument.to_a
        when Hash
          # Add All Key Value Pairs Of Hash
          @data += argument.to_a
        when Array
          # Add Array
          @data += argument
        else
          # Push Argument
          @data << argument
        end
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Empty?
    #   Info      : Generator Empty? returns true if Data is empty false otherwise
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def empty?
      return @data.empty?
    end
    #--------------------------------------------------------------------------
    # * All Other Array methods
    #--------------------------------------------------------------------------
    def method_missing(symbol, *args)
      @data.method(symbol).call(*args)
    end
  end
  
  #============================================================================== 
  # ** Classes.Scene_Base (2.1.1)                               By SephirothSpawn
  #------------------------------------------------------------------------------
  # * Description :
  #
  #   This script was designed to act as a parent class for all scenes. It
  #   provides 2 major purposes :
  #
  #    1) Give the Main Processing Method a Common Structure
  #    2) Automatically Update & Dispose All Spritesets, Sprites, Windows or
  #       any other instance variable that responds to :update or :dispose
  #
  #   This is a script for developers, not non-scripters. If you do not
  #   plan to create scenes in RMXP, this isn't needed.
  #------------------------------------------------------------------------------
  # * Note : This script is only for non-SDK users or SDK users that do not use
  #          the 2.0+ version of the SDK.
  #==============================================================================
  
  MACL::Loaded << 'Classes.Scene_Base'
  
  #==============================================================================
  # ** Scene Base
  #==============================================================================
  
  class Scene_Base
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      @previous_scene = $scene.class
    end  
    #--------------------------------------------------------------------------
    # * Main Processing
    #--------------------------------------------------------------------------
    def main
      main_variable                 # Main Variable Initialization
      main_spriteset                # Main Spriteset Initialization
      main_sprite                   # Main Sprite Initialization
      main_window                   # Main Window Initialization
      main_audio                    # Main Audio Initialization
      main_transition               # Main Transition Initialization
      loop do                       # Scene Loop
        main_loop                   # Main Loop
        break if main_break?        # Break If Breakloop Test 
      end                           # End Scene Loop
      Graphics.freeze               # Prepare for transition
      main_dispose                  # Main Dispose
      main_end                      # Main End
    end
    #--------------------------------------------------------------------------
    # * Main Processing : Variable Initialization
    #--------------------------------------------------------------------------
    def main_variable   ; end
    #--------------------------------------------------------------------------
    # * Main Processing : Spriteset Initialization
    #--------------------------------------------------------------------------
    def main_spriteset  ; end
    #--------------------------------------------------------------------------
    # * Main Processing : Sprite Initialization
    #--------------------------------------------------------------------------
    def main_sprite     ; end
    #--------------------------------------------------------------------------
    # * Main Processing : Window Initialization
    #--------------------------------------------------------------------------
    def main_window     ; end
    #--------------------------------------------------------------------------
    # * Main Processing : Audio Initialization
    #--------------------------------------------------------------------------
    def main_audio      ; end
    #--------------------------------------------------------------------------
    # * Main Processing : Transition
    #--------------------------------------------------------------------------
    def main_transition
      Graphics.transition
    end
    #--------------------------------------------------------------------------
    # * Main Processing : Loop
    #--------------------------------------------------------------------------
    def main_loop
      Graphics.update             # Update game screen
      Input.update                # Update input information
      main_update                 # Update scene objects
      update                      # Update Processing
    end
    #--------------------------------------------------------------------------
    # * Main Processing : Break Loop Test
    #--------------------------------------------------------------------------
    def main_break?
      return $scene != self # Abort loop if sceen is changed
    end
    #--------------------------------------------------------------------------
    # * Main Processing : Disposal
    #--------------------------------------------------------------------------
    def main_dispose
      # Passes Through All Instance Variables
      self.instance_variables.each do |object_name|
        # Evaluates Object
        object = eval object_name
        # Pass Object To Auto Dispose
        auto_dispose(object)
      end
    end
    #--------------------------------------------------------------------------
    # * Main Processing : Ending
    #--------------------------------------------------------------------------
    def main_end        ; end
    #--------------------------------------------------------------------------
    # * Main Processing : Update
    #--------------------------------------------------------------------------
    def main_update
      # Passes Through All Instance Variables
      self.instance_variables.each do |object_name|
        # Evaluates Object
        object = eval object_name
        # Pass Object To Auto Update
        auto_update(object)
      end
    end
    #--------------------------------------------------------------------------
    # * Main Processing : Auto Update
    #--------------------------------------------------------------------------
    def auto_update(object)
      # Return If Object isn't a Hash, Array or Respond to Update
      return unless object.is_a?(Hash) || object.is_a?(Array) || 
                    object.respond_to?(:update)
      # If Hash Object
      if object.is_a?(Hash)
        object.each do |key, value|
          # Pass Key & Value to Auto Update
          auto_update(key) ; auto_update(value)
        end
        return
      end
      # If Array Object
      if object.is_a?(Array)
        # Pass All Object to Auto Update
        object.each {|obj| auto_update(obj)}
        return
      end
      # If Responds to Dispose
      if object.respond_to?(:dispose)
        # If Responds to Disposed? && is Disposed or Responds to Disable
        # Dispose and dispose is disabled
        if (object.respond_to?(:disposed?) && object.disposed?) ||
           (object.respond_to?(:disable_dispose?) && object.disable_dispose?)
          # Return
          return
        end
      end
      # If Responds to Update
      if object.respond_to?(:update)
        # If Responds to Disable Update & Update Disabled
        if object.respond_to?(:disable_update?) && object.disable_update?
          # Return
          return
        end
        # Update Object
        object.update
      end
    end
    #--------------------------------------------------------------------------
    # * Main Processing : Auto Dispose
    #--------------------------------------------------------------------------
    def auto_dispose(object)
      # Return If Object isn't a Hash, Array or Respond to Dispose
      return unless object.is_a?(Hash) || object.is_a?(Array) || 
                    object.respond_to?(:dispose)
      # If Hash Object
      if object.is_a?(Hash)
        object.each do |key, value|
          # Pass Key & Value to Auto Dispose
          auto_dispose(key) ; auto_dispose(value)
        end
        return
      end
      # If Array Object
      if object.is_a?(Array)
        # Pass All Object to Auto Dispose
        object.each {|obj| auto_dispose(obj)}
        return
      end
      # If Responds to Dispose
      if object.respond_to?(:dispose)
        # If Responds to Disposed? && is Disposed or Responds to Disable
        # Dispose and dispose is disabled
        if (object.respond_to?(:disposed?) && object.disposed?) ||
           (object.respond_to?(:disable_dispose?) && object.disable_dispose?)
          # Return
          return
        end
        # Dispose Object
        object.dispose
      end
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update          ; end
  end
  
  #============================================================================== 
  # ** Classes.Sprite_ActorCharGraphic (V2.0)                        By Trickster
  #------------------------------------------------------------------------------
  # A Sprite Class that represents an actor character graphic. Also Handles a few
  # Graphical methods and animation. The Z coordinate is, by default,
  # in between the window and its contents for easy integration in a window.
  #============================================================================== 
  
  MACL::Loaded << 'Classes.Sprite_ActorCharGraphic'
  
  #==============================================================================
  # ** Sprite_ActorCharGraphic
  #==============================================================================
  
  class Sprite_ActorCharGraphic < Sprite
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :speed
    attr_accessor :animate
    attr_reader   :frame
    attr_reader   :pose
    #-------------------------------------------------------------------------
    # * Name      : Object Initialization
    #   Info      : Creates a New Instance of this Class
    #   Author    : Trickster
    #   Call Info : Three or Seven Arguments
    #               Game_Actor actor, Actor's Sprite to Display
    #               Integer X and Y, Position to Display
    #               Integer Speed, Speed of animation (Def 1)
    #               Integer Frame, Starting frame (Def. nil)
    #               String/Integer Pose, Pose Type/Pose Index (Def. nil)
    #               Viewport viewport, Viewport used (Def. nil)
    #-------------------------------------------------------------------------
    def initialize(actor, x, y, speed = 1, frame = 0, pose = 0, viewport = nil)
      # Call Sprite#initialize and Send Viewport
      super(viewport)
      # Setup Instance Variables
      @actor, @speed = actor, speed
      # Setup Position
      self.x = x
      self.y = y
      self.z = 101
      # Setup Bitmap
      self.bitmap = RPG::Cache.character(actor.character_name, actor.character_hue)
      # Setup Other Variables
      @name, @hue, @animate = @actor.character_name, @actor.character_hue, false
      # Setup Pose if string sent
      pose = MACL::Poses.index(pose) if pose.is_a?(String)
      # Setup Pose and Frame
      self.pose, self.frame = pose, frame
      # Setup Counter Instance Variable
      @count = 0
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Graphic
    #   Info      : Sets Graphic to (Frame, Pose)
    #   Author    : Trickster
    #   Call Info : Two Arguments 
    #               Integer Frame, Frame
    #               String/Integer Pose, Pose Type/Pose Index 
    #-------------------------------------------------------------------------
    def set_graphic(pose, frame)
      # Set Pose and Frame
      self.pose, self.frame = pose, frame
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Pose
    #   Info      : Sets The Pose
    #   Author    : Trickster
    #   Call Info : One Argument, String/Integer Pose Pose Type/Pose Index
    #-------------------------------------------------------------------------
    def pose=(pose)
      # Turn pose into an integer if string sent
      pose = MACL::Poses.index(pose) if pose.is_a?(String)
      # Return if pose is nil or same pose
      return if pose == nil or pose == @pose
      # Set Y Coordinate of Source Rectangle
      src_rect.y = bitmap.height / MACL::Poses.size * pose
      # Set Height of Source Rectangle
      src_rect.height = bitmap.height / MACL::Poses.size
      # Set Pose
      @pose = pose
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Frame
    #   Info      : Sets the Frame
    #   Author    : Trickster
    #   Call Info : One Argument, Integer Frame, Frame to set
    #-------------------------------------------------------------------------
    def frame=(frame)
      # Return if frame is nil or same frame
      return if frame == nil or frame == @frame
      # Set X Coordinate of Source Rectangle
      src_rect.x = bitmap.width / MACL::Frames * frame
      # Set Height of Source Rectangle
      src_rect.width = bitmap.width / MACL::Frames
      # Set Frame
      @frame = frame
    end
    #-------------------------------------------------------------------------
    # * Name      : Frame Update
    #   Info      : Update Animation if enabled, Updates Graphic
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def update
      # Call Sprite Update
      super
      # Update Graphic
      update_graphic
      # Return if not animated
      return if not @animate or @speed == 0
      # Increase Counter
      @count += 1
      # Return if speed frames have not passed
      return if @count % @speed != 0
      # Set Frame Restrict to [0, frames)
      self.frame = (self.frame + 1) % MACL::Frames
    end
    #-------------------------------------------------------------------------
    # * Name      : Update Graphic (Private)
    #   Info      : Private Method, Updates Actor Graphic
    #   Author    : Trickster
    #   Call Info : No Arguements, can not be called outside this class
    #-------------------------------------------------------------------------
    private
    def update_graphic
      # Return if no changes made
      return if @name == @actor.character_name and @hue == @actor.character_hue
      # Update Name and Hue
      @name, @hue = @actor.character_name, @actor.character_hue
      # Set New Bitmap
      self.bitmap = RPG::Cache.character(@name, @hue)
    end
  end
  
  #============================================================================== 
  # ** Classes.Sprite_WindowText                                     By Trickster
  #------------------------------------------------------------------------------
  #  A specialized sprite class that is to be placed onto a window
  #============================================================================== 
  
  MACL::Loaded << 'Classes.Sprite_WindowText'
  
  #==============================================================================
  # ** Sprite_WindowText
  #==============================================================================
  
  class Sprite_WindowText < Sprite
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader :text
    attr_reader :width
    #-------------------------------------------------------------------------
    # * Name      : Object Initialization
    #   Info      : Creates a New Window Text Sprite
    #   Author    : Trickster
    #   Call Info : Zero to Five Integer X and Y Defines Position
    #               String Text - Text to be Drawn
    #               Font font - font to be used
    #               Viewport - Viewport of the sprite
    #-------------------------------------------------------------------------
    def initialize(x = 0, y = 0, text = '', font = Font.new, viewport = nil)
      # Call Sprite#initialize and send viewport
      super(viewport)
      # Set Coordinates
      self.x, self.y = x, y
      # Set Bitmap
      self.bitmap = Bitmap.new(32, 32)
      # Set Text
      @text = text
      # Set Font
      @font = font
      # Set Bitmap font
      bitmap.font = @font
      # Setup Tagging Type
      @sprite_type = 'border'
      # Setup Text
      setup_text
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Text
    #   Info      : Changes Text and Updates Sprite
    #   Author    : Trickster
    #   Call Info : One Argument String Text - new text
    #-------------------------------------------------------------------------
    def text=(text)
      # Return if same text
      return if @text == text
      # Set New Text
      @text = text
      # Setup Text
      setup_text
    end
    #-------------------------------------------------------------------------
    # * Name      : Width
    #   Info      : Changes width and Updates Sprite
    #   Author    : Trickster
    #   Call Info : One Argument Integer width - new width
    #-------------------------------------------------------------------------
    def width=(width)
      # Return if same width
      return if @width == width
      # Set New Width
      @width = width
      # Setup Text
      setup_text
    end
    #-------------------------------------------------------------------------
    # * Name      : Setup Text (Private)
    #   Info      : Set up Text Bitmap
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    private
    def setup_text
      # Get Size of Text
      size = bitmap.text_size(@text).width
      # Dispose Previous Bitmap
      bitmap.dispose if bitmap != nil and size != bitmap.width
      # Create Bitmap
      self.bitmap = Bitmap.new(@width.nil? ? (size == 0 ? 32 : size) : @width, 32)
      # Set Font
      self.bitmap.font = @font
      # Draw Text onto bitmap
      self.bitmap.draw_text(0, 0, size, 32, @text)
    end
  end
  
  #==============================================================================
  # ** Classes.Table_Object                                                    By: Selwyn
  #------------------------------------------------------------------------------
  # Three Dimensional Array for any Object.
  #   
  #   - resizing any dimension will destroy the data.
  #   - negative values for x, y, z can be used.
  #       e.g. table[-1, -1, -1] will return the last object of the table
  #
  #==============================================================================
  
  MACL::Loaded << 'Classes.Table_Object'
  
  class Table_Object
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :xsize
    attr_reader   :ysize
    attr_reader   :zsize
    #--------------------------------------------------------------------------
    # * Name      : Object Initialization
    #   Info      : Creates a new Object Table Object
    #   Author    : Selwyn
    #   Call Info : Two-Three Arguments
    #               Two - Integer xsize, ysize - dimensions
    #               Three - Integer xsize, ysize, zsize - dimensions
    #--------------------------------------------------------------------------
    def initialize(xsize, ysize, zsize = 0)
      @xsize = xsize
      @ysize = ysize
      @zsize = zsize
      @data = []
      @indexes = []
      make_array
    end
    #--------------------------------------------------------------------------
    # * Name      : Element Reference
    #   Info      : Gets an Element returns Element At ID or X,Y,Z
    #   Author    : Selwyn
    #   Call Info : One-Two-Three Arguments
    #               One - Integer id - id of the element to get
    #               Two - Integer x,y - X and Y.
    #               Three - Integer x,y,z - X, Y and Z. 
    #--------------------------------------------------------------------------
    def [](*args)
      case args.size
      when 1
        return @data[args[0]]
      when 2, 3
        return @data[id(*args)]
      end
    end
    #--------------------------------------------------------------------------
    # * Name      : Element Assignment
    #   Info      : Assigns an Object to Element
    #   Author    : Selwyn
    #   Call Info : Two-Three-Four Arguments
    #               Two Integer id - id of the Element to set 
    #                   Object obj - object assigned to id
    #               Three Integer x,y - X and Y.
    #                     Object obj - object assigned to id.
    #               Four Integer x,y,z - X, Y and Z.
    #                     Object obj - object assigned to id.
    #--------------------------------------------------------------------------
    def []=(*args)
      case args.size
      when 2
        @data[args[0]] = args[1]
      when 3
        @data[id(args[0], args[1])] = args[2]
      when 4
        @data[id(args[0], args[1], args[2])] = args[3]
      end
    end
    #--------------------------------------------------------------------------
    # * Name      : Set X Size
    #   Info      : Sets Width of the Table
    #   Author    : Selwyn
    #   Call Info : One Argument Integer xsize - new size
    #--------------------------------------------------------------------------
    def xsize=(xsize)
      @xsize = xsize
      make_array
    end
    #--------------------------------------------------------------------------
    # * Name      : Set Y Size
    #   Info      : Sets Height of the Table
    #   Author    : Selwyn
    #   Call Info : One Argument Integer ysize - new size
    #--------------------------------------------------------------------------
    def ysize=(ysize)
      @ysize = ysize
      make_array
    end
    #--------------------------------------------------------------------------
    # * Name      : Set Z Size
    #   Info      : Sets Depth of the Table
    #   Author    : Selwyn
    #   Call Info : One Argument Integer zsize - new size
    #--------------------------------------------------------------------------
    def zsize=(zsize)
      @zsize = zsize
      make_array
    end
    #--------------------------------------------------------------------------
    # * Name      : Set Size
    #   Info      : Sets Dimensions of the Table
    #   Author    : Selwyn
    #   Call Info : Two or Three - Integer xsize, ysize, zsize - Dimensions
    #--------------------------------------------------------------------------
    def resize(xsize, ysize, zsize = 0)
      @xsize = xsize
      @ysize = ysize
      @zsize = zsize
      make_array
    end
    #--------------------------------------------------------------------------
    # * Name      : Make Array
    #   Info      : Creates Data Array
    #   Author    : Selwyn
    #   Call Info : No Arguments
    #--------------------------------------------------------------------------
    def make_array
      max = @xsize * @ysize * (@zsize + 1)
      @data = nil
      @data = Array.new(max)
      @indexes = []
      if @zsize > 0
        for i in 0...max
          xy = i % (@xsize * @ysize)
          x = xy % @xsize
          y = xy / @xsize
          z = (i - xy) / (@xsize * @ysize)
          @indexes << [x, y, z]
        end
      else
        for i in 0...max
          @indexes << [i % @xsize, i / @xsize]
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Name      : ID
    #   Info      : Returns id of element
    #   Author    : Selwyn
    #   Call Info : Two or Three Arguments Integer X and Y and Z
    #--------------------------------------------------------------------------
    def id(x, y, z = 0)
      x %= @xsize; y %= @ysize; z %= @zsize
      return (x + y * @xsize) + (@xsize * @ysize * z)
    end
    #--------------------------------------------------------------------------
    # * Name      : Coord
    #   Info      : Gets Coordinates - Array [x, y(, z)]
    #   Author    : Selwyn
    #   Call Info : One Integer ID, Id to get coordinates from
    #--------------------------------------------------------------------------
    def coord(id)
      #xy = id % (@xsize * @ysize)
      #x = xy % @xsize
      #y = xy / @xsize
      #z = (id - xy) / (@xsize * @ysize)
      return @indexes[id]
    end
    #--------------------------------------------------------------------------
    # * Name      : Clear
    #   Info      : Clears the Table
    #   Author    : Selwyn
    #   Call Info : No Arguments
    #--------------------------------------------------------------------------
    def clear
      @data.clear
    end
    #--------------------------------------------------------------------------
    # * Name      : Size
    #   Info      : Returns the Table size
    #   Author    : Selwyn
    #   Call Info : No Arguments
    #--------------------------------------------------------------------------
    def size
      @data.size
    end
    #--------------------------------------------------------------------------
    # * Name      : ID Index
    #   Info      : Returns the ID position of the object in the Table
    #   Author    : Selwyn
    #   Call Info : Object object
    #--------------------------------------------------------------------------
    def id_index(object)
      return @data.index(object)
    end
    #--------------------------------------------------------------------------
    # * Name      : Coord Index
    #   Info      : Returns the Coordinates of the object in the Table
    #   Author    : Selwyn
    #   Call Info : Object object
    #--------------------------------------------------------------------------
    def coord_index(object)
      return coord(@data.index(object))
    end
  end
  
  
  #==============================================================================
  # ** Classes.Window ReadFile (1.01)                           By SephirothSpawn
  #------------------------------------------------------------------------------
  # * Description :
  #
  #   This script was designed to allow you to open a text file and display
  #   the lines on a window. It can read the lines directly and draw the text
  #   or it can evaluate it as direct code.
  #
  #   As an added feature, there is a feature that will allow you to open the
  #   window on the map with a simple call script and dispose of the window
  #   just as easy.
  #------------------------------------------------------------------------------
  # * Syntax :
  #
  #   Creating Window Object
  #    - <object> = Window_ReadFile.new(x, y, w, h, filename, complex, ls)
  #
  #      x, y, w & h  - Window Size
  #      filename     - filename
  #      complex      - true (lines evaluated as direct script) or
  #                     false (lines draws as text)
  #      ls           - linespacing (usually 24 or 32)
  #
  #   Opening Window On Map
  #    - $scene.open_readfile_w(x, y, w, h, filename, complex, ls)
  #==============================================================================
  
  MACL::Loaded << 'Classes.Window_ReadFile'
    
  #==============================================================================
  # ** Window_ReadFile
  #==============================================================================
  
  class Window_ReadFile < Window_Base
    #--------------------------------------------------------------------------
    # * Object Initialization
    #
    #   If complex is true, each line is read as direct code (For scripters)
    #   If complex is false, each line will be directly read and drawn
    #
    #   Line Spacing is the Space Between Lines (Only Needed for non-complex)
    #--------------------------------------------------------------------------
    def initialize(x, y, w, h, filename, complex = true, line_spacing = 24)
      # Creates Window
      super(x, y, w, h)
      # Opens File
      lines = IO.readlines(filename)
      # If Complex
      if complex
        # Passes Through Each Line of Code - Evaluates Line
        lines.each { |line| eval line }
      # If Simple
      else
        # Creates Bitmap
        self.contents = Bitmap.new(width - 32, lines.size * line_spacing)
        # Passes Through Each Line
        for i in 0...lines.size
          rect = Rect.new(0, i * line_spacing, contents.width, line_spacing)
          self.contents.draw_text(rect, lines[i])
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Update
    #--------------------------------------------------------------------------
    def update
      super
      # If Active
      if self.active
        # If Up is Pressed
        if Input.press?(Input::UP)
          self.oy -= 4 if self.oy > 0
        # If Down is Pressed
        elsif Input.press?(Input::DOWN)
          self.oy += 4 if self.oy < self.contents.height - 64
        end
      end
    end
  end
  
  #==============================================================================
  # ** Scene_Map
  #==============================================================================
  
  class Scene_Map
    #--------------------------------------------------------------------------
    # * Alias Listings
    #--------------------------------------------------------------------------
    alias_method :seph_wndrf_scnmap_update, :update
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      # If ReadFile Window Present
      unless @readfile_window.nil?
        # Update Readfile
        update_seph_readfilewindow
        return
      end
      # Original Update
      seph_wndrf_scnmap_update
    end
    #--------------------------------------------------------------------------
    # * Frame Update : ReadFile Window
    #--------------------------------------------------------------------------
    def update_seph_readfilewindow
      # If B Button is Pressed
      if Input.trigger?(Input::B)
        # Play Cancel SE
        $game_system.se_play($data_system.cancel_se)
        # Delete ReadFile Window
        @readfile_window.dispose
        @readfile_window = nil
      end
    end
    #--------------------------------------------------------------------------
    # * Open ReadFile Window
    #--------------------------------------------------------------------------
    def open_readfile_w(x, y, w, h, f, c = true, ls = 24)
      # Creates ReadFile Window
      @readfile_window = Window_ReadFile.new(x, y, w, h, f, c, ls)
    end
  end
  
  #==============================================================================
  # ** Classes.Window_Scrollable                                    By: Trickster
  #------------------------------------------------------------------------------
  #  This window class contains scroll functions. To use create a window, 
  #  inheriting From this class set <window>.contents_rect to the rect of all the 
  #  text, speed to the speed of scrolling, and horizontal/vertical_scroll to 
  #  true to allow scrolling, for a practical example on how to use see my 
  #  Advanced Mission script
  #==============================================================================
  
  MACL::Loaded << 'Classes.Window_Scrollable'
  
  #==============================================================================
  # ** Window_Scrollable
  #==============================================================================
  
  class Window_Scrollable < Window_Base
    #-------------------------------------------------------------------------
    # * Public Instance Variables
    #-------------------------------------------------------------------------
    attr_accessor :speed
    attr_accessor :contents_rect
    attr_writer   :horizontal_scroll
    attr_writer   :vertical_scroll
    #-------------------------------------------------------------------------
    # * Name      : Initialize
    #   Info      : Object Initialization
    #   Author    : Trickster
    #   Call Info : Four Arguments
    #              Integer X and Y, Define Starting Position
    #              Width and Height, Define Width and Height of the Window
    #-------------------------------------------------------------------------
    def initialize(x, y, width, height)
      super(x, y, width, height)
      @contents_rect = Rect.new(0,0,width,height)
      @speed = 0
      @horizontal_scroll = false
      @vertical_scroll = false
    end
    #-------------------------------------------------------------------------
    # * Name      : Vertical?
    #   Info      : Can window's contents move Vertically?
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def vertical?
      return false if self.contents == nil
      return self.contents.height > self.height - 32
    end
    #-------------------------------------------------------------------------
    # * Name      : Horizontal?
    #   Info      : Can window's contents move Horizontally
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def horizontal?
      return false if self.contents == nil
      return self.contents.width > self.width - 32
    end
    #-------------------------------------------------------------------------
    # * Name      : Update
    #   Info      : Frame Update
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def update
      super
      return if not self.active
      if Input.repeat?(Input::UP)
        if self.oy > @contents_rect.y and @vertical_scroll and vertical?
          self.oy = [self.oy - speed, @contents_rect.y].max
        end
      end
      if Input.repeat?(Input::LEFT)
        if self.ox > @contents_rect.x and @horizantal_scroll and horizantal?
          self.ox = [self.ox - speed, @contents_rect.x].max
        end
      end
      if Input.repeat?(Input::DOWN)
        if self.oy < @contents_rect.height - (self.height - 32) and @vertical_scroll and vertical?
          self.oy = [self.oy + speed, @contents_rect.height].min
        end
      end
      if Input.repeat?(Input::RIGHT)
        if self.ox < @contents_rect.width - (self.width - 32)  and @horizantal_scroll and horizantal?
          self.ox = [self.ox - speed, @contents_rect.width].min
        end
      end
    end
  end
  
  #==============================================================================
  # ** Classes.Window_SelectableCommand                             By: Trickster
  #------------------------------------------------------------------------------
  #  This window deals with general command choices. Also Includes a Cursor
  #  Height Parameter which controls the Cursor's Height.
  #==============================================================================
  
  MACL::Loaded << 'Classes.Window_SelectableCommand'
  
  #==============================================================================
  # ** Window_SelectableCommand
  #==============================================================================
  
  class Window_SelectableCommand < Window_Selectable
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader     :command
    attr_accessor   :cursor_height
    #-------------------------------------------------------------------------
    # * Initialize
    #-------------------------------------------------------------------------
    def initialize(width, commands)
      # Compute window height from command quantity
      super(0, 0, width, commands.size * 32 + 32)
      # Setup Item Max and Commands
      @commands, @item_max = commands, commands.size
      # Sets Up Cursor Height
      @cursor_height = 32
      # Setup Index
      self.index = 0
    end
    #--------------------------------------------------------------------------
    # * Get Top Row
    #--------------------------------------------------------------------------
    def top_row
      # Divide y-coordinate of window contents transfer origin by 1 row
      # height of @cursor_height
      return self.oy / @cursor_height
    end
    #--------------------------------------------------------------------------
    # * Set Top Row
    #--------------------------------------------------------------------------
    def top_row=(row)
      # If row is less than 0, change it to 0
      if row < 0
        row = 0
      end
      # If row exceeds row_max - 1, change it to row_max - 1
      if row > row_max - 1
        row = row_max - 1
      end
      # Multiply 1 row height by 32 for y-coordinate of window contents
      # transfer origin
      self.oy = row * @cursor_height
    end
    #--------------------------------------------------------------------------
    # * Get Number of Rows Displayable on 1 Page
    #--------------------------------------------------------------------------
    def page_row_max
      # Subtract a frame height of 32 from the window height, and divide it by
      # 1 row height of @cursor_height
      return (self.height - 32) / @cursor_height
    end
    #--------------------------------------------------------------------------
    # * Command
    #--------------------------------------------------------------------------
    def command(index = self.index)
      return @commands[index]
    end
    #-------------------------------------------------------------------------
    # * Set Commands
    #-------------------------------------------------------------------------
    def commands=(commands)
      # Return if Commands Are Same
      return if @commands == commands
      # Reset Commands
      @commands = commands
      # Resets Item Max
      item_max = @item_max
      @item_max = @commands.size
      # If Item Max Changes
      unless item_max == @item_max
        # Deletes Existing Contents (If Exist)
        self.contents.dispose unless self.contents.nil?
        # Recreates Contents
        self.contents = Bitmap.new(width - 32, @item_max * 32)
      end
      # Refresh Window
      refresh
    end
    #-------------------------------------------------------------------------
    # * Refresh
    #-------------------------------------------------------------------------
    def refresh
      # Clear Contents
      self.contents.clear
      # Setup Item Max
      @item_max.times {|i| draw_item(i, normal_color)}
    end
    #-------------------------------------------------------------------------
    # * Draw Item
    #-------------------------------------------------------------------------
    def draw_item(index, color)
      # Setup Font Color
      self.contents.font.color = color
      # Setup Rect
      rect = Rect.new(4, 32 * index, self.contents.width - 8, 32)
      # Erase At Rect
      self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
      # Draw Command
      self.contents.draw_text(rect, @commands[index])
    end
    #-------------------------------------------------------------------------
    # * Disable Item
    #-------------------------------------------------------------------------
    def disable_item(index)
      # Draw In Disabled Color
      draw_item(index, disabled_color)
    end
    #--------------------------------------------------------------------------
    # * Update Cursor Rectangle
    #--------------------------------------------------------------------------
    def update_cursor_rect
      # If cursor position is less than 0 or not active
      if @index < 0 or not self.active
        self.cursor_rect.empty
        return
      end
      # Get current row
      row = @index / @column_max
      # If current row is before top row
      if row < self.top_row
        # Scroll so that current row becomes top row
        self.top_row = row
      end
      # If current row is more to back than back row
      if row > self.top_row + (self.page_row_max - 1)
        # Scroll so that current row becomes back row
        self.top_row = row - (self.page_row_max - 1)
      end
      # Calculate cursor width
      cursor_width = self.width / @column_max - 32
      # Calculate cursor coordinates
      x = @index % @column_max * (cursor_width + 32)
      y = @index / @column_max * @cursor_height - self.oy
      # Update cursor rectangle
      self.cursor_rect.set(x, y, cursor_width, @cursor_height)
    end
  end
  
  #===============================================================================
  # * Classes.Zoomed_Sprite                                          By: Trickster
  #-------------------------------------------------------------------------------
  #  This class is for displaying a zoomed in sprite. It inherits from 
  #  class Sprite. Allows for the programmer to specify a zoom level when creating
  #  Sprites and also width and height methods that get the width and height of 
  #  the Sprite and not the Bitmap
  #===============================================================================
  
  MACL::Loaded << 'Classes.Zoomed_Sprite'
  
  #==============================================================================
  # ** Zoomed_Sprite
  #==============================================================================
  
  class Zoomed_Sprite < Sprite
    #-------------------------------------------------------------------------
    # * Name      : Initialize
    #   Info      : Object Initialization
    #   Author    : Trickster
    #   Call Info : Zero to Two Arguments
    #               Float Zoom_Level, the level of zooming (Defaults to 1.0)
    #               Viewport viewport, the viewport used (Defaults to whole screen)
    #-------------------------------------------------------------------------
    def initialize(zoom_level = 1.0, viewport = nil)
      super(viewport)
      self.zoom_x = zoom_level
      self.zoom_y = zoom_level
    end
    #-------------------------------------------------------------------------
    #   Name      : Get Width
    #   Info      : Gets the width of the sprite or 0 if no bitmap
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def width
      return 0 if bitmap.nil?
      return self.bitmap.width * self.zoom_x
    end
    #-------------------------------------------------------------------------
    #   Name      : Get Height
    #   Info      : Gets the height of the sprite or 0 if no bitmap
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def height
      return 0 if bitmap.nil?
      return self.bitmap.height * self.zoom_y
    end
  end
  
  #==============================================================================
  # ** Modules.Battle Simulator (1.0)                           By SephirothSpawn
  #------------------------------------------------------------------------------
  # * Description :
  #
  #   This script was designed to let you create custom troops easily and test
  #   them or default test battles.
  #------------------------------------------------------------------------------
  # * Syntax :
  #
  #   Starting Battle Simulator vs. Single Enemy
  #    - BattleSimulator.start_enemy_battle(enemy_id)
  #
  #   Starting Battle Simulator vs. Multiple Enemies
  #    - BattleSimulator.start_custom_troop_battle([enemy_id, ...])
  #------------------------------------------------------------------------------
  # * Changing Battle Simulator Settings
  #
  #   Enemy EXP Drop Percent (Defaults to 100%)
  #    - $game_system.battle_simulator.exp_percent = n
  #
  #   Enemy Gold Drop Percent (Defaults to 100%)
  #    - $game_system.battle_simulator.gold_percent = n
  #
  #   Enemy Treasure Drop Probability
  #    - $game_system.battle_simulator.drop_percent = n
  #==============================================================================
  
  MACL::Loaded << 'Modules.Battle Simulator'
    
  #==============================================================================
  # ** BattleSimulator
  #==============================================================================
    
  module BattleSimulator
    #--------------------------------------------------------------------------
    # * Flags
    #--------------------------------------------------------------------------
    @delete_last_troop     = false
    @previous_scene        = $scene.class
    #--------------------------------------------------------------------------
    # * Start Enemy Battle
    #--------------------------------------------------------------------------
    def self.start_enemy_battle(enemy_id)
      # Start Custom Troop Battle
      self.start_custom_troop_battle([enemy_id])
    end
    #--------------------------------------------------------------------------
    # * Start Custom Troop Battle
    #--------------------------------------------------------------------------
    def self.start_custom_troop_battle(enemies)
      # Create Dummy Troop
      new_troop = RPG::Troop.new
      new_troop.id = $data_troops.size
      new_troop.name = 'Battle Simulator'
      new_troop.members = []
      # Pass Through Enemies
      for i in 0...enemies.size
        # Create Member Page
        member = RPG::Troop::Member.new
        member.enemy_id = enemies[i]
        member.x = 640 / (enemies.size + 1) * (i + 1)
        member.y = 320 - rand(40)
        new_troop.members << member
      end
      # Add Troop to Data Troop
      $data_troops << new_troop
      # Set Flags
      @delete_last_troop   = true
      # Start Troop Battle
      self.start_troop_battle(new_troop.id)
    end
    #--------------------------------------------------------------------------
    # * Start Troop Battle
    #--------------------------------------------------------------------------
    def self.start_troop_battle(troop_id)
      # Change Battle Simulator Settings
      $game_system.battle_simulator.on = true
      # Memorize map BGM and stop BGM
      $game_temp.map_bgm = $game_system.playing_bgm
      $game_system.bgm_stop
      # Play battle start SE
      $game_system.se_play($data_system.battle_start_se)
      # Play battle BGM
      $game_system.bgm_play($game_system.battle_bgm)
      # Straighten player position
      $game_player.straighten
      # Memorize Scene
      @previous_scene = $scene.class
      # Set Battle Troop ID
      $game_temp.battle_troop_id = troop_id
      # Switch to battle screen
      $scene = Scene_Battle.new
    end
    #--------------------------------------------------------------------------
    # * End Battle
    #
    #   Result - 0 : Win ; 1 : Lose ; 2 : Escape
    #--------------------------------------------------------------------------
    def self.end_battle(result = 0)
      # Change Battle Simulator Settings
      $game_system.battle_simulator.on = false
      # Delete Troop if Flag set
      $data_troops.pop if @delete_last_troop
      # Turn Delete Last Troop Flag Off
      @delete_last_troop = false
      # Return to Previous Scene
      @previous_scene = @previous_scene.new
    end
  end
  
  #============================================================================
  # ** Game_System::Battle Simulator
  #============================================================================
  
  class Game_System::Battle_Simulator
    #------------------------------------------------------------------------
    # * Public Instance Variables
    #------------------------------------------------------------------------
    attr_accessor :on
    attr_accessor :exp_percent
    attr_accessor :gold_percent
    attr_accessor :drop_percent
    #------------------------------------------------------------------------
    # * Object Initialization
    #------------------------------------------------------------------------
    def initialize
      @on, @exp_percent, @gold_percent, @drop_percent = false, 100, 100, 100
    end
  end
  
  #==============================================================================
  # ** Game_System
  #==============================================================================
    
  class Game_System
    #------------------------------------------------------------------------
    # * Public Instance Variables
    #------------------------------------------------------------------------
    attr_accessor :battle_simulator
    #--------------------------------------------------------------------------
    # * Alias Listings
    #--------------------------------------------------------------------------
    alias_method :macl_gmsys_init,  :initialize
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      # Original Initialization
      macl_gmsys_init
      # Set game system settings
      @battle_simulator = Game_System::Battle_Simulator.new
    end
  end
  
  #==============================================================================
  # ** Game_Temp
  #==============================================================================
  
  class Game_Temp
    #--------------------------------------------------------------------------
    # * Alias Listings
    #--------------------------------------------------------------------------
    alias_method :seph_battlesimulator_gmtmp_bcl, :battle_can_lose
    #--------------------------------------------------------------------------
    # * Battle can lose test
    #--------------------------------------------------------------------------
    def battle_can_lose
      result = $game_temp.nil? ? false : $game_system.battle_simulator.on
      return seph_battlesimulator_gmtmp_bcl || result
    end
  end
  
  #==============================================================================
  # ** Game_Enemy
  #==============================================================================
  
  class Game_Enemy
    #--------------------------------------------------------------------------
    # * Alias Listings
    #--------------------------------------------------------------------------
    alias_method :seph_battlesimulator_gmeny_exp, :exp
    alias_method :seph_battlesimulator_gmeny_gld, :gold
    alias_method :seph_battlesimulator_gmeny_tsp, :treasure_prob
    #--------------------------------------------------------------------------
    # * Get EXP
    #--------------------------------------------------------------------------
    def exp
      n = seph_battlesimulator_gmeny_exp
      if $game_system.battle_simulator.on
        n = Integer(n * ($game_system.battle_simulator.exp_percent / 100.0))
      end
      return n
    end
    #--------------------------------------------------------------------------
    # * Get Gold
    #--------------------------------------------------------------------------
    def gold
      n = seph_battlesimulator_gmeny_gld
      if $game_system.battle_simulator.on
        n = Integer(n * ($game_system.battle_simulator.gold_percent / 100.0))
      end
      return n
    end
    #--------------------------------------------------------------------------
    # * Get Treasure Appearance Probability
    #--------------------------------------------------------------------------
    def treasure_prob
      n = seph_battlesimulator_gmeny_tsp
      if $game_system.battle_simulator.on
        n = Integer(n * ($game_system.battle_simulator.drop_percent / 100.0))
      end
      return n
    end
  end
  
  #==============================================================================
  # ** Modules.Bitmap File Dump (1.01)                          By SephirothSpawn
  #------------------------------------------------------------------------------
  # * Description :
  #
  #   This script was designed to let you save bitmaps as information files
  #------------------------------------------------------------------------------
  # * Instructions
  #
  #   Make Sure there is a folder in your game folder named 'Saved Bitmaps'
  #------------------------------------------------------------------------------
  # * Syntax :
  #
  #   Saving Bitmap :
  #    - BitmapDump.save_bitmap(<bitmap>, 'filename')
  #
  #   Loading Bitmap :
  #    - BitmapDump.load_bitmap('filename')
  #==============================================================================
  
  MACL::Loaded << 'Modules.BitmapFileDump'
    
  #==============================================================================
  # ** BitmapDump
  #==============================================================================
  
  module BitmapDump
    #--------------------------------------------------------------------------
    # * Directory
    #--------------------------------------------------------------------------
    Directory = 'Graphics/Saved Images'
    #--------------------------------------------------------------------------
    # * Save Bitmap
    #--------------------------------------------------------------------------
    def self.save_bitmap(bitmap, filename)
      # Creates Color Values Table
      red = Table.new(bitmap.width, bitmap.height)
      green = Table.new(bitmap.width, bitmap.height)
      blue = Table.new(bitmap.width, bitmap.height)
      alpha = Table.new(bitmap.width, bitmap.height)
      # Collects Bimap Pixels and saves
      for i in 0...bitmap.width
        for j in 0...bitmap.height
          color = bitmap.get_pixel(i, j)
          red[i, j] = color.red
          green[i, j] = color.green
          blue[i, j] = color.blue
          alpha[i, j] = color.alpha
        end
      end
      # Saves File
      file = File.open(Directory + filename + '.rxdata', 'wb')
        Marshal.dump([red, green, blue, alpha], file)
      file.close
    end
    #--------------------------------------------------------------------------
    # * Save Bitmap
    #--------------------------------------------------------------------------
    def self.read_bitmap(filename)
      # Opens File
      file = File.open(Directory + filename + '.rxdata', "rb")
        colors = Marshal.load(file)
      file.close
      # Assigns Color Tables
      red, green, blue, alpha = colors[0], colors[1], colors[2], colors[3], 
                                colors[4]
      bitmap = Bitmap.new(red.xsize, red.ysize)
      # Sets Bitmap Pixels
      for i in 0...bitmap.width
        for j in 0...bitmap.height
          bitmap.set_pixel(i, j, Color.new(red[i, j], green[i, j], blue[i, j], 
                                           alpha[i, j]))
        end
      end
      # Returns Bitmap
      return bitmap
    end
  end
  
  
  #==============================================================================
  # ** Modules.Interpreter (1.0)                         By SephirothSpawn
  #------------------------------------------------------------------------------
  # * Description :
  #
  #   This script was designed to allow you to call event commands and custom
  #   commands with a simple call script funcion. Most event commands are 
  #   included and several non-event commands were created.
  #------------------------------------------------------------------------------
  # * Syntax :
  #
  #   Show Text
  #    - MInterpreter.show_text('line 1', 'line 2', 'line 3', 'line 4')
  #   Erase Event
  #    - MInterpreter.erase_event(event_id)
  #   Call Common Event
  #    - MInterpreter.common_event(event_id)
  #   Control Switches
  #    - MInterpreter.control_switches( { switch_id => state, ... } )
  #   Control Variables
  #    - MInterpreter.control_variables( { variable_id => value, ... } )
  #   Control Self Switches
  #    - MInterpreter.control_selfsw( { <key> => state, ... } )
  #   Control Time
  #    - MInterpreter.change_timer(state = false, seconds = 0)
  #   Change Gold
  #    - MInterpreter.change_gold( value )
  #   Change Items
  #    - MInterpreter.change_items( { item_id => n, ... } )
  #   Change Weapons
  #    - MInterpreter.change_weapons( { weapon_id => n, ... } )
  #   Change Armors
  #    - MInterpreter.change_armors( { armor_id => n, ... } )
  #   Change Party Members
  #    - MInterpreter.change_party(actor_id, add = true, initialize = true)
  #   Change Windowskin
  #    - MInterpreter.change_windowskin(filename = $game_system.windowskin_name)
  #   Change Battle BGM
  #    - MInterpreter.change_btlbgm(filename, volume = 100, pitch = 100)
  #   Change Save Access
  #    - MInterpreter.save_access(state = true)
  #   Change Menu Access
  #    - MInterpreter.menu_access(state = true)
  #   Change Encounter
  #    - MInterpreter.encounter(state = true)
  #   Transfer Player
  #    - MInterpreter.transfer_player(map_id, x, y, direction, fading = true)
  #   Set Event Location
  #    - MInterpreter.set_event_location(target_event_id, parameters, direction)
  #   Scroll Map
  #    - MInterpreter.scroll_map(direction, distance, speed)
  #   Change Panorama
  #    - MInterpreter.change_panorama(filename = current, hue = current)
  #   Change Fog
  #    - MInterpreter.change_fog(filename, hue, opacity, blend, zoom, sx, sy)
  #   Change Fog Color
  #    - MInterpreter.change_fog_color(tone, duration)
  #   Change Fog Opacity
  #    - MInterpreter.change_fog_opacity(opacity, duration)
  #   Change Panorama
  #    - MInterpreter.change_battleback(filename = current)
  #   Show Animation
  #    - MInterpreter.show_animation(target_id, animation_id)
  #   Change Transparent Flag
  #    - MInterpreter.change_player_transparent(state = true)
  #   Execute Transition
  #    - MInterpreter.execute_transition(filename = '')
  #   Change Screen Color
  #    - MInterpreter.change_screen_color(color, duration)
  #   Screen Flash
  #    - MInterpreter.flash_screen(color, duration)
  #   Screen Shake
  #    - MInterpreter.shake_screen(power, speed, duration)
  #   Show Picture
  #    - MInterpreter.show_picture(picture_number, filename, origin, x, y, 
  #      zoom_x, zoom_y, opacity, blend_type)
  #   Move Picture
  #    - MInterpreter.move_picture(picture_number, duration, origin, x, y, 
  #      zoom_x, zoom_y, opacity, blend_type)
  #   Rotate Picture
  #    - MInterpreter.rotate_picture(picture_number, speed)
  #   Change Picture Tone
  #    - MInterpreter.change_picture_tone(picture_number, tone, duration)
  #   Erase Picture
  #    - MInterpreter.erase_picture(picture_number)
  #   Set Weather Effects
  #    - MInterpreter.set_weather_effects(type, power, time)
  #   Play BGM
  #    - MInterpreter.play_bgm(filename, volume = 100, pitch = 100)
  #   Fade Out BGM
  #    - MInterpreter.fade_bgm(seconds = 0)
  #   Play BGS
  #    - MInterpreter.play_bgs(filename, volume = 100, pitch = 100)
  #   Fade Out BGS
  #    - MInterpreter.fade_bgm(seconds = 0)
  #   Memorize BGM/BGS
  #    - MInterpreter.memorize_bgms
  #   Restore BGM/BGS
  #    - MInterpreter.restore_bgms
  #   Play ME
  #    - MInterpreter.play_me(filename, volume = 100, pitch = 100)
  #   Play SE
  #    - MInterpreter.play_se(filename, volume = 100, pitch = 100)
  #   Stop SE
  #    - MInterpreter.stop_se
  #   Battle Processing
  #    - MInterpreter.battle_proc(troop_id, can_escape = true, can_lose = true)
  #   Shop Processing
  #    - MInterpreter.shop_proc(*goods)
  #   Name Input Processing
  #    - MInterpreter.name_input_proc(actor_id, max_chrs = 8)
  #   Change Actor Stat
  #    - MInterpreter.change_actor_stat(actor_id, stat_name, value)
  #   Gain Actor Skills
  #    - MInterpreter.gain_actor_skills(actor_id, *skill_ids)
  #   Lose Actor Skills
  #    - MInterpreter.lose_actor_skills(actor_id, *skill_ids)
  #   Gain Actor States
  #    - MInterpreter.gain_actor_states(actor_id, *skill_ids)
  #   Lose Actor States
  #    - MInterpreter.lose_actor_states(actor_id, *skill_ids)
  #   Change Actor Equipment
  #    - MInterpreter.change_actor_equip(actor_id, type, id)
  #   Change Event Graphic
  #    - MInterpreter.change_event_graphic(target_id, character_name, hue = 0)
  #   Change Actor Character Graphic
  #    - MInterpreter.change_actor_cgraphic(actor_id, character_name, hue = 0)
  #   Change Actor Battler Graphic
  #    - MInterpreter.change_actor_bgraphic(actor_id, battler_name, hue = 0)
  #   Recover All
  #    - MInterpreter.recover_all(actor_id, ...) (0 for actor id for all party)
  #   Call Scene
  #    - MInterpreter.call_scene(scene_name)
  #   Save To Index
  #    - MInterpreter.save_index(index = 0)
  #   Save To Filename
  #    - MInterpreter.save_filename(filename = 'Save File')
  #   Load From Index
  #    - MInterpreter.load_index(index = 0)
  #   Load From Filename
  #    - MInterpreter.load_filename(filename = 'Save File')
  #==============================================================================
  
  MACL::Loaded << 'Modules.Interpreter Module'
  
  #==============================================================================
  # ** Interpreter Module
  #==============================================================================
  
  module MInterpreter
    #--------------------------------------------------------------------------
    # * Show Text
    #
    #   MInterpreter.show_text('line 1', 'line 2', 'line 3', 'line 4')
    #--------------------------------------------------------------------------
    def self.show_text(*text_lines)
      # Clear Message Text
      $game_temp.message_text = ''
      # Pass Through Each Line
      text_lines.each {|line| $game_temp.message_text += line + "\n"}
    end
    #--------------------------------------------------------------------------
    # * Erase Event
    #
    #   MInterpreter.erase_event(event_id)
    #--------------------------------------------------------------------------
    def self.erase_event(event_id)
      # If Event Found
      if $game_map.events.has_key?(event_id)
        # Erase Event
        $game_map.events[event_id].erase
      end
    end
    #--------------------------------------------------------------------------
    # * Call Common Event
    #
    #   MInterpreter.common_event(event_id)
    #--------------------------------------------------------------------------
    def self.common_event(c_event_id)
      # If Common Event Exist
      unless $data_common_events[c_event_id].nil?
        # If in Battle
        if $game_temp.in_battle
          # Run Common Event
          common_event = $data_common_events[c_event_id]
          $game_system.battle_interpreter.setup(common_event.list)
        # If Somewhere Else
        else
          # Set Temp Common Event ID
          $game_temp.common_event_id = c_event_id
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Control Switches
    #
    #   MInterpreter.control_switches( { switch_id => state, ... } )
    #--------------------------------------------------------------------------
    def self.control_switches(switches)
      # Pass Through Every Switch and Set State
      switches.each { |switch_id, state| $game_switches[switch_id] = state }
    end
    #--------------------------------------------------------------------------
    # * Control Variables
    #
    #   MInterpreter.control_variables( { variable_id => value, ... } )
    #--------------------------------------------------------------------------
    def self.control_variables(vars)
      # Pass Through Every Switch and State
      vars.each { |variable_id, value| $game_variables[variable_id] = value }
    end
    #--------------------------------------------------------------------------
    # * Control Self Switches
    #
    #   MInterpreter.control_selfsw( { <key> => state, ... } )
    #
    #   <key> = [map_id, event_id, letter] ( letter : 'A', 'B', 'C', 'D' )
    #--------------------------------------------------------------------------
    def self.control_selfsw(switches)
      # Pass Through Every Switch and State
      control_selfsw.each { |key, state| $game_self_switches[key] = state }
    end
    #--------------------------------------------------------------------------
    # * Control Time
    #
    #   MInterpreter.change_timer(state = false, seconds = 0)
    #--------------------------------------------------------------------------
    def self.change_timer(state = false, seconds = 0)
      # Se Timer State
      $game_system.timer_working = state
      # Set Timer
      $game_system.timer = seconds * Graphics.frame_rate
    end
    #--------------------------------------------------------------------------
    # * Change Gold
    #
    #   MInterpreter.change_gold( value )
    #--------------------------------------------------------------------------
    def self.change_gold(value)
      # Gain Gold
      $game_party.gain_gold(value)
    end
    #--------------------------------------------------------------------------
    # * Change Items
    #
    #   MInterpreter.change_items( { item_id => n, ... } )
    #--------------------------------------------------------------------------
    def self.change_items(items)
      # Pass Through Each Item List
      items.each { |item_id, n| $game_party.gain_item(item_id, n) }
    end
    #--------------------------------------------------------------------------
    # * Change Weapons
    #
    #   MInterpreter.change_weapons( { weapon_id => n, ... } )
    #--------------------------------------------------------------------------
    def self.change_weapons(weapons)
      # Pass Through Each Item List
      weapons.each { |weapon_id, n| $game_party.gain_weapon(weapon_id, n) }
    end
    #--------------------------------------------------------------------------
    # * Change Armors
    #
    #   MInterpreter.change_armors( { armor_id => n, ... } )
    #--------------------------------------------------------------------------
    def self.change_armors(armors)
      # Pass Through Each Item List
      armors.each { |armor_id, n| $game_party.gain_armor(armor_id, n) }
    end
    #--------------------------------------------------------------------------
    # * Change Party Members
    #
    #   MInterpreter.change_party(actor_id, add = true, initialize = true)
    #--------------------------------------------------------------------------
    def self.change_armors(actor_id, add = true, initialize = true)
      # Return if Nil Actor
      return if $data_actors[actor_id].nil?
      # Setup Actor If Initialize
      $game_actors[actor_id].setup(actor_id) if initialize
      # Add or Remove Actor
      add ? $game_party.add_actor(actor_id) : 
            $game_party.remove_actor(actor_id)
    end
    #--------------------------------------------------------------------------
    # * Change Windowskin
    #
    #   MInterpreter.change_windowskin(filename = $game_system.windowskin_name)
    #--------------------------------------------------------------------------
    def self.change_windowskin(filename = $game_system.windowskin_name)
      # Set Windowskin Filename
      $game_system.windowskin_name = filename
    end
    #--------------------------------------------------------------------------
    # * Change Battle BGM
    #
    #   MInterpreter.change_btlbgm(filename, volume = 100, pitch = 100)
    #--------------------------------------------------------------------------
    def self.change_btlbgm(filename, volume = 100, pitch = 100)
      # Create AudioFile
      audiofile = RPG::AudioFile.new(filename, volume, pitch)
      # Set Battle BGM
      $game_system.battle_bgm = audiofile
    end
    #--------------------------------------------------------------------------
    # * Change Save Access
    #
    #   MInterpreter.save_access(state = true)
    #--------------------------------------------------------------------------
    def self.save_access(state = true)
      # Change Save Disabled Flag
      $game_system.save_disabled = !state
    end
    #--------------------------------------------------------------------------
    # * Change Menu Access
    #
    #   MInterpreter.menu_access(state = true)
    #--------------------------------------------------------------------------
    def self.menu_access(state = true)
      # Change Menu Disabled Flag
      $game_system.menu_disabled = !state
    end
    #--------------------------------------------------------------------------
    # * Change Encounter
    #
    #   MInterpreter.encounter(state = true)
    #--------------------------------------------------------------------------
    def self.encounter(state = true)
      # Change Encounter Disabled Flag
      $game_system.encounter_disabled = !state
    end
    #--------------------------------------------------------------------------
    # * Transfer Player
    #
    #   MInterpreter.transfer_player(map_id, x, y, direction, fading = true)
    #
    #   Direction : 2 - Down, 4 - Left, 6 - Right, 8 - Up
    #--------------------------------------------------------------------------
    def self.transfer_player(m, x, y, d = $game_player.direction, f = true)
      # Set player move destination
      $game_temp.player_new_map_id    = m
      $game_temp.player_new_x         = x
      $game_temp.player_new_y         = y
      $game_temp.player_new_direction = d
      # Transition
      if f
        # Prepare for transition
        Graphics.freeze
        # Set transition processing flag
        $game_temp.transition_processing = true
        $game_temp.transition_name = ''
      end
    end
    #--------------------------------------------------------------------------
    # * Set Event Location
    #
    #   MInterpreter.set_event_location(target_event_id, parameters, direction)
    #
    #   Target Event ID = 0 - Player or n - Event ID
    #   Parameters      = [event_id] or [x, y]
    #   Direction : 2 - Down, 4 - Left, 6 - Right, 8 - Up
    #--------------------------------------------------------------------------
    def self.set_event_location(target_id, parameters, dir = 2)
      # Get Character
      character = target_id == 0 ? $game_player : $game_map.events[target_id]
      # Return if Nil
      return if character.nil?
      # If Switching Event Locations
      if parameters.size == 1
        # Get Other Character
        other_character = parameters[0] == 0 ? $game_player : 
          $game_map.events[parameters[0]]
        # Return if Nil Character
        return if other_character.nil?
        # Clone Current Position
        old_x, old_y = character.x, character.y
        # Exchange Locations
        character.move_to(other_character.x, other_character.y)
        other_character.move_to(old_x, old_y)
        # Stop Method Execution
        return
      end
      # Moves Event
      character.move_to(parameters[0], parameters[1])
    end
    #--------------------------------------------------------------------------
    # * Scroll Map
    #
    #   MInterpreter.scroll_map(direction, distance, speed)
    #--------------------------------------------------------------------------
    def self.scroll_map(direction, distance, speed)
      $game_map.start_scroll(direction, distance, speed)
    end
    #--------------------------------------------------------------------------
    # * Change Panorama
    #
    #   MInterpreter.change_panorama(filename = current, hue = current)
    #--------------------------------------------------------------------------
    def self.change_panorama(filename = $game_map.panorama_name, 
                             hue      = $game_map.panorama_hue)
      # Change Settings
      $game_map.panorama_name = filename
      $game_map.panorama_hue  = hue
    end
    #--------------------------------------------------------------------------
    # * Change Fog
    #
    #   MInterpreter.change_fog(filename, hue, opacity, blend, zoom, sx, sy)
    #
    #   * Any Non-Defined will keep current settings
    #--------------------------------------------------------------------------
    def self.change_fog(filename = $game_map.fog_name, hue = $game_map.fog_hue,
        opacity = $game_map.fog_opacity, blend = $game_map.fog_blend_type, 
        zoom = $game_map.fog_zoom, sx = $game_map.fog_sx, sy = $game_map.fog_sy)
      # Change Fog Settings
      $game_map.fog_name       = filename
      $game_map.fog_hue        = hue
      $game_map.fog_opacity    = opacity
      $game_map.fog_blend_type = blend
      $game_map.fog_zoom       = zoom
      $game_map.fog_sx         = sx
      $game_map.fog_sy         = sy
    end
    #--------------------------------------------------------------------------
    # * Change Fog Color
    #
    #   MInterpreter.change_fog_color(tone, duration)
    #--------------------------------------------------------------------------
    def self.change_fog_color(tone, duration)
      # Start color tone change
      $game_map.start_fog_tone_change(tone, duration * 2)
    end
    #--------------------------------------------------------------------------
    # * Change Fog Opacity
    #
    #   MInterpreter.change_fog_opacity(opacity, duration)
    #--------------------------------------------------------------------------
    def self.change_fog_opacity(opacity, duration)
      # Start opacity level change
      $game_map.start_fog_opacity_change(opacity, duration * 2)
    end
    #--------------------------------------------------------------------------
    # * Change Panorama
    #
    #   MInterpreter.change_battleback(filename = current)
    #--------------------------------------------------------------------------
    def self.change_battleback(filename = $game_map.battleback_name)
      # Change Settings
      $game_map.battleback_name  = filename
      $game_temp.battleback_name = filename
    end
    #--------------------------------------------------------------------------
    # * Show Animation
    #
    #   MInterpreter.show_animation(target_id, animation_id)
    #--------------------------------------------------------------------------
    def self.show_animation(target_id, animation_id)
      # Get Character
      character = target_id == 0 ? $game_player : $game_map.events[target_id]
      # Return if Nil
      return if character.nil?
      # Set animation ID
      character.animation_id = animation_id
    end
    #--------------------------------------------------------------------------
    # * Change Transparent Flag
    #
    #   MInterpreter.change_player_transparent(state = true)
    #--------------------------------------------------------------------------
    def self.change_player_transparent(state = true)
      # Change player transparent flag
      $game_player.transparent = state
    end
    #--------------------------------------------------------------------------
    # * Execute Transition
    #
    #   MInterpreter.execute_transition(filename = '')
    #--------------------------------------------------------------------------
    def self.execute_transition(filename = '')
      # Return If transition processing flag is already set
      return if $game_temp.transition_processing
      # Prepare for transition
      Graphics.freeze
      # Set transition processing flag
      $game_temp.transition_processing = true
      $game_temp.transition_name = filename
    end
    #--------------------------------------------------------------------------
    # * Change Screen Color
    #
    #   MInterpreter.change_screen_color(color, duration)
    #--------------------------------------------------------------------------
    def self.change_screen_color(color, duration)
      # Start changing color tone
      $game_screen.start_tone_change(color, duration * 2)
    end
    #--------------------------------------------------------------------------
    # * Screen Flash
    #
    #   MInterpreter.flash_screen(color, duration)
    #--------------------------------------------------------------------------
    def self.flash_screen(color, duration)
      # Start flash
      $game_screen.start_flash(color, duration * 2)
    end
    #--------------------------------------------------------------------------
    # * Screen Shake
    #
    #   MInterpreter.shake_screen(power, speed, duration)
    #--------------------------------------------------------------------------
    def self.shake_screen(power, speed, duration)
      # Start shake
      $game_screen.start_shake(power, speed, duration)
    end
    #--------------------------------------------------------------------------
    # * Show Picture
    #
    #   MInterpreter.show_picture(picture_number, filename, origin, x, y, 
    #   zoom_x, zoom_y, opacity, blend_type)
    #
    #   origin     : 0 - Upper Left, 1 - Center
    #   blend_type : 0 - normal, 1 - addition, 2 - subtraction
    #--------------------------------------------------------------------------
    def self.show_picture(picture_number, filename, origin, x, y, zoom_x, 
        zoom_y, opacity, blend_type)
      # Get picture number
      picture_number = picture_number + ($game_temp.in_battle ? 50 : 0)
      # Show picture
      $game_screen.pictures[picture_number].show(picture_number, filename, 
        origin, x, y, zoom_x, zoom_y, opacity, blend_type)
    end
    #--------------------------------------------------------------------------
    # * Move Picture
    #
    #   MInterpreter.move_picture(picture_number, duration, origin, x, y, 
    #   zoom_x, zoom_y, opacity, blend_type)
    #
    #   origin     : 0 - Upper Left, 1 - Center
    #   blend_type : 0 - normal, 1 - addition, 2 - subtraction
    #--------------------------------------------------------------------------
    def self.move_picture(picture_number, duration, origin, x, y, zoom_x, 
        zoom_y, opacity, blend_type)
      # Get picture number
      picture_number = picture_number + ($game_temp.in_battle ? 50 : 0)
      # Move picture
      $game_screen.pictures[number].move(duration * 2, origin,
        x, y, zoom_x, zoom_y, opacity, blend_type)
    end
    #--------------------------------------------------------------------------
    # * Rotate Picture
    #
    #   MInterpreter.rotate_picture(picture_number, speed)
    #--------------------------------------------------------------------------
    def self.rotate_picture(picture_number, speed)
      # Get picture number
      picture_number = picture_number + ($game_temp.in_battle ? 50 : 0)
      # Set rotation speed
      $game_screen.pictures[picture_number].rotate(speed)
    end
    #--------------------------------------------------------------------------
    # * Change Picture Tone
    #
    #   MInterpreter.change_picture_tone(picture_number, tone, duration)
    #--------------------------------------------------------------------------
    def self.change_picture_tone(picture_number, tone, duration)
      # Get picture number
      picture_number = picture_number + ($game_temp.in_battle ? 50 : 0)
      # Start changing color tone
      $game_screen.pictures[picture_number].start_tone_change(tone, duration)
    end
    #--------------------------------------------------------------------------
    # * Erase Picture
    #
    #   MInterpreter.erase_picture(picture_number)
    #--------------------------------------------------------------------------
    def self.erase_picture(picture_number)
      # Get picture number
      picture_number = picture_number + ($game_temp.in_battle ? 50 : 0)
      # Erase picture
      $game_screen.pictures[picture_number].erase
    end
    #--------------------------------------------------------------------------
    # * Set Weather Effects
    #
    #   MInterpreter.set_weather_effects(type, power, time)
    #--------------------------------------------------------------------------
    def self.set_weather_effects(type, power, time)
      # Set Weather Effects
      $game_screen.weather(type, power, time)
    end
    #--------------------------------------------------------------------------
    # * Play BGM
    #
    #   MInterpreter.play_bgm(filename, volume = 100, pitch = 100)
    #--------------------------------------------------------------------------
    def self.play_bgm(filename, volume = 100, pitch = 100)
      # Create AudioFile
      audiofile = RPG::AudioFile.new(filename, volume, pitch)
      # Play BGM
      $game_system.bgm_play(audiofile)
    end
    #--------------------------------------------------------------------------
    # * Fade Out BGM
    #
    #   MInterpreter.fade_bgm(seconds = 0)
    #--------------------------------------------------------------------------
    def self.fade_bgm(seconds = 0)
      # Fade out BGM
      $game_system.bgm_fade(seconds)
    end
    #--------------------------------------------------------------------------
    # * Play BGS
    #
    #   MInterpreter.play_bgs(filename, volume = 100, pitch = 100)
    #--------------------------------------------------------------------------
    def self.play_bgs(filename, volume = 100, pitch = 100)
      # Create AudioFile
      audiofile = RPG::AudioFile.new(filename, volume, pitch)
      # Play BGS
      $game_system.bgs_play(audiofile)
    end
    #--------------------------------------------------------------------------
    # * Fade Out BGS
    #
    #   MInterpreter.fade_bgm(seconds = 0)
    #--------------------------------------------------------------------------
    def self.fade_bgm(seconds = 0)
      # Fade out BGS
      $game_system.bgs_fade(seconds)
    end
    #--------------------------------------------------------------------------
    # * Memorize BGM/BGS
    #
    #   MInterpreter.memorize_bgms
    #--------------------------------------------------------------------------
    def self.memorize_bgms
      # Memorize BGM/BGS
      $game_system.bgm_memorize
      $game_system.bgs_memorize
    end
    #--------------------------------------------------------------------------
    # * Restore BGM/BGS
    #
    #   MInterpreter.restore_bgms
    #--------------------------------------------------------------------------
    def self.restore_bgms
      # Restore BGM/BGS
      $game_system.bgm_restore
      $game_system.bgs_restore
    end
    #--------------------------------------------------------------------------
    # * Play ME
    #
    #   MInterpreter.play_me(filename, volume = 100, pitch = 100)
    #--------------------------------------------------------------------------
    def self.play_me(filename, volume = 100, pitch = 100)
      # Create AudioFile
      audiofile = RPG::AudioFile.new(filename, volume, pitch)
      # Play ME
      $game_system.me_play(audiofile)
    end
    #--------------------------------------------------------------------------
    # * Play SE
    #
    #   MInterpreter.play_se(filename, volume = 100, pitch = 100)
    #--------------------------------------------------------------------------
    def self.play_se(filename, volume = 100, pitch = 100)
      # Create AudioFile
      audiofile = RPG::AudioFile.new(filename, volume, pitch)
      # Play ME
      $game_system.me_play(audiofile)
    end
    #--------------------------------------------------------------------------
    # * Stop SE
    #
    #   MInterpreter.stop_se
    #--------------------------------------------------------------------------
    def self.stop_se
      # Stop SE
      Audio.se_stop
    end
    #--------------------------------------------------------------------------
    # * Battle Processing
    #
    #   MInterpreter.battle_proc(troop_id, can_escape = true, can_lose = true)
    #--------------------------------------------------------------------------
    def self.battle_proc(troop_id, can_escape = true, can_lose = true)
      # If not invalid troops
      if $data_troops[troop_id] != nil
        # Set battle abort flag
        $game_temp.battle_abort = true
        # Set battle calling flag
        $game_temp.battle_calling = true
        $game_temp.battle_troop_id = troop_id
        $game_temp.battle_can_escape = can_escape
        $game_temp.battle_can_lose = can_lose
      end
    end
    #--------------------------------------------------------------------------
    # * Shop Processing
    #
    #   MInterpreter.shop_proc(*goods)
    #
    #   Goods = [kind, id]   (Kind : 0 - Item, 1 - Weapon, 2 - Armor)
    #--------------------------------------------------------------------------
    def self.shop_proc(*goods)
      # Set battle abort flag
      $game_temp.battle_abort = true
      # Set shop calling flag
      $game_temp.shop_calling = true
      # Set goods list on new item
      $game_temp.shop_goods = goods
    end
    #--------------------------------------------------------------------------
    # * Name Input Processing
    #
    #   MInterpreter.name_input_proc(actor_id, max_chrs = 8)
    #--------------------------------------------------------------------------
    def self.name_input_proc(actor_id, max_chrs = 8)
      # If not invalid actors
      if $data_actors[actor_id] != nil
        # Set battle abort flag
        $game_temp.battle_abort = true
        # Set name input calling flag
        $game_temp.name_calling = true
        $game_temp.name_actor_id = actor_id
        $game_temp.name_max_char = max_chrs
      end
    end
    #--------------------------------------------------------------------------
    # * Change Actor Stat
    #
    #   MInterpreter.change_actor_stat(actor_id, stat_name, value)
    #
    #   stat_name : 'hp', 'sp', 'level', 'exp', 'str', 'dex', 'agi', 'int',
    #               'class_id' (May use anything that is has a writable method)
    #--------------------------------------------------------------------------
    def self.change_actor_stat(actor_id, stat_name, value)
      # Get Actor
      actor = $game_actors[actor_id]
      # Return if nil actor
      return if actor.nil?
      # Alter Stat
      eval "actor.#{stat_name} += value"
    end
    #--------------------------------------------------------------------------
    # * Gain Actor Skills
    #
    #   MInterpreter.gain_actor_skills(actor_id, *skill_ids)
    #--------------------------------------------------------------------------
    def self.gain_actor_skills(actor_id, *skill_ids)
      # Get Actor
      actor = $game_actors[actor_id]
      # Return if nil actor
      return if actor.nil?
      # Gain All Skills
      skill_ids.each {|s| actor.learn_skill(s)}
    end
    #--------------------------------------------------------------------------
    # * Lose Actor Skills
    #
    #   MInterpreter.lose_actor_skills(actor_id, *skill_ids)
    #--------------------------------------------------------------------------
    def self.lose_actor_skills(actor_id, *skill_ids)
      # Get Actor
      actor = $game_actors[actor_id]
      # Return if nil actor
      return if actor.nil?
      # Lose All Skills
      skill_ids.each {|s| actor.forget_skill(s)}
    end
    #--------------------------------------------------------------------------
    # * Gain Actor States
    #
    #   MInterpreter.gain_actor_states(actor_id, *skill_ids)
    #--------------------------------------------------------------------------
    def self.gain_actor_states(actor_id, *state_ids)
      # Get Actor
      actor = $game_actors[actor_id]
      # Return if nil actor
      return if actor.nil?
      # Gain All States
      state_ids.each {|s| actor.add_state(s)}
    end
    #--------------------------------------------------------------------------
    # * Lose Actor States
    #
    #   MInterpreter.lose_actor_states(actor_id, *skill_ids)
    #--------------------------------------------------------------------------
    def self.lose_actor_states(actor_id, *state_ids)
      # Get Actor
      actor = $game_actors[actor_id]
      # Return if nil actor
      return if actor.nil?
      # Remove All States
      skill_ids.each {|s| actor.remove_state(s)}
    end
    #--------------------------------------------------------------------------
    # * Change Actor Equipment
    #
    #   MInterpreter.change_actor_equip(actor_id, type, id)
    #
    #   Type : 0 - Weapon, 1 - Shield, 2 - Head, 3 - Body, 4 - Accessory
    #--------------------------------------------------------------------------
    def self.change_actor_equip(actor_id, type, id)
      # Get actor
      actor = $game_actors[actor_id]
      # Return if nil actor
      return if actor.nil?
      # Change Equipment
      actor.equip(type, id)
    end
    #--------------------------------------------------------------------------
    # * Change Event Graphic
    #
    #   MInterpreter.change_event_graphic(target_id, character_name, hue = 0)
    #
    #   Replace character_name with n to set tile id
    #--------------------------------------------------------------------------
    def self.change_event_graphic(target_id, character_name, hue = 0)
      # Get Character
      character = $game_map.events[target_id]
      # Return if Nil Character
      return if character.nil?
      # If Setting Tile ID
      if character_name.is_a?(Fixnum)
        character.tile_id = character_name
        character.character_name = ''
        character.character_hue  = hue
        return
      end
      # Set Character Name & Hue
      character.character_name = character_name
      character.character_hue  = hue
    end
    #--------------------------------------------------------------------------
    # * Change Actor Character Graphic
    #
    #   MInterpreter.change_actor_cgraphic(actor_id, character_name, hue = 0)
    #--------------------------------------------------------------------------
    def self.change_actor_cgraphic(actor_id, character_name, hue = 0)
      # Get Actor
      actor = $game_actors[actor_id]
      # Return if Nil Actor
      return if actor.nil?
      # Set Character Name & Hue
      actor.character_name = character_name
      actor.character_hue  = hue
    end
    #--------------------------------------------------------------------------
    # * Change Actor Battler Graphic
    #
    #   MInterpreter.change_actor_bgraphic(actor_id, battler_name, hue = 0)
    #--------------------------------------------------------------------------
    def self.change_actor_bgraphic(actor_id, battler_name, hue = 0)
      # Get Actor
      actor = $game_actors[actor_id]
      # Return if Nil Actor
      return if actor.nil?
      # Set Character Name & Hue
      actor.battler_name = battler_name
      actor.battler_hue  = hue
    end
    #--------------------------------------------------------------------------
    # * Recover All
    #
    #   MInterpreter.recover_all(actor_id, ...) (0 for actor id for all party)
    #--------------------------------------------------------------------------
    def self.recover_all(*actor_ids)
      # Pass Through Defined Actors
      actor_ids.each do |actor_id|
        # If Actor ID is 0
        if actor_id == 0
          # Recover Party
          $game_party.actors.each {|actor| actor.recover_all}
          next
        end
        # Actor Recover All unless actor not found
        $game_actors[actor_id].recover_all unless $game_actors[actor_id].nil?
      end
    end
    #--------------------------------------------------------------------------
    # * Call Scene
    #
    #   MInterpreter.call_scene(scene_name)
    #--------------------------------------------------------------------------
    def self.call_scene(scene = Scene_Menu)
      # Change Scene
      $scene = scene.new
    end
    #--------------------------------------------------------------------------
    # * Save To Index
    #
    #   MInterpreter.save_index(index = 0)
    #--------------------------------------------------------------------------
    def self.save_index(index = 0)
      # Create Dummy Save Object
      dummy = Scene_Save.new
      # Create File
      file = File.open(dummy.make_filename(index), "wb")
      # Write File
      dummy.write_save_data(file)
      # Close File
      file.close
    end
    #--------------------------------------------------------------------------
    # * Save To Filename
    #
    #   MInterpreter.save_filename(filename = 'Save File')
    #--------------------------------------------------------------------------
    def self.save_filename(filename = 'Save File')
      # Create Dummy Save Object
      dummy = Scene_Save.new
      # Create File
      file = File.open(filename, "wb")
      # Write File
      dummy.write_save_data(file)
      # Close File
      file.close
    end
    #--------------------------------------------------------------------------
    # * Load From Index
    #
    #   MInterpreter.load_index(index = 0)
    #--------------------------------------------------------------------------
    def self.load_index(index = 0)
      # Create Dummy Load Object
      dummy = Scene_Load.new
      # Create File   
      file = File.open(dummy.make_filename(index), "rb")
      # Read Data
      dummy.read_save_data(file)
      # Close File
      file.close
    end
    #--------------------------------------------------------------------------
    # * Load From Filename
    #
    #   MInterpreter.load_filename(filename = 'Save File')
    #--------------------------------------------------------------------------
    def self.load_filename(filename = 'Save File')
      # Create Dummy Load Object
      dummy = Scene_Load.new
      # Create File   
      file = File.open(filename, "rb")
      # Read Data
      dummy.read_save_data(file)
      # Close File
      file.close
    end
  end
  
  #==============================================================================
  # ** Game_Character
  #==============================================================================
  
  class Game_Character
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :tile_id                  # tile ID (invalid if 0)
    attr_accessor :character_name           # character file name
    attr_accessor :character_hue            # character hue
  end
  
  #==============================================================================
  # ** Game_Actor
  #==============================================================================
  
  class Game_Actor < Game_Battler
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :character_name           # character file name
    attr_accessor :character_hue            # character hue
    attr_accessor :battler_name             # battler file name
    attr_accessor :battler_hue              # battler hue
  end
  
  
  #============================================================================== 
  # ** Modules.Moveable V1.0                                         By Trickster
  #------------------------------------------------------------------------------
  # Objects mixing in this module will have the ability to move. Includes methods
  # for checking if the object is moving, and to move relative to its current 
  # position and to stop movement. Classes mixing in this module must call the 
  # update_move method within the update method for this module to be sucessfully 
  # implemented. Also contains and keeps track of useful information such as the 
  # angle of movement (in degrees) The only methods that need to be implemented 
  # when using this as a mixin are the x and y methods.
  #  
  #  move_x    move_y    move    relative_move   
  #  relative_move_x   relative_move_y   stop_x
  #  stop_y    stop    moving?   update_move
  #==============================================================================
  
  MACL::Loaded << 'Modules.Moveable'
  
  module Moveable
    #-------------------------------------------------------------------------
    # * Name      : Move X
    #   Info      : Starts Moving On X Axis
    #   Author    : Trickster
    #   Call Info : One-Two Arguments
    #               Integer X - Destination X
    #               Integer Speed - Movement X Speed (Default 1)
    #-------------------------------------------------------------------------
    def move_x(x, x_speed = 1)
      # Not Moving if no speed or negative speed
      return if x_speed <= 0 or @moving_x
      # Set Destination Points speed and move count set moving flag
      @destination_x = x
      # Set Move Speed X
      @move_speed_x = x_speed
      # Set Moving Flag
      @moving_x = true
      # Get the distance + (negative if to left or up positive if down or right)
      @distance_x = (@destination_x - self.x).to_f
      # Setup Move Save X variable (For low speeds)
      @move_save_x = 0
      # Setup Old X (For Stopping)
      @old_x = self.x
      # If No Distance Y
      if @distance_y.nil?
        # Set Distance to Distance X
        @distance = @distance_x
      else
        # Get slant distance (hypotenuse of the triangle ((xf,yi) (xi,yf) (xf,yf))
        @distance = Math.sqrt(@distance_x ** 2 + @distance_y ** 2)
      end
      # Update Move Angle
      update_move_angle
    end
    #-------------------------------------------------------------------------
    # * Name      : Move Y
    #   Info      : Starts Moving On Y Axis
    #   Author    : Trickster
    #   Call Info : One-Two Arguments
    #               Integer Y - Destination Y
    #               Integer Speed - Movement Y Speed (Default 1)
    #-------------------------------------------------------------------------
    def move_y(y, y_speed = 1)
      # Not Moving if no speed or negative speed
      return if y_speed <= 0 or @moving_y
      # Set Destination Points speed and move count set moving flag
      @destination_y = y
      # Set Move Speed Y
      @move_speed_y = y_speed
      # Set Moving Flag
      @moving_y = true
      # Get the distance + (negative if to left or up positive if down or right)
      @distance_y = (@destination_y - self.y).to_f
      # Setup Move Save Y variable (For low speeds)
      @move_save_y = 0
      # Setup Old X (For Stopping)
      @old_y = self.y
      # If No Distance X
      if @distance_x.nil?
        # Set Distance to Distance Y
        @distance = @distance_y
      else
        # Get slant distance (hypotenuse of the triangle ((xf,yi) (xi,yf) (xf,yf))
        @distance = Math.sqrt(@distance_x ** 2 + @distance_y ** 2)
      end
      # Update Move Angle
      update_move_angle
    end
    #-------------------------------------------------------------------------
    # * Name      : Move
    #   Info      : Starts Moving
    #   Author    : Trickster
    #   Call Info : Two-Three Arguments
    #               Integer X and Y - Destination Position
    #               Integer XSpeed and YSpeed - Movement Speed (Default 1)
    #-------------------------------------------------------------------------
    def move(x, y, x_speed = 1, y_speed = x_speed)
      move_x(x, x_speed)
      move_y(y, y_speed)
    end
    #-------------------------------------------------------------------------
    # * Name      : Relative Move
    #   Info      : Starts Moving Relative to Current Position
    #   Author    : Trickster
    #   Call Info : Two-Three Arguments
    #               Integer CX and CY - How far to move from current positon
    #               Integer Speed - Movement Speed (Default 1)
    #-------------------------------------------------------------------------
    def relative_move(cx, cy, x_speed = 1, y_speed = x_speed)
      # Add To X and Y (Relative Move)
      move(self.x + cx, self.y + cy, x_speed, y_speed)
    end
    #-------------------------------------------------------------------------
    # * Name      : Relative Move X
    #   Info      : Starts Moving on X Axis Relative to Current Position
    #   Author    : Trickster
    #   Call Info : One-Two Arguments
    #               Integer CX - How far to move on x axis
    #               Integer Speed - Movement Speed (Default 1)
    #-------------------------------------------------------------------------
    def relative_move_x(cx, speed = 1)
      # Move to Current Position + X (Relative Move)
      move_x(self.x + cx, speed)
    end
    #-------------------------------------------------------------------------
    # * Name      : Relative Move Y
    #   Info      : Starts Moving on Y Axis Relative to Current Position
    #   Author    : Trickster
    #   Call Info : One-Two Arguments
    #               Integer CY - How far to move on y axis
    #               Integer Speed - Movement Speed (Default 1)
    #-------------------------------------------------------------------------
    def relative_move_y(cy, speed = 1)
      # Move to Current Position + Y (Relative Move)
      move_y(self.y + cy, speed)
    end
    #-------------------------------------------------------------------------
    # * Name      : Stop
    #   Info      : Stops Movement
    #   Author    : Trickster
    #   Call Info : Zero to Two Arguments Boolean ReturnX, ReturnY
    #               If True returns to starting position (def false)
    #-------------------------------------------------------------------------
    def stop(returnx = false, returny = false)
      stop_x(returnx)
      stop_y(returny)
    end
    #-------------------------------------------------------------------------
    # * Name      : Stop X
    #   Info      : Stops Movement on X Axis
    #   Author    : Trickster
    #   Call Info : Zero to One Arguments Boolean ReturnX
    #               If True returns to starting X (def false)
    #-------------------------------------------------------------------------
    def stop_x(returnx = false)
      # Set Moving X to false
      @moving_x = false
      # Set Destination X
      @destination_x = nil
      # Set X to Old X if return to start
      self.x = @old_x if returnx
      # Update Move Angle
      update_move_angle
    end
    #-------------------------------------------------------------------------
    # * Name      : Stop Y
    #   Info      : Stops Movement on Y Axis
    #   Author    : Trickster
    #   Call Info : Zero to One Arguments Boolean ReturnY
    #               If True returns to starting Y (def false)
    #-------------------------------------------------------------------------
    def stop_y(returny = false)
      # Set Moving Y to false
      @moving_y = false
      # Set Destination Y
      @destination_y = nil
      # Set Y to Old Y if return to start
      self.y = @old_y if returny
      # Update Move Angle
      update_move_angle
    end
    #-------------------------------------------------------------------------
    # * Name      : Update Move Angle
    #   Info      : Updates Angle of Movement
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def update_move_angle
      # Calculate angle of movement which is later used to determine direction
      # If X distance is 0 (Prevent Infinity Error)
      if @distance_x.to_i == 0
        # The Angle is sign(distance_y) * - p / 2 (90° or 270°)
        @move_angle = @distance_y.sign * Math::PI / 2
      # If Y distance is 0 (Prevent Incorrect Direction for later)
      elsif @distance_y.to_i == 0
        # The Angle is sign(distance_x) - 1 * p / 2 (0° or 180°)
        @move_angle = (@distance_x.sign - 1) * Math::PI / 2
      else
        # The Angle is the Arctangent of @distance_y / @distance_x (slope)
        # Returns [-p,p]
        @move_angle = Math.atan2(@distance_y, @distance_x.to_f)
      end
      # Convert the angle to degrees
      @move_angle *= 180 / Math::PI
    end
    #-------------------------------------------------------------------------
    # * Name      : Move Angle
    #   Info      : Returns Angle of Movement
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def move_angle
      return moving? ? move_angle : nil
    end
    #-------------------------------------------------------------------------
    # * Name      : Moving?
    #   Info      : Is Object Moving
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def moving?
      return @moving_x || @moving_y
    end
    #-------------------------------------------------------------------------
    # * Name      : Update Move
    #   Info      : Updates Movement
    #   Author    : Trickster
    #   Call Info : No Arguments
    #   Comment   : Must be called every frame in the object using this module
    #               as a mixin
    #-------------------------------------------------------------------------
    def update_move
      # If not moving
      return if not moving?
      # If Moving in X Axis
      if @moving_x
        # move increase x = the cosine of the arctangent of the dist x over dist y
        # move increase x = cos(arctan(disty/distx)) simplified by trigonometry
        # to distance_x / slant_distance, the sprite moves (move speed) 
        # along the slanted line (if it is slanted)
        movinc_x = @move_speed_x * @distance_x.abs / @distance
        # Get Distance Remaining
        remain_x = @destination_x - self.x
        # Get Move X - the sign of the distance left + move increase or the 
        # remaining distance left if it will go past that point
        move_x = remain_x.sign * [movinc_x, remain_x.abs].min
        # Save Remainder in Move Save X
        @move_save_x += move_x.abs % 1 * move_x.sign
        # Increase X By Move X and Remainder
        self.x += move_x.to_i + @move_save_x.to_i
        # Set to Floating Portion
        @move_save_x -= @move_save_x.to_i
        # If At Destination X
        if self.x == @destination_x
          # Set Moving X to false
          @moving_x = false
          # Set Destination X
          @destination_x = nil
        end
      end
      # If Moving in Y Axis
      if @moving_y
        # same reasoning with y increase except it is the sine of the arctangent
        # move increase y = sin(arctan(disty/distx)) simplified by trigonometry
        # to distance_y / slant_distance
        movinc_y = @move_speed_y * @distance_y.abs / @distance
        # Get distance remaining
        remain_y = @destination_y - self.y
        # Get Move Y - the sign of the distance left + move increase or the 
        # remaining distance left if it will go past that point
        move_y = remain_y.sign * [movinc_y, remain_y.abs].min
        # Save Remainder in Move Save Y
        @move_save_y += move_y.abs % 1 * move_y.sign
        # Increase Y By Move Y and Remainder
        self.y += move_y.to_i + @move_save_y.to_i
        # Set to Floating Portion
        @move_save_y -= @move_save_y.to_i
        # If At Destination Y
        if self.y == @destination_y
          # Set Moving Y to false
          @moving_y = false
          # Set Destination Y
          @destination_y = nil
        end
      end
    end
  end
  
  class Sprite
    #--------------------------------------------------------------------------
    # * Mixin Module Moveable
    #--------------------------------------------------------------------------
    include Moveable
    #--------------------------------------------------------------------------
    # * Update Alias
    #--------------------------------------------------------------------------
    if @trick_movingsprite_update.nil?
      alias_method :trick_movingsprite_update, :update
      @trick_movingsprite_update = true
    end
    def update
      trick_movingsprite_update
      update_move if moving_implemented?
    end
    #-------------------------------------------------------------------------
    # * Name      : Moving Implemented?
    #   Info      : Implements Moving if it returns true false otherwise
    #   Author    : Trickster
    #   Call Info : No Arguments
    #   Comments  : In Custom Sprite Classes make this method return false
    #               To Implement your own movement functions or just to disable
    #-------------------------------------------------------------------------
    def moving_implemented?
      return true
    end
  end
  
  class Window
    #--------------------------------------------------------------------------
    # * Mixin Module Moveable
    #--------------------------------------------------------------------------
    include Moveable
    #--------------------------------------------------------------------------
    # * Update Alias
    #--------------------------------------------------------------------------
    if @trick_movingwindow_update.nil?
      alias_method :trick_movingwindow_update, :update
      @trick_movingwindow_update = true
    end
    def update
      trick_movingwindow_update
      update_move if moving_implemented?
    end
    #-------------------------------------------------------------------------
    # * Name      : Moving Implemented?
    #   Info      : Implements Moving if it returns true false otherwise
    #   Author    : Trickster
    #   Call Info : No Arguments
    #   Comments  : In Custom Window Classes make this method return false
    #               To Implement your own movement functions or just to disable
    #-------------------------------------------------------------------------
    def moving_implemented?
      return true
    end
  end
  
  #==============================================================================
  # ** Modules.Screenshot Module (2.0)                    By Andreas21 & Cybersam
  #------------------------------------------------------------------------------
  # * Requirements :
  #
  #   Screenshot.dll (Located in Game Directory)
  #------------------------------------------------------------------------------
  # * Description :
  #
  #   This script was designed to automatically take a screenshot of your game
  #   and save the file in the pictures folder.
  #------------------------------------------------------------------------------
  # * Syntax :
  #
  #   Taking a Screenshot
  #    - Screenshot.shot('filename', image_type)
  #
  #    image_type : 0 - bmp, 1 - jpg, 2 - png
  #==============================================================================
  
  # Test if Screenshot Dll Found
  begin
    test = Win32API.new('screenshot', 'Screenshot', %w(l l l l p l l), '')
    include_screenshot_module = true
  rescue
    include_screenshot_module = false
  end
  
  # If Screenshot DLL Found
  if include_screenshot_module
  
  MACL::Loaded << 'Modules.Screenshot Module'
  
  #==============================================================================
  # ** Screenshot
  #==============================================================================
  
  module Screenshot
    #--------------------------------------------------------------------------
    # * File Directory
    #--------------------------------------------------------------------------
    Dir = 'Graphics/Pictures/'
    #--------------------------------------------------------------------------
    # * API Refrence
    #--------------------------------------------------------------------------
    Screen     = Win32API.new('screenshot', 'Screenshot', 
      %w(l l l l p l l), '')
    Readini    = Win32API.new('kernel32',   'GetPrivateProfileStringA', 
      %w(p p p p l p), 'l')
    Findwindow = Win32API.new('user32',     'FindWindowA', 
      %w(p p), 'l')
    #--------------------------------------------------------------------------
    # * Shot
    #
    #   image_type : 0 - bmp, 1 - jpg, 2 - png
    #--------------------------------------------------------------------------
    def shot(filename = 'screenshot', image_type = 2)
      # Adds File Extension
      filename += image_type == 0 ? '.bmp' : image_type == 1 ? '.jpg' : '.png'
      # Create True Filename
      file_name = Dir + filename
      # Make Screenshot
      Screen.call(0, 0, 640, 480, file_name, handel, image_type)
    end
    #--------------------------------------------------------------------------
    # * Handel (Finds Game Window)
    #--------------------------------------------------------------------------
    def handel
      game_name = "\0" * 256
      Readini.call('Game', 'Title', '', game_name, 255, ".\\Game.ini")
      game_name.delete!("\0")
      return Findwindow.call('RGSS Player', game_name)
    end
  end
  
  end
  
  #============================================================================== 
  # ** Modules.View Range (5.0)               By Near Fantastica & SephirothSpawn
  #------------------------------------------------------------------------------
  # * Description :
  #
  #   The View Range Module is used to test objects position in comparision with
  #   another object. It can test if an object is within a defined circular
  #   range of another object or a rectangular defined region. It can also tell
  #   you this distances between objects.
  #------------------------------------------------------------------------------
  # * Syntax :
  #
  #   Test if object is within defined range from another object :
  #    - VR.in_range?(object1, object2, range)
  #    - VR.in_range?(object1x, object1y, object2x, object2y, range)
  #
  #   Test if object is within defined rectanlge :
  #    - VR.in_rect_range?(object, <args>)
  #    - VR.in_rect_range?(x, y, <args>)
  #
  #    args can either be : x, y, width, height or Rect.new(x, y, width, height)
  #
  #   Test range between objects :
  #    - range = VR.range(object1, object2, <integer>)
  #    - range = VR.range(object1x, object1y, object2x, object2y, <integer>)
  #
  #    integer : if true, returns integer ; if false, returns float
  #==============================================================================
  
  MACL::Loaded << 'Modules.View Range'
  
  #==============================================================================
  # ** View Range
  #==============================================================================
  
  module VR
    #----------------------------------------------------------------------------
    # * Within Range Test
    #----------------------------------------------------------------------------
    def VR.in_range?(*args)
      # If 3 Arguments (Element, Object, Range)
      if args.size == 3
        x = (args[0].x - args[1].x) ** 2
        y = (args[0].y - args[1].y) ** 2
        r = args[2]
      # If 5 Arguments (Elementx, Elementy, Objectx, Objecty, Range)
      elsif args.size == 5
        x = (args[0] - args[2]) ** 2
        y = (args[1] - args[3]) ** 2
        r = args[4]
      else
        p 'Wrong Defined Number of Arguments'
        return 
      end
      return (x + y) <= (r * r)
    end
    #----------------------------------------------------------------------------
    # * Within Rect Range Test
    #----------------------------------------------------------------------------
    def VR.in_rect_range?(*args)
      # If 2 Arguments (Object, Rect)
      if args.size == 2
        x_, y_ = args[0].x, args[0].y
        x, y, w, h = args[1].x, args[1].y, args[1].width, args[1].height
      # If 3 Arguments (Objectx, Objecty, Rect)
      elsif args.size == 3
        x_, y_ = args[0], args[1]
        x, y, w, h = args[2].x, args[2].y, args[2].width, args[2].height
      # If 5 Arguments (Object, Rectx, Recty, Rectwidth, Rectheight)
      elsif args.size == 5
        x_, y_ = args[0].x, args[0].y
        x, y, w, h = args[1], args[2], args[3], args[4]
      # If 6 Arguments (Objectx, Objecty, Rectx, Recty, Rectwidth, Rectheight)
      elsif args.size == 6
        x_, y_, x, y, w, h = *args
      else
        p 'Wrong Defined Number of Arguments'
        return
      end
      # Return Object Within Rect
      return x_.between?(x, x + w) && y_.between?(y, y + h)
    end
    #----------------------------------------------------------------------------
    # * Range
    #----------------------------------------------------------------------------
    def VR.range(*args)
      # If 2 Arguments (Element, Object)
      if args.size == 2
        x = (args[0].x - args[1].x) * (args[0].x - args[1].x)
        y = (args[0].y - args[1].y) * (args[0].y - args[1].y)
        integer = true
      # If 3 Arguments (Element, Object, Integer
      elsif args.size == 3
        x = (args[0].x - args[1].x) * (args[0].x - args[1].x)
        y = (args[0].y - args[1].y) * (args[0].y - args[1].y)
        integer = args[2]
      # If 4 Arguments (Elementx, Elementy, Objectx, Objecty)
      elsif args.size == 4
        x = (args[0] - args[2]) * (args[0] - args[2])
        y = (args[1] - args[3]) * (args[1] - args[3])
        integer = true
      # If 5 Arguments (Elementx, Elementy, Objectx, Objecty, integer)
      elsif args.size == 5
        x = (args[0] - args[2]) * (args[0] - args[2])
        y = (args[1] - args[3]) * (args[1] - args[3])
        integer = args[4]
      else
        p 'Wrong Defined Number of Arguments'
        return
      end
      r = Math.sqrt(x + y)
      return integer ? r.to_i : r
    end
  end
  
  #============================================================================== 
  # ** Modules.Zlib
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Adds PNG_File class to save Bitmap's to PNG Files
  #  
  # Class List:
  # -----------
  # Png_File
  #==============================================================================
  
  MACL::Loaded << 'Modules.Zlib'
  
  #============================================================================== 
  # ** Zlib     
  #==============================================================================
  
  module Zlib
    #============================================================================ 
    # ** Png_File     
    #============================================================================
  
    class Png_File < GzipWriter
      #--------------------------------------------------------------------------
      # * Make PNG
      #--------------------------------------------------------------------------
      def make_png(bitmap, mode = 0)
        # Save Bitmap & Mode
        @bitmap, @mode = bitmap, mode
        # Create & Save PNG
        self.write(make_header)
        self.write(make_ihdr)
        self.write(make_idat)
        self.write(make_iend)
      end
      #--------------------------------------------------------------------------
      # * Make Header
      #--------------------------------------------------------------------------
      def make_header
        return [0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a].pack('C*')
      end
      #--------------------------------------------------------------------------
      # * Make IHDR
      #--------------------------------------------------------------------------
      def make_ihdr
        ih_size               = [13].pack("N")
        ih_sign               = 'IHDR'
        ih_width              = [@bitmap.width].pack('N')
        ih_height             = [@bitmap.height].pack('N')
        ih_bit_depth          = [8].pack('C')
        ih_color_type         = [6].pack('C')
        ih_compression_method = [0].pack('C')
        ih_filter_method      = [0].pack('C')
        ih_interlace_method   = [0].pack('C')
        string = ih_sign + ih_width + ih_height + ih_bit_depth + ih_color_type +
                 ih_compression_method + ih_filter_method + ih_interlace_method
        ih_crc = [Zlib.crc32(string)].pack('N')
        return ih_size + string + ih_crc
      end
      #--------------------------------------------------------------------------
      # * Make IDAT
      #--------------------------------------------------------------------------
      def make_idat
        header  = "\x49\x44\x41\x54"
        data    = @mode == 0 ? make_bitmap_data0 : make_bitmap_data1
        data    = Zlib::Deflate.deflate(data, 8)
        crc     = [Zlib.crc32(header + data)].pack('N')
        size    = [data.length].pack('N')
        return size + header + data + crc
      end
      #--------------------------------------------------------------------------
      # * Make Bitmap Data 0
      #--------------------------------------------------------------------------
      def make_bitmap_data0
        gz = Zlib::GzipWriter.open('hoge.gz')
        t_Fx = 0
        w = @bitmap.width
        h = @bitmap.height
        data = []
        for y in 0...h
          data.push(0)
          for x in 0...w
            t_Fx += 1
            if t_Fx % 10000 == 0
              Graphics.update
            end
            if t_Fx % 100000 == 0
              s = data.pack("C*")
              gz.write(s)
              data.clear
            end
            color = @bitmap.get_pixel(x, y)
            red = color.red
            green = color.green
            blue = color.blue
            alpha = color.alpha
            data.push(red)
            data.push(green)
            data.push(blue)
            data.push(alpha)
          end
        end
        s = data.pack("C*")
        gz.write(s)
        gz.close   
        data.clear
        gz = Zlib::GzipReader.open('hoge.gz')
        data = gz.read
        gz.close
        File.delete('hoge.gz')
        return data
      end
      #--------------------------------------------------------------------------
      # * Make Bitmap Data Mode 1
      #--------------------------------------------------------------------------
      def make_bitmap_data1
        w = @bitmap.width
        h = @bitmap.height
        data = []
        for y in 0...h
          data.push(0)
          for x in 0...w
            color = @bitmap.get_pixel(x, y)
            red = color.red
            green = color.green
            blue = color.blue
            alpha = color.alpha
            data.push(red)
            data.push(green)
            data.push(blue)
            data.push(alpha)
          end
        end
        return data.pack("C*")
      end
      #--------------------------------------------------------------------------
      # * Make IEND
      #--------------------------------------------------------------------------
      def make_iend
        ie_size = [0].pack('N')
        ie_sign = 'IEND'
        ie_crc  = [Zlib.crc32(ie_sign)].pack('N')
        return ie_size + ie_sign + ie_crc
      end
    end
  end
  
  #============================================================================== 
  # ** Systems.Animated Gradient Bars Base                           By Trickster
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # This Set of Classes, is the base for drawing animated gradient bars, in which
  # the bars smoothly scroll to a value. See the individual classes for more info.
  # Bar Images are to be located in Graphics/Gradients
  #  
  # Class List:
  # ------------
  # Sprite_GradientBack
  # Sprite_GradientBar
  #==============================================================================
  
  MACL::Loaded << 'Systems.Animated Gradient Bars Base'
  
  #============================================================================== 
  # ** Sprite_GradientBack                                           By Trickster
  #------------------------------------------------------------------------------
  #  This class just draws the background of the Gradient Bar. It is used within
  #  Sprite_GradientBar and can be refered to by <Sprite_GradientBar>.background.
  #  This Sprite Consists of a Border and a Background.
  #============================================================================== 
  
  class Sprite_GradientBack < Sprite
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :width
    attr_reader   :height
    attr_reader   :max_width
    attr_reader   :max_height 
    attr_reader   :border
    attr_reader   :background
    attr_accessor :bx
    attr_accessor :by 
    #-------------------------------------------------------------------------
    # * Name      : Initialize
    #   Info      : Object Initialization
    #   Author    : Trickster
    #   Call Info : Two to Seven Arguments
    #               Integer X, Y - Defines the Position
    #               Integer Max_Width, Max_Height - Defines Max Dimensions (def none)
    #               String border, background - Border and Background files
    #               Viewport viewport - The Viewport defaults to nil
    #-------------------------------------------------------------------------
    def initialize(x, y, max_width = nil, max_height = nil, border = 'Back',
      background = 'Back2', viewport = nil)
      # Call Sprite and Send Viewport
      super(viewport)
      # Set Position
      self.x, self.y = x, y
      # Setup Border
      self.bx, self.by = 1, 1
      # Setup Maximum Dimensions
      @max_width, @max_height = max_width, max_height
      # Setup Files
      @border, @background = border, background
      # Setup Dimensions
      setup_dimensions
      # Setup Bitmap
      self.bitmap = Bitmap.new(@width, @height)
      # Refresh
      refresh
    end
    #-------------------------------------------------------------------------
    # * Name      : Setup Dimensions
    #   Info      : Sets up Dimensions for the Bar
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def setup_dimensions
      # Gets Back Bitmap
      bitmap = RPG::Cache.gradient(@border)
      # Get Width
      @width = max_width.nil? ? bitmap.width : [bitmap.width, max_width].min
      # Get Height
      @height = max_height.nil? ? bitmap.height : [bitmap.height, max_height].min
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Width
    #   Info      : Sets the Bitmap's Width, Refreshes the sprite
    #   Author    : Trickster
    #   Call Info : One Argument, Integer Width - New Width
    #-------------------------------------------------------------------------
    def width=(width)
      # Restrict to (0, max_width]
      width = [width, max_width].min
      # Return if same
      return if @width == width
      # Dispose Old Bitmap
      bitmap.dispose
      # Set Width
      @width = width
      # Set New Bitmap
      self.bitmap = Bitmap.new(@width, @height)
      # Refresh
      refresh
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Height
    #   Info      : Sets the Bitmap's Height, Refreshes the sprite
    #   Author    : Trickster
    #   Call Info : One Argument, Integer Height - New Height
    #-------------------------------------------------------------------------
    def height=(height)
      # Restrict to (0, max_height]
      height = [height, max_height].min
      # Return if same
      return if @height == height
      # Dispose Old Bitmap
      bitmap.dispose
      # Set Height
      @height = height
      # Set New Bitmap
      self.bitmap = Bitmap.new(@width, @height)
      # Refresh
      refresh
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Gradient File
    #   Info      : Sets New Gradient Type, Refreshes the sprite
    #   Author    : Trickster
    #   Call Info : One Argument, String File - File to load
    #-------------------------------------------------------------------------
    def border=(border)
      @border = border
      refresh
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Gradient File
    #   Info      : Sets New Gradient Type, Refreshes the sprite
    #   Author    : Trickster
    #   Call Info : One Argument, String File - File to load
    #-------------------------------------------------------------------------
    def background=(background)
      @background = background
      refresh
    end
    #-------------------------------------------------------------------------
    # * Name      : Refresh
    #   Info      : Refreshes the sprite
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def refresh
      # Clear Bitmap
      bitmap.clear
      # Draw Gradient Bar Back
      bitmap.draw_trick_gradient_bar_back(0, 0, width, height, @border, 
        @background, bx, by)
    end
  end
  
  #============================================================================== 
  # ** Sprite_GradientBar                                            By Trickster
  #-----------------------------------------------------------------------------
  #  This class draws a sprite whose bitmap is a gradient bar, it uses my gradient
  #  bar sytle (by use of outside pictures). The Pictures can be found in the folder
  #  Graphics/Gradients.  When the value pointed to by the gradient bar changes the
  #  The Bar will smoothly decrease or increase to match the value.  Classes that
  #  inherit from this class must redefine the method update calling super if needed
  #  (for flash effects), or you may use this as a base for other gradient bar 
  #  sprites. See also classes Sprite_ActorHpBar and Sprite_ActorSpBar for examples.
  #  Best used if you create a separate class that inherits from this one.
  #============================================================================== 
  
  class Sprite_GradientBar < Sprite
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #-------------------------------------------------------------------------- 
    attr_reader   :file
    attr_reader   :width
    attr_reader   :height
    attr_reader   :max_width
    attr_reader   :max_height
    attr_accessor :background
    attr_accessor :speed
    attr_accessor :bx
    attr_accessor :by
    #-------------------------------------------------------------------------
    # * Name      : Initialize
    #   Info      : Object Initialization
    #   Author    : Trickster
    #   Call Info : Six to Eight Arguments
    #               Integer X, Y - Defines the Position
    #               Integer Width, Height - Defines Dimensions (or nil for default)
    #               Integer/Proc Min, Max - Defines Current and Maximum values for 
    #               drawing
    #               Integer Speed - Update Rate, Every (speed) frames defaults to 1
    #               String border, background - Border and Background Files
    #               Viewport viewport - The Viewport defaults to nil
    #-------------------------------------------------------------------------
    def initialize(x, y, max_width, max_height, min = 1, max = 1, speed = 1,
      border = 'Back', background = 'Back2', viewport = nil)
      # Call Sprite and sent viewport
      super(viewport)
      # Setup Background
      self.background = Sprite_GradientBack.new(x, y, max_width, max_height, border, 
        background, viewport)
      # Setup Instance Variables
      @max_width, @max_height = max_width, max_height
      # Setup Dimensions
      setup_dimensions
      # Setup Bitmap
      self.bitmap = Bitmap.new(@width, @height)
      # Setup Position
      self.x, self.y, self.z = x, y, 101
      # Setup Border Dimensions
      self.bx, self.by = 1, 1
      # Setup Instance Variables
      @min = min.is_a?(Proc) ? min : proc {min}
      # Get Last
      @last = @min.call
      # Get Maximum
      @max = max.is_a?(Proc) ? max : proc {max}
      # Get Speed
      @speed = speed
      # Get File
      @file = '001-Primary01'
      # Setup Counter
      @count = 0
    end
    #-------------------------------------------------------------------------
    # * Name      : Setup Dimensions
    #   Info      : Sets up Dimensions for the Bar
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def setup_dimensions
      # Gets Back Bitmap
      bitmap = background.bitmap
      # Get Width
      @width = max_width.nil? ? bitmap.width : [bitmap.width, max_width].min
      # Get Height
      @height = max_height.nil? ? bitmap.height : [bitmap.height, max_height].min
    end
    #-------------------------------------------------------------------------
    # * Name      : Dispose
    #   Info      : Disposes the sprite and the background
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def dispose
      # Dispose Sprite
      super
      # Dispose Background
      background.dispose
    end
    #-------------------------------------------------------------------------
    # * Name      : Update
    #   Info      : Frane Update, Updates Bar Animation (changes in value)
    #   Author    : Trickster
    #   Call Info : No Arguments
    #   Comment:   Classes inheriting from this class must redefine this method
    #              and call super if needed (for flash effects)
    #-------------------------------------------------------------------------
    def update
      # Call Update
      super
      # Return if this class isn't Sprite_GradientBar
      return if self.class != Sprite_GradientBar
      # Increase Counter
      @count += 1
      # Return if no speed or not speed frames has passed
      return if @speed == 0 or @count % @speed != 0
      # Get Value
      val = @min.call
      # Return if same
      return if @last == value
      # Add + - 1 to Last
      @last += (val - @last).sign
      # Refresh
      refresh
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Slanted Flag
    #   Info      : Sets Slanted Flag, Refreshes the sprite
    #   Author    : Trickster
    #   Call Info : One Argument, Boolean bool - true - slanted false - otherwise
    #-------------------------------------------------------------------------
    def slanted=(bool)
      # Set Slanted Flag
      @slanted = bool
      # Refresh
      refresh
    end
    #-------------------------------------------------------------------------
    # * Name      : Set X
    #   Info      : Sets the X Coordinate, updates x coordinate of the background
    #   Author    : Trickster
    #   Call Info : One Argument, Integer X - X Coordinate
    #-------------------------------------------------------------------------
    def x=(x)
      # Call Sprite X
      super(x)
      # Set X for Background
      background.x = x
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Y
    #   Info      : Sets the Y Coordinate, updates y coordinate of the background
    #   Author    : Trickster
    #   Call Info : One Argument, Integer Y - Y Coordinate
    #-------------------------------------------------------------------------
    def y=(y)
      # Call Sprite Y
      super(y)
      # Set Y For Background
      background.y = y
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Z
    #   Info      : Sets the Z Coordinate, updates z coordinate of the background
    #   Author    : Trickster
    #   Call Info : One Argument, Integer Z - Z Coordinate
    #-------------------------------------------------------------------------
    def z=(z)
      # Call Sprite Z
      super(z)
      # Set Background Z to Z - 1
      background.z = z - 1
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Width
    #   Info      : Sets the Bitmap's Width, Refreshes the sprite
    #   Author    : Trickster
    #   Call Info : One Argument, Integer Width - New Width
    #-------------------------------------------------------------------------
    def width=(width)
      # Restrict to (0, max_width]
      width = [width, max_width].min
      # Return if same
      return if @width == width
      # Set Width
      @width = width
      # Dispose Old Bitmap
      bitmap.dispose
      # Set New Bitmap
      self.bitmap = Bitmap.new(@width, @height)
      # Set Background Width
      background.width = @width
      # Refresh
      refresh
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Height
    #   Info      : Sets the Bitmap's Height, Refreshes the sprite
    #   Author    : Trickster
    #   Call Info : One Argument, Integer Height - New Height
    #-------------------------------------------------------------------------
    def height=(height)
      # Restrict to (0, max_height]
      height = [height, max_height].min
      # Return if same
      return if @height == height
      # Dispose Old Bitmap
      bitmap.dispose
      # Set Height
      @height = height
      # Set New Bitmap
      self.bitmap = Bitmap.new(@width, @height)
      # Set Background Height
      background.height = @height
      # Refresh
      refresh
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Visibility
    #   Info      : Sets the visibility, updates visibility of the background
    #   Author    : Trickster
    #   Call Info : One Argument, Boolean bool - true: visible false: invisible
    #-------------------------------------------------------------------------
    def visible=(bool)
      # Call Sprite Visible
      super(bool)
      # Set Visibility
      background.visible = bool
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Gradient File
    #   Info      : Sets New Gradient Type, Refreshes the sprite
    #   Author    : Trickster
    #   Call Info : One Argument, String File - File to load
    #-------------------------------------------------------------------------
    def file=(file)
      # Set File
      @file = file
      # Refresh
      refresh
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Border
    #   Info      : Sets Gradient Bars Border
    #   Author    : Trickster
    #   Call Info : One Argument, String File - File to load
    #-------------------------------------------------------------------------
    def set_border(file)
      # Set Border
      background.border = file
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Background
    #   Info      : Sets Gradient Bars Background
    #   Author    : Trickster
    #   Call Info : One Argument, String File - File to load
    #-------------------------------------------------------------------------
    def set_background(file)
      # Set Background's Background
      background.background = file
    end
    #-------------------------------------------------------------------------
    # * Name      : Refresh
    #   Info      : Refreshes the sprite
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def refresh
      # Clear Bitmap
      bitmap.clear
      # Get Max
      max = @max.call == 0 ? 1 : @max.call
      # Get Border
      border = background.border
      # Draw Bar Substance
      bitmap.draw_trick_gradient_bar_sub(0, 0, @last, max, file, width, height, 
        border, bx, by, @slanted)
    end
  end
  
  #============================================================================== 
  # ** Systems.Loading Data From Text Files V4.0                     By Trickster
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # This Utility module loads data from text files, the text file loaded must
  # be setup like so.
  #  
  # something     some_value
  # parameter     value
  # parameter     value
  # parameter     value
  #
  # Also has support for comments and block comments within the text file, 
  # commented data will be ignored within the file. This also parses the values
  # loaded into the data type it is supposed to be, for example if a value was
  # 50 then it will be loaded as 50 and not "50". This effect works on Strings,
  # Integers, Floats, Ranges, Arrays, Hashes, Regexp, Symbols, TrueClass, 
  # FalseClass, NilClass, and Classes (by calling the new operator example
  # Color.new(0, 0, 0) will be loaded as a color object). Also includes error
  # checking and will catch Syntax Errors, missing ] for Array, missing } for
  # Hash, Range errors, and Regexp Errors and will also point to the line and
  # the data that is on the line if an unexcepted error is found within the file.
  #  
  # Method List:
  # ------------
  # Trickster.load_data_from_txt
  #  
  # Classes:
  # --------
  # Trickster::File_LoadRxdata
  #==============================================================================
  
  MACL::Loaded << 'Systems.Loading Data From Text Files'
  
  #============================================================================== 
  # ** Trickster     
  #==============================================================================
  
  module Trickster
    
    #============================================================================ 
    # ** File_LoadRxdata     
    #============================================================================
  
    class File_LoadRxdata < File
      #-------------------------------------------------------------------------
      # * Public Instance Variables
      #-------------------------------------------------------------------------
      attr_reader :line
      #-------------------------------------------------------------------------
      # * Name      : Format Readline
      #   Info      : Gets Next Line returns An Array of information on next line
      #   Author    : Trickster
      #   Call Info : No Arguments
      #-------------------------------------------------------------------------
      def format_readline
        # Get Line
        data = self.readline
        # Make a Copy
        @line = data.dup
        # Split it
        data = data.split
        # Return Data
        return data
      end
      #-------------------------------------------------------------------------
      # * Name      : Requirements
      #   Info      : Required Data Needed to be loaded
      #   Author    : Trickster
      #   Call Info : Four Arguments
      #               Array Data, Data Loaded
      #               Array Required, Data Required to be loaded
      #               Array Properties, Names to be loaded
      #               Boolean Elements, True if Indexes False for Parameters
      #-------------------------------------------------------------------------
      def requirements(data, required, properties, elements)
        required.each do |i|
          if (i < properties.size and (data[i].nil? and elements) or
             (data.is_a?(Hash) and data[properties[i]].nil? and not elements))
            Kernel.print("Error Loading Data \n#{properties[i]} is not defined")
            exit
          end
        end
      end
      #-------------------------------------------------------------------------
      # * Name      : Incorrect Name Error
      #   Info      : Generates Incorrect Defining Name Message
      #   Author    : Trickster
      #   Call Info : No Arguments
      #-------------------------------------------------------------------------
      def error_incorrect_name
        Kernel.print("Error at Line #{lineno}\nIncorrect parameter\nLine: #{line}")
        exit
      end
      #-------------------------------------------------------------------------
      # * Name      : Array Error
      #   Info      : Generates Missing ] for Array Message
      #   Author    : Trickster
      #   Call Info : One Argument, Integer Extra, Line Number
      #-------------------------------------------------------------------------
      def error_array(extra)
        Kernel.print("Error at Line #{extra}\nMissing ']' for Array\nLine: #{line}")
        exit
      end
      #-------------------------------------------------------------------------
      # * Name      : Hash Error (Syntax Error)
      #   Info      : Generates Missing } for Hash Message
      #   Author    : Trickster
      #   Call Info : One Argument, Integer Extra, Line Number
      #-------------------------------------------------------------------------
      def error_hash(extra)
        Kernel.print("Error at Line #{extra}\nMissing '}' for Hash\nLine: #{line}")
        exit
      end
      #-------------------------------------------------------------------------
      # * Name      : Syntax Error
      #   Info      : Generates Syntax Error Message
      #   Author    : Trickster
      #   Call Info : One Argument Integer Extra, Line number
      #-------------------------------------------------------------------------
      def error_syntax(extra)
        Kernel.print("Error at Line #{extra}\nSyntax Error\nLine: #{line}")
        exit
      end
      #-------------------------------------------------------------------------
      # * Name      : Range Error 
      #   Info      : Generates Error Message
      #   Author    : Trickster
      #   Call Info : One Argument Integer Extra, Line number
      #-------------------------------------------------------------------------
      def error_range(extra)
        Kernel.print("Error at Line #{extra}\nError with Range\nLine: #{line}")
        exit
      end
      #-------------------------------------------------------------------------
      #   Name      : Regexp Fail Error 
      #   Info      : Generates Error Message
      #   Author    : Trickster
      #   Call Info : One Argument Integer Extra, Line number
      #-------------------------------------------------------------------------
      def error_regexp_fail(extra)
        Kernel.print("Error at Line #{extra}\nRegexp Failed\nLine: #{line}")
        exit
      end
      #-------------------------------------------------------------------------
      # * Name      : Load Next Line
      #   Info      : Reads Next Line of Data and returns false if End of File,
      #               true if Empty or Commented else the Data
      #   Author    : Trickster
      #   Call Info : No Arguments
      #-------------------------------------------------------------------------
      def load_next_line
        # Return False if End of File
        return false if self.eof?
        # Get Data
        data = self.format_readline
        # Set Comment Flag if text is =begin
        @comment = true if data[0] == '=begin'
        # If text is =end
        if data[0] == '=end'
          # Unset Comment Flag
          @comment = false 
          # True
          return true
        end
        # Return true if comment or nothing
        return true if data == [] or data[0].include?('#') or @comment
        # Return Data
        return data
      end
      #-------------------------------------------------------------------------
      # * Name      : Test Type
      #   Info      : Tests Data Type and returns sata in the correct format
      #   Author    : Trickster
      #   Call Info : Three to Four Arguments
      #               String data, String to be check
      #               String Line, Line where data was extracted
      #               Integer Lineno, Line number
      #               Integer Multi, Multi Lines for error checking
      #   Comment   : Checks for almost all data types
      #-------------------------------------------------------------------------
      def test_type(data, line, lineno, multi = 0)
        # Make a copy of the data
        temp = data.dup
        # Set extra text if an error is found
        extra = (multi > 0) ? "s #{lineno}-#{lineno+multi}" : " #{lineno}"
        # If a nil reference
        if test_nilclass?(temp)
          # Set Data to Nil
          data = nil
        # If True
        elsif test_trueclass?(temp)
          # Set to True
          data = true
        # If False
        elsif test_falseclass?(temp)
          # Set to false
          data = false
        # If an array
        elsif test_array?(temp)
          # Error Array if it doesn't include ]
          self.error_array(extra) unless temp.include?(']')
          # Evaluate Data
          data = eval_data(data, extra)
        # If a hash
        elsif test_hash?(temp)
          # Error Hash if it doesn't include }
          self.error_hash(extra) unless temp.include?('}')
          # Evaluate Data
          data = eval_data(data, extra)
        # If a number (Integer)
        elsif test_integer?(temp)
          # Convert to Integer
          data = data.to_i
        # If a number (Float)
        elsif test_float?(temp)
          # Convert to Float
          data = data.to_f
        # If a Range
        elsif test_range?(temp)
          begin
            # Evaluate Data
            data = eval_data(data, extra)
          rescue
            # Print Range Error
            self.error_range(extra)
          end
        # If a Regexp
        elsif test_regexp?(temp)
          begin
            # Evaluate Data
            data = eval_data(data, extra)
          rescue RegexpError
            # If Regexp Error then print Error
            self.error_regexp_fail
          end
        # If a Symbol
        elsif test_symbol?(temp)
          # Evaluate Data
          data = eval_data(data, extra)
        # If an Instance of a Class
        elsif test_class?(temp)
          # Evaluate Data
          data = eval_data(data, extra)
        # Elsif a string
        elsif test_string?(temp)
          # Just Delete First and Last Index
          data = data[1...(data.size-1)]
        end
        # Return Data
        return data
      end
      #-------------------------------------------------------------------------
      # * Name      : Test NilClass
      #   Info      : Tests if Data is nil
      #   Author    : Trickster
      #   Call Info : String data - data to check
      #-------------------------------------------------------------------------
      def test_nilclass?(data)
        return data == 'nil'
      end
      #-------------------------------------------------------------------------
      # * Name      : Test TrueClass
      #   Info      : Tests if Data is true
      #   Author    : Trickster 
      #   Call Info : String data - data to Check
      #-------------------------------------------------------------------------
      def test_trueclass?(data)
        return data == 'true'
      end
      #-------------------------------------------------------------------------
      # * Name      : Test FalseClass
      #   Info      : Tests if Data is false
      #   Author    : Trickster 
      #   Call Info : String data - data to Check
      #-------------------------------------------------------------------------
      def test_falseclass?(data)
        return data == 'false'
      end
      #-------------------------------------------------------------------------
      # * Name      : Test Array
      #   Info      : Tests if Data is an array (starts with [)
      #   Author    : Trickster 
      #   Call Info : String data - data to Check
      #-------------------------------------------------------------------------
      def test_array?(data)
        return data[0, 1] == '['
      end
      #-------------------------------------------------------------------------
      # * Name      : Test Hash
      #   Info      : Tests if Data is a hash (starts with { and has =>)
      #   Author    : Trickster 
      #   Call Info : String data - data to Check
      #-------------------------------------------------------------------------
      def test_hash?(data)
        return data[0, 1] == '{' && data.include?('=>') && data
      end
      #-------------------------------------------------------------------------
      # * Name      : Test Integer
      #   Info      : Tests if Data is an integer (if to_i.to_s == data)
      #   Author    : Trickster 
      #   Call Info : String data - data to Check
      #-------------------------------------------------------------------------
      def test_integer?(data)
        return data.to_i.to_s == data
      end
      #-------------------------------------------------------------------------
      # * Name      : Test Float
      #   Info      : Tests if Data is a float (if to_f.to_s == data)
      #   Author    : Trickster 
      #   Call Info : String data - data to Check
      #-------------------------------------------------------------------------
      def test_float?(data)
        return data.to_f.to_s == data
      end
      #-------------------------------------------------------------------------
      # * Name      : Test Range
      #   Info      : Tests if Data is a range (includes .. or ... 
      #               and first and last are integers and when .. or ... is removed
      #               is an integer)
      #   Author    : Trickster 
      #   Call Info : String data - data to Check
      #-------------------------------------------------------------------------
      def test_range?(data)
        # Create Copy
        copy = data.dup
        # Return false if no .. or ...
        return false unless copy.include?('..') or copy.include?('...')
        # Substitute .. or ... from data
        copy.sub!(/\.{2,3}/, '')
        # Return false if leftovers is not a int
        return false if not test_integer?(copy)
        # Return first and last characters are integers
        return test_integer?(data[0,1]) && test_integer?(data[-1,1])
      end
      #-------------------------------------------------------------------------
      # * Name      : Test Regexp
      #   Info      : Tests if Data is a regexp (first and last are /)
      #   Author    : Trickster 
      #   Call Info : String data - data to Check
      #-------------------------------------------------------------------------
      def test_regexp?(data)
        return data[0, 1] == '/' && data[-1, 1] == '/'
      end
      #-------------------------------------------------------------------------
      # * Name      : Test Symbol
      #   Info      : Tests if Data is a symbol (first is :)
      #   Author    : Trickster 
      #   Call Info : String data - data to Check
      #-------------------------------------------------------------------------
      def test_symbol?(data)
        return data[0, 1] == ':'
      end
      #-------------------------------------------------------------------------
      # * Name      : Test Class
      #   Info      : Tests if Data is a class (has .new)
      #   Author    : Trickster 
      #   Call Info : String data - data to Check
      #-------------------------------------------------------------------------
      def test_class?(data)
        return data.include?('.new')
      end
      #-------------------------------------------------------------------------
      # * Name      : Test String
      #   Info      : Tests if Data is a string (first and last are ")
      #   Author    : Trickster 
      #   Call Info : String data - data to Check
      #-------------------------------------------------------------------------
      def test_string?(data)
        return data[0] == 34 && data[-1] == 34
      end
      #-------------------------------------------------------------------------
      # * Name      : Eval Data
      #   Info      : calls eval on data and catches Syntax Errors
      #   Author    : Trickster 
      #   Call Info : String data, extra - data to Check, error info
      #-------------------------------------------------------------------------
      def eval_data(data, extra = '')
        begin
          # Evaluate Data
          data = eval(data)
        rescue SyntaxError
          # If Syntax Error then print Error
          self.error_syntax(extra)
        end
      end
    end
    #-------------------------------------------------------------------------
    # * Name      : Load Data From Text file
    #   Info      : Loads data from a text file
    #               returns an array/hash with the data from text file
    #   Author    : Trickster
    #   Call Info : Two to Five Arguments
    #               String File_name, file name to load from
    #               Array Properties, Defining Values
    #               Array Required, An Array of Indexes that must be loaded
    #                 defaults to index 0
    #               Array Multilined, An Array of Indexes that read from multilines
    #                 defaults to nothing, note: for strings only
    #               Integer Elements, If 0 Elements are arrays (Default)
    #                                 If 1 Elements are hashes Key = id
    #                                 Else Elements are hashes Key = parameter
    #-------------------------------------------------------------------------
    def self.load_data_from_txt(file_name, properties, required = [0],
                                multi_lined = [], elements = 0)
      # Initialize local variables
      final_data = [] 
      data_txt = elements == 0 ? [] : {}
      index = 1
      # Load File
      file = Trickster::File_LoadRxdata.open(file_name)
      # Loop until End of File (EOF)
      until file.eof?
        # Get line data
        data = file.format_readline
        # Get Line
        line = file.line
        # Set Comment Flag if text is =begin
        @comment = true if data[0] == '=begin'
        # If text is =end
        if data[0] == '=end'
          # Unset Comment Flag
          @comment = false 
          # Next
          next
        end
        # Next if no data or commented line
        next if data == [] or data[0].include?('#') or @comment
        # Get id from the properties
        id = properties.index(data[0])
        # If a new id
        if id == 0 and not data_txt.empty?
          # Check requirements and return error if not fulfilled
          file.requirements(data_txt, required, properties, [0,1].include?(elements))
          # Finished reading a piece of data
          final_data[index] = data_txt.dup
          # Increase index and reset data
          index += 1
          data_txt.clear
        elsif id == nil
          # Incorrent Defining name error message
          file.error_incorrect_name
        end
        # Remove defining name and join together
        data.delete_at(0)
        data = data.join(' ')
        # Get line number
        lineno = file.lineno
        # Start multi line information checking
        multi = 1
        if multi_lined.include?(id)
          # Load next line
          next_line = file.load_next_line
          # Get first data
          first = next_line.is_a?(Array) ? next_line[0] : ""
          # Reset flag
          flag = false
          # While an invalid property and the file is not eof? or data loaded
          while (properties.index(first) == nil and (next_line != false or next_line.is_a?(Array)))
            # While was excuted once
            flag = true
            position = file.pos
            # add to data if an array
            if next_line.is_a?(Array)
              # Get property data
              first = next_line[0]
              if properties.index(first) == nil
                data += ' ' + next_line.join(' ')
              end
            end
            # Load next line and reset first
            next_line = file.load_next_line
            first = ""
            # increase multi line count
            multi += 1
            # break if file.eof? continue if line was a comment
            break if next_line == false
            next if next_line == true
            first = next_line[0]
          end
          if flag
            file.pos = position
          end
          if next_line.is_a?(Array)
            if properties.index(first) == nil
              data += next_line.join(' ')
            end
          end
        end      
        data = file.test_type(data, line, lineno, multi)
        data_txt[id] = data if [0,1].include?(elements)
        data_txt[properties[id]] = data if not [0,1].include?(elements)
      end
      # Reached End of File Get last data if any
      if not data_txt.empty?
        # Check requirements and return error if not fulfilled
        file.requirements(data_txt, required, properties, [0,1].include?(elements))
        # Finished reading a piece of data
        final_data[index] = data_txt.dup
        # Increase index and reset data
        index += 1
        data_txt.clear
      end
      # Close File
      file.close
      # return all data compacted
      return final_data.compact
    end
  end
  
  #==============================================================================
  # ** Systems.Quick Animations (3.01)                          By SephirothSpawn
  #------------------------------------------------------------------------------
  # * Description :
  #
  #   This script was designed to act as a GIF animation player. Because GIF
  #   images aren't actually able to play in RMXP (without API), this script
  #   either uses a series of images in a directory numbered OR an animation
  #   like image with multiple frames placed side by side.
  #------------------------------------------------------------------------------
  # * Instructions :
  #
  #   * Creating Animated Sprite
  #
  #     object = Sprite_Animation.new({<parameters>})
  #
  #   * Creating Animated Plane
  #
  #     object = Plane_Animation.new({<parameters>})
  #
  #   * Parameters
  #
  #     'type'   => 'A' or 'B'
  #       - Type of Animation (A : Directory of images, B : Spriteset)
  #     'loop'   => true or false
  #       - loop (true : loops, false : plays then disposes)
  #     'fs'     => n
  #       - frameskip (number of frames to go to next frame)
  #     'vp'     => Viewport
  #       - viewport (sprite viewport)
  #
  #     Required For Type A
  #     'dir'    => 'Graphics/...'
  #       - directory of images
  #
  #     Required For Type B
  #     'frames' => n
  #       - number of frames on spriteset
  #     'bitmap' => 'filename'
  #       - filename in pictures folder
  #------------------------------------------------------------------------------
  # * Credits :
  #
  #   Thanks Trickster for Animation Type 2 Suggestion
  #==============================================================================
  
  MACL::Loaded << 'Systems.Quick Animations'
  
  #==============================================================================
  # ** Sprite_Animation
  #==============================================================================
    
  class Sprite_Animation < Sprite
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(parameters = {})
      # Assigns Defaults (If Non-Defined)
      @type = parameters.has_key?('type')     ? parameters['type']   : 'A'
      @loop = parameters.has_key?('loop')     ? parameters['loop']   : true
      @frameskip = parameters.has_key?('fs')  ? parameters['fs']     : 10
      @dir = parameters.has_key?('dir')       ? parameters['dir']    : nil
      @frames = parameters.has_key?('frames') ? parameters['frames'] : 1
      viewport = parameters.has_key?('vp')    ? parameters['vp']     : nil
      bitmap = parameters.has_key?('bitmap')  ? parameters['bitmap'] : ''
      # Creates Viewport
      super(viewport)
      # Sets Index
      @index = -1
      # Sets Specialized Parameters
      if @type.upcase == 'B'
        # Sets Frame Number & Sets Bitmap
        self.bitmap = RPG::Cache.picture(bitmap)
      end
      # Update
      update
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      # Stop Unless Proceed Frame
      return unless Graphics.frame_count % @frameskip == 0
      # Increase Index
      @index += 1
      # Branch By Type
      if @type.upcase == 'A'
        # Update Type A
        update_type_a
      elsif @type.upcase == 'B'
        # Update Type B
        update_type_b
      end
    end
    #--------------------------------------------------------------------------
    # * Frame Update : Type A
    #--------------------------------------------------------------------------
    def update_type_a
      # Begin
      begin
        # Load Bitmap
        self.bitmap = RPG::Cache.load_bitmap(@dir, @index.to_s)
      # If Bitmap Cannot Be Found
      rescue
        # If Looping
        if @loop
          # Reset Index
          @index = - 1
          update
        else
          # Dispose Image
          self.dispose
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Frame Update : Type B
    #--------------------------------------------------------------------------
    def update_type_b
      # If Passed Last Frame
      if @index == @frames
        # If Loop Image
        if @loop
          # Reset Index & Update Bitmap
          @index = -1
          update
        # If No Loop
        else
          # Delete Image
          self.dispose
          return
        end
      end
      # Updates Src Rect
      x = (w = self.bitmap.width / @frames) * @index
      self.src_rect.set(x, 0, w, self.bitmap.height)
    end
  end
  
  #==============================================================================
  # ** Plane_Animation
  #==============================================================================
    
  class Plane_Animation < Plane
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(parameters = {})
      # Assigns Defaults (If Non-Defined)
      @type = parameters.has_key?('type')     ? parameters['type']   : 'A'
      @loop = parameters.has_key?('loop')     ? parameters['loop']   : true
      @frameskip = parameters.has_key?('fs')  ? parameters['fs']     : 10
      @dir = parameters.has_key?('dir')       ? parameters['dir']    : nil
      @frames = parameters.has_key?('frames') ? parameters['frames'] : 1
      viewport = parameters.has_key?('vp')    ? parameters['vp']     : nil
      bitmap = parameters.has_key?('bitmap')  ? parameters['bitmap'] : ''
      # Creates Viewport
      super(viewport)
      # Sets Index
      @index = -1
      # Sets Specialized Parameters
      if @type.upcase == 'B'
        # Sets Frame Number & Sets Bitmap
        @_bitmap = RPG::Cache.picture(bitmap)
      end
      # Update
      update
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      # Stop Unless Proceed Frame
      return unless Graphics.frame_count % @frameskip == 0
      # Increase Index
      @index += 1
      # Branch By Type
      if @type.upcase == 'A'
        # Update Type A
        update_type_a
      elsif @type.upcase == 'B'
        # Update Type B
        update_type_b
      end
    end
    #--------------------------------------------------------------------------
    # * Frame Update : Type A
    #--------------------------------------------------------------------------
    def update_type_a
      # Begin
      begin
        # Load Bitmap
        self.bitmap = RPG::Cache.load_bitmap(@dir, @index.to_s)
      # If Bitmap Cannot Be Found
      rescue
        # If Looping
        if @loop
          # Reset Index
          @index = - 1
          update
        else
          # Dispose Image
          self.dispose
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Frame Update : Type B
    #--------------------------------------------------------------------------
    def update_type_b
      # If Passed Last Frame
      if @index == @frames
        # If Loop Image
        if @loop
          # Reset Index & Update Bitmap
          @index = -1
          update
        # If No Loop
        else
          # Delete Image
          self.dispose
          return
        end
      end
      # Updates Bitmap
      b = Bitmap.new((w = @_bitmap.width) / @frames, (h = @_bitmap.height))
      b.blt(0, 0, @_bitmap, Rect.new(w / @frames * @index, 0, b.width, h))
      self.bitmap = b
    end
  end
  
  #============================================================================== 
  # ** Systems.Scrolling Sprites                                    By: Trickster
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Classes Associated with Scrolling Sprites
  #  
  # Class List:
  # ------------
  # Scroll_Sprite
  # Sprite_Scrollable
  #==============================================================================
  
  MACL::Loaded << 'Systems.Scrolling Sprites'
  
  #============================================================================== 
  # ** Scroll_Sprite                                                By: Trickster
  #------------------------------------------------------------------------------
  #  Custom Sprite Class That Has Scroll Functions
  #==============================================================================
  
  class Scroll_Sprite < Sprite
    #-------------------------------------------------------------------------
    #   Name      : Initialize
    #   Info      : Object Initialization
    #   Author    : Trickster
    #   Call Info : Four to Five Arguments
    #               Integer X and Y, define position
    #               Integer Width and Height, define width and height of the sprite
    #               Viewport viewport viewport to be used defaults to whole screen
    #-------------------------------------------------------------------------
    def initialize(x, y, width, height, viewport = nil)
      super(viewport)
      self.x = x
      self.y = y
      self.width = width
      self.height = height
    end
    #-------------------------------------------------------------------------
    #   Name      : Set Source X
    #   Info      : Sets Source X of Display
    #   Author    : Trickster
    #   Call Info : One Argument, Integer ox Offset X Starting Point
    #-------------------------------------------------------------------------
    def sx=(ox)
      src_rect.x = ox
    end
    #-------------------------------------------------------------------------
    #   Name      : Set Source Y
    #   Info      : Sets Source Y of Display
    #   Author    : Trickster
    #   Call Info : One Argument, Integer oy Offset Y Starting Point
    #-------------------------------------------------------------------------
    def sy=(oy)
      src_rect.y = oy
    end
    #-------------------------------------------------------------------------
    #   Name      : Set Source Width
    #   Info      : Sets Source Width of Display
    #   Author    : Trickster
    #   Call Info : One Argument, Integer width The Sprite's Width
    #-------------------------------------------------------------------------
    def width=(width)
      src_rect.width = width
      @width = width
    end
    #-------------------------------------------------------------------------
    #   Name      : Set Source Height
    #   Info      : Sets Source Height of Display
    #   Author    : Trickster
    #   Call Info : One Argument, Integer height The Sprite's Height
    #-------------------------------------------------------------------------
    def height=(height)
      src_rect.height = height
      @height = height
    end
    #-------------------------------------------------------------------------
    # * Name      : Get Source X
    #   Info      : Gets Source X of Display
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def sx
      return src_rect.x
    end
    #-------------------------------------------------------------------------
    # * Name      : Get Source Y
    #   Info      : Gets Source Y of Display
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def sy
      return src_rect.y
    end
    #-------------------------------------------------------------------------
    # * Name      : Get Source Width
    #   Info      : Gets Source Width of Display
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def width
      return src_rect.width
    end
    #-------------------------------------------------------------------------
    # * Name      : Get Source Height
    #   Info      : Gets Source Height of Display
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def height
      return src_rect.height
    end
    #-------------------------------------------------------------------------
    # * Name      : Set Bitmap
    #   Info      : Sets the Sprite's Bitmap
    #   Author    : Trickster
    #   Call Info : One Argument, Bitmap bitmap the bitmap to be loaded
    #-------------------------------------------------------------------------
    def bitmap=(bitmap)
      super(bitmap)
      src_rect.width = @width
      src_rect.height = @height
    end
  end
  
  #==============================================================================
  # ** Sprite_Scrollable                                           By: Trickster
  #------------------------------------------------------------------------------
  #  This sprite class contains scroll functions.  Inherits from Scroll Sprite.
  #  for a practical example of how to use see, Window Scrollable and 
  #  my Advanced Mission script
  #==============================================================================
  class Sprite_Scrollable < Scroll_Sprite
    #-------------------------------------------------------------------------
    # * Public Instance Variables
    #-------------------------------------------------------------------------
    attr_accessor :speed
    attr_accessor :bitmap_rect
    attr_writer   :horizontal_scroll
    attr_writer   :vertical_scroll
    #-------------------------------------------------------------------------
    # * Name      : Initialize
    #   Info      : Object Initialization
    #   Author    : Trickster
    #   Call Info : Four Arguments
    #              Integer X and Y define position
    #              Integer Width and Height defines the Source Width and Height
    #-------------------------------------------------------------------------
    def initialize(x, y, width, height)
      super(x,y,width,height)
      @bitmap_rect = Rect.new(0,0,width,height)
      @speed = 0
      @horizontal_scroll = false
      @vertical_scroll = false
    end
    #-------------------------------------------------------------------------
    # * Name      : Normal Text Color
    #   Info      : The Normal Text Color - (255,255,255,255)
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def normal_color
      return Color.new(255, 255, 255, 255)
    end
    #-------------------------------------------------------------------------
    # * Name      : Disabled Text Color
    #   Info      : The Disable Text Color-  (255,255,255,128)
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def disabled_color
      return Color.new(255, 255, 255, 128)
    end
    #-------------------------------------------------------------------------
    # * Name      : System Text Color
    #   Info      : The System Text Color (192,224,255,255)
    #   Author    :  Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def system_color
      return Color.new(192, 224, 255, 255)
    end
    #-------------------------------------------------------------------------
    # * Name      : Vertical?
    #   Info      : Can sprite be scrolled vertically?
    #   Author    : Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def vertical?
      return false if self.bitmap == nil
      return self.bitmap.height > self.height
    end
    #-------------------------------------------------------------------------
    # * Name      : Horizontal?
    #   Info      : Can sprite be scrolled horizontally?
    #   Author    :  Trickster
    #   Call Info : No Arguments
    #-------------------------------------------------------------------------
    def horizontal?
      return false if self.bitmap == nil
      return self.bitmap.width > self.width
    end
    #-------------------------------------------------------------------------
    # * Name      : Update
    #   Info      : Frame Update
    #   Author    : Trickster
    #   Call Info : No Arguments
    #   Comment   : Allows the Sprite To Scroll with direction keys 
    #               if scrolling is enabled
    #-------------------------------------------------------------------------
    def update
      super
      if Input.repeat?(Input::UP)
        if self.sy > @bitmap_rect.y and @vertical_scroll and vertical?
          self.sy = [self.sy - speed, @bitmap_rect.y].max
        end
      end
      if Input.repeat?(Input::LEFT)
        if self.sx > @bitmap_rect.x and @horizontal_scroll and horizontal?
          self.sx = [self.sx - speed, @bitmap_rect.x].max
        end
      end
      if Input.repeat?(Input::DOWN)
        if self.sy < @bitmap_rect.height - self.height and @vertical_scroll and vertical?
          self.sy = [self.sy + speed, @bitmap_rect.height].min
        end
      end
      if Input.repeat?(Input::RIGHT)
        if self.sx < @bitmap_rect.width - self.width and @horizontal_scroll and horizontal?
          self.sx = [self.sx - speed, @bitmap_rect.width].min
        end
      end
    end
  end
  
  
  
  #============================================================================== 
  # ** Systems.String Operators                                     By: Trickster
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # Classes that perform Operations on strings
  #  
  # Class List:
  # ------------
  # Increaser_String
  # Range_String
  #==============================================================================
  
  MACL::Loaded << 'Systems.String Operators'
  
  #==============================================================================
  # ** Increaser String                                             By: Trickster
  #------------------------------------------------------------------------------
  #  This utility class represents stat bonuses in a string
  #  Only recognizes the stats maxhp,maxsp,str,dex,agi,int,pdef,mdef,eva,atk
  #  entries are separated by commas and increase amounts are shown by the 
  #  operators stat:xN/N+N-N
  #  When Conveterted to a hash, becomes one in this format {'effect' => [+,*]}
  #==============================================================================
  
  class Increaser_String
    #-------------------------------------------------------------------------
    # * Name      : To_Hash
    #   Info      : Returns A Hash in this format, {'effect' => [+,*]}
    #   Author    : Trickster
    #   Call Info : One Argument, String string string to be converted
    #-------------------------------------------------------------------------
    def self.to_hash(string)
      # Make a Copy of the string
      string = string.dup
      # Create Hash
      hash = {}
      # Run Through all strings splitted by ,
      string.split(',').each do |effect|
        # Get Index
        index = effect.index(':')
        # Get Size
        size = effect.size
        # Get Stat Name
        stat = effect[0, index]
        # Get Modifiers
        modifiers = effect[index+1, (size-index+1)]
        # Get Amounts
        amounts = modifiers.gsub(/\+|\*|-|\//, ' ').split(' ')
        # Get Operations
        operations = modifiers.gsub(/[0-9]|\./, ' ').split(' ')
        # Initialize Amounts
        plus_amount, times_amount = 0, 1
        # Run Through Each Index
        amounts.each_with_index do |amount, index|
          # Get Operation
          operation = operations[index]
          # Branch by operation
          case operation
          when '+'
            plus_amount += amount.to_f
          when '-'
            plus_amount -= amount.to_f
          when '*'
            times_amount *= amount.to_f
          when '/'
            times_amount /= amount.to_f
          end
        end
        # Set Hash At Stat To Plus Amount and Times Amount
        hash[stat] = plus_amount, times_amount
      end
      # Return Hash
      return hash
    end
  end
  
  #==============================================================================
  # ** Range String                                                 By: Trickster
  #------------------------------------------------------------------------------
  #  This utility class represents a range of integers and 
  #  recognizes num-num2 num ^num, entries are separated by commas.
  #  Where num-num2 gets all numbers from num1 to num2
  #  num gets that number
  #  and ^num removes num from the range
  #==============================================================================
  class Range_String
    #-------------------------------------------------------------------------
    # * Name      : To_A
    #   Info      : To Array - An Array of Integers
    #   Author    : Trickster
    #   Call Info : One Argument String string the string to convert
    #-------------------------------------------------------------------------
    def self.to_a(string)
      # Create An Array
      array = []
      # Create Deleted Array
      deleted = []
      # Run through each range
      string.split(',').each do |range|
        # If - is included
        if range.include?('-')
          # Get Index
          index = range.index('-')
          # Get Size
          size = range.size
          # Get First Number
          first = range[0, index].to_i
          # Get Last Number
          last = range[index + 1, size - (index + 1)].to_i
          # Add To Array
          array += (first..last).to_a
        # Elsif ^ Is included
        elsif range.include?('^')
          # Add to Deleted
          deleted << range.to_i
        # Else
        else
          # Add to Array
          array << range.to_i
        end
      end
      # Return Array with Deleted Entries Removed
      return array - deleted
    end
  end
  
  #============================================================================== 
  # ** Systems.Window Sprites                                       By: Trickster
  #------------------------------------------------------------------------------
  # Description:
  # ------------
  # This set allows for sprite objects to be tagged onto a window.
  #  
  # Method List:
  # ------------
  # Sprite
  # ------
  # tag
  # in_rect?
  #  
  # Support Methods:
  # -------------
  #   Window_Base
  #   -----------
  #   initialize
  #   dispose
  #   update
  #   x=
  #   y=
  #   z=
  #   ox=
  #   oy=
  #   width=
  #   height=
  #   contents_opacity=
  #   back_opacity=
  #   opacity=
  #   visible=
  #    
  #   Sprite
  #   ------
  #   initialize
  #==============================================================================
  
  MACL::Loaded << 'Systems.Window Sprites'
  
  class Window_Base
    #--------------------------------------------------------------------------
    # * Alias Listings
    #--------------------------------------------------------------------------
    if @trick_sprites_windowbase.nil?
      alias_method :trick_sprites_base_x=, :x=
      alias_method :trick_sprites_base_y=, :y=
      alias_method :trick_sprites_base_z=, :z=
      alias_method :trick_sprites_base_ox=, :ox=
      alias_method :trick_sprites_base_oy=, :oy=
      alias_method :trick_sprites_base_width=, :width=
      alias_method :trick_sprites_base_height=, :height=
      alias_method :trick_sprites_base_contents_opacity=, :contents_opacity=
      alias_method :trick_sprites_base_back_opacity=, :back_opacity=
      alias_method :trick_sprites_base_opacity=, :opacity=
      alias_method :trick_sprites_base_visible=, :visible=
      @trick_sprites_windowbase = true
    end
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    alias_method :trick_sprites_base_initialize, :initialize
    def initialize(x, y, width, height)
      # Setup Sprites Array
      @window_sprites = []
      # The Usual
      trick_sprites_base_initialize(x, y, width, height)
    end
    #--------------------------------------------------------------------------
    # * Dispose
    #--------------------------------------------------------------------------
    alias_method :trick_sprites_base_dispose, :dispose
    def dispose
      # The Usual
      trick_sprites_base_dispose
      # Dispose all Sprites
      @window_sprites.each {|sprite| sprite.dispose}
    end
    #--------------------------------------------------------------------------
    # * Update
    #--------------------------------------------------------------------------
    alias_method :trick_sprites_base_update, :update
    def update
      # The Usual
      trick_sprites_base_update
      # Update
      @window_sprites.each {|sprite| sprite.update}
    end
    #--------------------------------------------------------------------------
    # * Set X
    #--------------------------------------------------------------------------  
    def x=(x)
      # Run through each window sprite
      @window_sprites.each do |sprite|
        # If Has Method sprite type
        if sprite.respond_to?(:sprite_type)
          # Branch by Type
          case sprite.sprite_type
          when 'content', 'content2', 'cover', 'background', 'background2'
            # Include Scroll Calculation Set X
            sprite.x = sprite.x - self.x + x + ox
          when 'border'
            # Exclude Scroll Calculation Set X
            sprite.x = sprite.x - self.x + x
          end
        else
          # Default is Content Sprite
          sprite.x = sprite.x - self.x + x + ox
        end
      end
      # The Usual
      self.trick_sprites_base_x = x
    end
    #--------------------------------------------------------------------------
    # * Set Y
    #-------------------------------------------------------------------------- 
    def y=(y)
      # Update All Y's
      @window_sprites.each do |sprite|
        # If Has Method sprite type
        if sprite.respond_to?(:sprite_type)
          # Branch by Type
          case sprite.sprite_type
          when 'content', 'content2', 'cover', 'background', 'background2'
            # Include Scroll Calculation Set Y
            sprite.y = sprite.y - self.y + y + oy
          when 'border'
            # Exclude Scroll Calculation Set Y
            sprite.y = sprite.y - self.y + y
          end
        else
          # Default is Content Sprite
          sprite.y = sprite.y - self.y + y + oy
        end
      end
      # The Usual
      self.trick_sprites_base_y = y
    end
    #--------------------------------------------------------------------------
    # * Set Z
    #-------------------------------------------------------------------------- 
    def z=(z)
      # Update All Z's
      @window_sprites.each do |sprite| 
        # If Has Method sprite type
        if sprite.respond_to?(:sprite_type)
          # Branch By Sprite Type
          case sprite.sprite_type
          when 'content'
            sprite.z = self.z + 1
          when 'content2'
            sprite.z = self.z + 2
          when 'cover', 'border'
            sprite.z = self.z + 3
          when 'background'
            sprite.z = self.z
          when 'background2'
            sprite.z = self.z - 1
          end
        else
          # Default is content
          sprite.z = self.z + 1
        end
      end
      # The Usual
      self.trick_sprites_base_z = z
    end
    #--------------------------------------------------------------------------
    # * Set Origin X
    #-------------------------------------------------------------------------- 
    def ox=(ox)
      # Get Ox Change
      cx = self.ox - ox
      # Run Through Each Sprite
      @window_sprites.each do |sprite|
        # If Has Method sprite type
        if sprite.respond_to?(:sprite_type)
          # Branch By Sprite Type
          case sprite.sprite_type
          when 'content', 'content2', 'cover', 'background', 'background2'
            # Add to X
            sprite.x += cx
            # Setup Visibility
            sprite.visible = sprite.x.between?(x + 16, x + width - 16) && visible
          end
        else
          # Add to X
          sprite.x += cx
          # Setup Visibility
          sprite.visible = sprite.x.between?(x + 16, x + width - 16) && visible
        end
      end
      # The Usual
      self.trick_sprites_base_ox = ox
    end
    #--------------------------------------------------------------------------
    # * Set Origin Y
    #-------------------------------------------------------------------------- 
    def oy=(oy)
      # Get Oy Change
      cy = self.oy - oy
      # Run Through Each Sprite
      @window_sprites.each do |sprite|
        # If Has Method sprite type
        if sprite.respond_to?(:sprite_type)
          # Branch By Sprite Type
          case sprite.sprite_type
          when 'content', 'content2', 'cover', 'background', 'background2'
            # Add to Y
            sprite.y += cy
            # Setup Visibility
            sprite.visible = sprite.y.between?(y + 16, y + height - 16) && visible
          end
        else
          # Add to Y
          sprite.y += cy
          # Setup Visibility
          sprite.visible = sprite.y.between?(y + 16, y + height - 16) && visible
        end
      end
      # The Usual
      self.trick_sprites_base_oy = oy
    end
    #--------------------------------------------------------------------------
    # * Set Width
    #-------------------------------------------------------------------------- 
    def width=(width)
      # Run Through Each Sprite
      @window_sprites.each do |sprite|
        # If Has Method sprite type
        if sprite.respond_to?(:sprite_type)
          # Branch By Sprite Type
          case sprite.sprite_type
          when 'content', 'content2', 'cover', 'background', 'background2'
            # Setup Visibility
            sprite.visible = sprite.x.between?(x + 16, x + width - 16) && visible
          end
        else
          # Setup Visibility
          sprite.visible = sprite.x.between?(x + 16, x + width - 16) && visible
        end
      end
      # The Usual
      self.trick_sprites_base_width = width
    end
    #--------------------------------------------------------------------------
    # * Set Height
    #-------------------------------------------------------------------------- 
    def height=(height)
      # Run Through Each Sprite
      @window_sprites.each do |sprite|
        # If Has Method sprite type
        if sprite.respond_to?(:sprite_type)
          # Branch By Sprite Type
          case sprite.sprite_type
          when 'content', 'content2', 'cover', 'background', 'background2'
            # Setup Visibility
            sprite.visible = sprite.y.between?(y + 16, y + height - 16) && visible
          end
        else
          # Setup Visibility
          sprite.visible = sprite.y.between?(y + 16, y + height - 16) && visible
        end
      end
      # The Usual
      self.trick_sprites_base_height = height
    end
    #--------------------------------------------------------------------------
    # * Set Contents Opacity
    #-------------------------------------------------------------------------- 
    def contents_opacity=(opacity)
      # Run Through Each Sprite and Setup Opacity
      @window_sprites.each do |sprite|
        # If Has Method sprite type
        if sprite.respond_to?(:sprite_type)
          # Branch By Sprite Type
          case sprite.sprite_type
          when 'content', 'content2', 'cover'
            # Setup Opacity
            sprite.opacity = opacity
          end
        else
          # Setup Opacity
          sprite.opacity = opacity
        end
      end
      # The Usual
      self.trick_sprites_base_contents_opacity = opacity
    end
    #--------------------------------------------------------------------------
    # * Set Back Opacity
    #-------------------------------------------------------------------------- 
    def back_opacity=(opacity)
      # Run Through Each Sprite and Setup Opacity
      @window_sprites.each do |sprite|
        # Skip if not Has Method sprite type
        next if not sprite.respond_to?(:sprite_type)
        # Branch By Sprite Type
        case sprite.sprite_type
        when 'background', 'background2'
          # Setup Opacity
          sprite.opacity = opacity
        end
      end
      # The Usual
      self.trick_sprites_base_back_opacity = opacity
    end
    #--------------------------------------------------------------------------
    # * Set Opacity
    #-------------------------------------------------------------------------- 
    def opacity=(opacity)
      # Run Through Each Sprite and Setup Opacity
      @window_sprites.each do |sprite|
        # Skip if not Has Method sprite type
        next if not sprite.respond_to?(:sprite_type)
        # Branch By Sprite Type
        case sprite.sprite_type
        when 'border', 'tagged'
          # Setup Opacity
          sprite.opacity = opacity
        end
      end
      # The Usual
      self.trick_sprites_base_opacity = opacity
    end
    #--------------------------------------------------------------------------
    # * Set Visibility
    #-------------------------------------------------------------------------- 
    def visible=(bool)
      # Get Rect
      rect = Rect.new(x + 16, y + 16, width - 32, height - 32)
      # Run Through Each Sprite
      @window_sprites.each do |sprite|
        # If Has Method sprite type
        if sprite.respond_to?(:sprite_type)
          # Branch By Sprite Type
          case sprite.sprite_type
          when 'content', 'content2', 'cover', 'background', 'background2'
            sprite.visible = bool && sprite.in_rect?(rect)
          when 'border', 'tagged'
            sprite.visible = visible
          end
        else
          sprite.visible = bool && sprite.in_rect?(rect)
        end
      end
      # Update Visibility
      self.trick_sprites_base_visible = bool
    end
  end
  
  class Sprite
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_writer :sprite_type
    #--------------------------------------------------------------------------
    # * Sprite Type
    #--------------------------------------------------------------------------
    def sprite_type
      return @sprite_type.nil? ? 'content' : @sprite_type
    end
    #--------------------------------------------------------------------------
    # * Tag
    #--------------------------------------------------------------------------
    def tag(window)
      # Get Attributes
      x, y, width, height = window.x, window.y, window.width, window.height
      # Setup Rect
      rect = Rect.new(x + 16, y + 16, width - 32, height - 32)
      # Branch by Sprite Type
      case sprite_type
      when 'content'
        # Set Visibility
        self.visible = in_rect?(rect) && window.visible
        # Set Z Between Window
        self.z = window.z + 1
        # Setup Opacity
        self.opacity = window.contents_opacity
      when 'content2'
        # Set Visibility
        self.visible = in_rect?(rect) && window.visible
        # Set Z Between Window
        self.z = window.z + 2
        # Setup Opacity
        self.opacity = window.contents_opacity
      when 'cover'
        # Set Visibility
        self.visible = in_rect?(rect) && window.visible
        # Set Z Between Window
        self.z = window.z + 3
        # Setup Opacity
        self.opacity = window.contents_opacity
      when 'border'
        # Set Visibility
        self.visible = window.visible
        # Set Z Between Window
        self.z = window.z + 3
        # Setup Opacity
        self.opacity = window.opacity
      when 'background'
        # Set Visibility
        self.visible = in_rect?(rect) && window.visible
        # Set Z at Window
        self.z = window.z
        # Setup Opacity
        self.opacity = window.back_opacity
      when 'background2'
        # Set Visibility
        self.visible = in_rect?(rect) && window.visible
        # Set Z at Window
        self.z = window.z - 1
        # Setup Opacity
        self.opacity = window.back_opacity
      when 'tagged'
        # Set Visibility
        self.visible = window.visible
        # Setup Opacity
        self.opacity = window.opacity
      end
    end
    #--------------------------------------------------------------------------
    # * In Rect?
    #--------------------------------------------------------------------------
    def in_rect?(*rect)
      # If 1 Argument Sent
      if rect.size == 1
        # Get Rect
        rect = rect[0]
        # Return in rect state
        return (x.between?(rect.x, rect.x + rect.width) && 
        y.between?(rect.y, rect.y + rect.height))
      else
        # Get variables sent
        x, y, width, height = rect
        # If In Rect
        return self.x.between?(x, x + width) && self.y.between?(y, y + height)
      end
    end
  end
  