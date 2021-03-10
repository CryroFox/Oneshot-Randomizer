#==============================================================================
# ** Modules.Event Spawner (2.2)                              By SephirothSpawn
#------------------------------------------------------------------------------
# * Description :
#
#   This script was designed to allow you to create events via scripts. It
#   will create events immeditately, and can save created events perm. on the
#   map after creation, or appear once. You can also clone events, performing
#   modifications via Event Spawner module, or immeditely end the clone
#   event process and move the new event to a position.
#------------------------------------------------------------------------------
# * Instructions :
#
#   THIS SCRIPT IS COMPLEX!!! I TOOK HOURS OF COMMENTING, RUNNING THROUGH
#   ALL EVENT CODES & PARAMETERS (600+ LINES), AND MAKING THIS SCRIPT EASIER
#   TO USE. PLEASE READ THE CREATION & EVENT COMMAND CODES & PARAMETERS
#   BEFORE ASKING FOR SUPPORT!
#
#   If you are ever unsure of a event layout, insert this at the top of event
#   commands
#
#   Call Script :
#
#     for event_command in $game_map.events[event_id].list
#       p [event_command.code, event_command.parameters, event_command.indent]
#     end
#
#   Write down the code, parameters & indention, and use the add event command
#   function to create event commands.
#
#   To see instructions on creating events, refer to creation instrucitons.
#   To see event command codes & parameters, refer to event command c & p.
#------------------------------------------------------------------------------
# * Making Events Without Huge Call Scripts :
#
#   This script has a built-in sub-module that will create events with a
#   simple 1-line call script, rather than creating a 15 line call script.
#
#   To create a simple event spawn, search for the Presets module, directly
#   below the Event_Spawner module heading.
#
#   Create a method name, which should match the event you are creating. For
#   example; if you were creating a event on your map that will show a simple
#   text message, you can use a name such as
#
#   def self.sample_event_text
#
#   Make sure to put the self. in from of your method name, or it will not
#   read the method and you will have an error.
#
#   Basic Syntax For Method Naming
#
#     def self.<event_name>
#
#   Feel free to use method arguments as well (If you don't understand this,
#   do not worry about it)
#
#
#   Once your method is defined, you can now put what you would put in your
#   call script here in the method name.
#
#   Finish you method by adding a end and you are finished.
#
#
#   Example Preset Event:
#
#    def self.sample_event_a
#      Event_Spawner.create_event(3, 5, 'Sample Event A')
#      Event_Spawner.set_page_graphic({'c_name' => '002-Fighter02'})
#      Event_Spawner.add_event_command(101, ['I am a spawned event'])
#      Event_Spawner.end_event
#    end
#
#   ~ Creates an event at 3, 5 named Sample Event A
#   ~ Sets 1st Page Graphic Character Name to 002-Fighter02
#   ~ Creates Event Command : Show Message (Code 101)
#   ~ Ends Event
#
#   To call your event preset, use
#
#   Event_Spawner.Presets.<method_name>
#
#   (This Basically Serves as nothing more than call scripts in the script
#    itself, rather than the events.)
#------------------------------------------------------------------------------
# * Event Creation Instructions :
#
#
#   **** Basic Event Creation Procedure ****
#
#   1) Create Event
#   2) Set Page Graphics & Conditions
#   3) Set Page Conditions
#   4) Add New Page (If Needed)
#   5) Repeat Steps 2-4 as needed
#   6) End Event
#
#
#   **** Syntax Instructions *****
#
#   Creating Event
#    - Event_Spawner.create_event(x = 0, y = 0, name = '')
#
#   Adding Event Command
#    - Event_Spawner.add_event_command(code, parameters = [], indent = 0)
#
#   Setting Page Condition
#    - Event_Spawner.set_page_condition({<parameters>})
#      'switch1'    => switch_id
#      'switch2'    => switch_id
#      'selfswitch' => 'A', 'B', 'C' or 'D'
#      'variable'   => [variable_id, value]
#
#   Setting Page Graphic
#    - Event_Spawner.set_page_graphic(
#      'tileid'  => id
#      'c_name'  => 'character_filename'
#      'c_hue'   => 0..360
#      'dir'     => 2 : Down, 4 : Left, 6 : Right, 8 : Up
#      'pattern' => 0..3
#      'opacity' => 0..255
#      'blend'   => 0 : Normal, 1 : Addition, 2 : Subtraction
#
#   Setting Page Trigger
#    - Event_Spawner.set_page_trigger(trigger)
#      0 : Action Button, 1 : Contact With Player, 2 - Contact With Event
#      3 : Autorun,       4 : Parallel Processing
#
#   Set Page Move Settings
#    - Event_Spawner.set_page_move_settings({<parameters>})
#      'type'  => 0 : fixed, 1 : random, 2 : approach, 3 : custom).
#      'speed' => 1 : slowest ... 6 : fastest
#      'freq'  => 1 : lowest  ... 6 : highest
#      'route' => RPG::MoveRoute (See Generate Move Route)
#
#   Generate Move Route
#    - Event_Spawner.generate_move_route(list = [], repeat, skippable)
#      See Method Heading For List Parameters
#------------------------------------------------------------------------------
# * Cloning Events
#
#   Cloning events from current map
#    - Event_Spawner.clone_event(target_id, new_x, new_y, new_name,
#        end_event = false, save_event = false)
#
#   Cloning events from different map
#    - Event_Spawner.clone_event(map_id, target_id, new_x, new_y, new_name,
#        end_event = false, save_event = false)
#------------------------------------------------------------------------------
# * Event Command Code & Parameters
#
#  ~~ Show Text
#    - Code       : 101 (Lines After First Line : 401)
#    - Parameters : ['Text Line']
#
#  ~~ Show Choices
#    - Code       : 102
#    - Parameters : Did not comment on yet
#
#  ~~ When [**]
#    - Code       : 402
#    - Parameters : Did not comment on yet
#
#  ~~ When Cancel
#    - Code       : 403
#    - Parameters : Did not comment on yet
#
#  ~~ Input Number
#    - Code       : 103
#    - Parameters : Did not comment on yet
#  ~~ Change Text Options
#    - Code       : 104
#    - Parameters : [ <message_position>, <message_frame> ]
#
#      <message_position> - (0 : Up, 1 : Middle, 2 : Down)
#      <message_frame>    - (0 : Visible, 1 : Invisible)
#
#  ~~ Button Input Processing
#    - Code       : 105
#    - Parameters : [ variable_id ]
#
#  ~~ Wait
#    - Code       : 106
#    - Parameters : [ frames ]
#
#  ~~ Comment :
#    - Code       : 108 (Lines After First Line - 408)
#    - Parameters : [ 'Comment Text' ]
#
#  ~~ Conditional Branch
#    - Code       : 111
#    - Parameters : Did not comment on yet
#
#  ~~ Else
#    - Code       : 411
#    - Parameters : Did not comment on yet
#
#  ~~ Loop
#    - Code       : 112
#    - Parameters : Did not comment on yet
#
#  ~~ Repeat Above
#    - Code       : 413
#    - Parameters : Did not comment on yet
#
#  ~~ Break Loop
#    - Code       : 113
#    - Parameters : Did not comment on yet
#
#  ~~ Exit Event Processing
#    - Code       : 115
#    - Parameters : []
#
#  ~~ Erase Event
#    - Code       : 116
#    - Parameters : []
#
#  ~~ Call Common Event
#    - Code       : 117
#    - Parameters : [ common_event_id ]
#
#  ~~ Label
#    - Code       : 118
#    - Parameters : [ 'label_name' ]
#
#  ~~ Jump to Label
#    - Code       : 119
#    - Parameters : [ 'label_name' ]
#
#  ~~ Control Switches
#    - Code       : 121
#    - Parameters : [ start_variable, end_variable, <boolean> ]
#
#    <boolean> - (0 : On, 1 : Off)
#
#  ~~ Control Variables
#    - Code       : 122
#    - Parameters : [ start_var_id, end_var_id, <opperation>, <opperand>, <p> ]
#
#    <opperation> - (0: Set, 1: +, 2: -, 3: *, 4: /, 5: %)
#    <opperand> - (0: Constant, 1: Variable, 2: Random Number, 3: Item,
#                  4: Hero, 5: Monster, 6: Sprite, 7: Other)
#    <p>
#       When <opperand> is Constant (0)
#        - n
#       When <opperand> is Variable (1)
#        - variable_id
#       When <opperand> is Random Number (2)
#        - lower, higher
#       When <opperand> is Item (3)
#        - item_id
#       When <opperand> is Hero (4)
#        - hero_id, <stat> (See <stat> Below)
#       When <opperand> is Monster (5)
#        - monster_id, <stat> (See <stat> Below)
#       When <opperand> is Sprite (6)
#        - <event_id>, <tile>
#
#        <event_id> - (-1: Player, 0: This Event, 1-X: Event ID)
#        <tile> - (0: X Tile, 1: Y Tile, 2: Face, 3: Screen X, 4: Screen Y,
#                  5:Terrain)
#       When <opperand> is Other (7)
#        - (0: Map ID, 1: Party Size, 2: Money, 3: # of Steps,
#           4: Timer in Secs, 5: # of Saves)
#
#        <stat> - (0: HP, 1: SP, 2: Max HP, 3: Max SP, 4: Str,
#                  5: Dex, 6: Agi, 7: Int, 8: Atk, 9: PDef, 10: MDef, 11: Eva)
#  ~~ Control Self Switch
#    - Code       : 123
#    - Parameters : [ 'switch_letter', <boolean> ]
#
#    <boolean> - (0 : On, 1 : Off)
#
#  ~~ Control Timer
#    - Code       : 124
#    - Parameters : [ <boolean>, seconds ]
#
#    <boolean> - (0 : On, 1 : Off)
#
#  ~~ Change Gold
#    - Code       : 125
#    - Parameters : [ <operation>, <type>, <operand> ]
#
#    <operation> - (0 : Increase, 1 : Decrease)
#    <type> - (0: Constant 1: Variable)
#    <operand> - number or variable_id
#
#  ~~ Change Items
#    - Code       : 126
#    - Parameters : [ item_id, <operation>, <type>, <operand> ]
#
#    <operation> - (0 : Increase, 1 : Decrease)
#    <type> - (0: Constant 1: Variable)
#    <operand> - number or variable_id
#
#  ~~ Change Weapons
#    - Code       : 127
#    - Parameters :[ weapon_id, <operation>, <type>, <operand> ]
#
#    <operation> - (0 : Increase, 1 : Decrease)
#    <type> - (0: Constant 1: Variable)
#    <operand> - number or variable_id
#
#  ~~ Change Armor
#    - Code       : 128
#    - Parameters :[ armor_id, <operation>, <type>, <operand> ]
#
#    <operation> - (0 : Increase, 1 : Decrease)
#    <type> - (0: Constant 1: Variable)
#    <operand> - number or variable_id
#
#  ~~ Change Party Member
#    - Code       : 129
#    - Parameters : [ actor_id, <operation>, <reset> ]
#
#    <operation> - (0 : Add, 1 : Remove)
#    <reset> - (0 : Leave As Is, 1 : Reset Actor Information)
#
#  ~~ Change Windowskin
#    - Code       : 131
#    - Parameters : [ 'windowskin_name' ]
#
#  ~~ Change Battle BGM
#    - Code       : 132
#    - Parameters : [ 'battle_bgm' ]
#
#  ~~ Change Battle End ME
#    - Code       : 133
#    - Parameters : [ 'battle_me' ]
#
#  ~~ Change Save Access
#    - Code       : 134
#    - Parameters : [ <boolean> ]
#
#    <boolean> - (0 : On, 1 : Off)
#
#  ~~ Change Menu Access
#    - Code       : 135
#    - Parameters : [ <boolean> ]
#
#    <boolean> - (0 : On, 1 : Off)
#
#  ~~ Change Encounter
#    - Code       : 136
#    - Parameters : [ <boolean> ]
#
#    <boolean> - (0 : On, 1 : Off)
#
#  ~~ Transfer Player
#    - Code       : 201
#    - Parameters : [ <type>, <map_id>, <x>, <y>, <direction> ]
#
#    <type> - (0 : Constant, 1 : Game Variable)
#    <map_id> - number or variable_id
#    <x> - number or variable_id
#    <x> - number or variable_id
#    <direction> - (2 : Down, 4 : Left, 6 : Right, 8 : Up)
#
#  ~~ Set Event Location
#    - Code       : 202
#    - Parameters : [ <target_event>, <type>, <params>, <direction> ]
#
#    <target_event> - (-1 : Player, 0 : Current Event, N : Event ID)
#    <type> - (0 : Constant, 1 : Variables, 2 : Switch With Event)
#    <params>
#     When type is Constant (0) - target_x, target_y
#     When type is Variables (1) - x_variable, y_variable
#     When type is Switch Event (2) - event_id
#    <direction> - (2 : Down, 4 : Left, 6 : Right, 8 : Up)
#
#  ~~ Scroll Map
#    - Code       : 203
#    - Parameters : [ <direction>, distance, speed ]
#
#    <direction> - (2 : Down, 4 : Left, 6 : Right, 8 : Up)
#
#  ~~ Change Map Settings
#    - Code       : 204
#    - Parameters : [ <type>, <params> ]
#
#    <type> - (0 : Panorama, 1 : Fog, 2 : Battleback)
#    <params>
#     When type is Panorama (0) - name, hue
#     When type is Fog (1) - name, hue, opacity, blend_type, zoom, sx, sy
#     When type is Battleback (2) - name
#
#  ~~ Change Fog Color Tone
#    - Code       : 205
#    - Parameters : [ tone, duration ]
#
#  ~~ Change Fog Opacity
#    - Code       : 206
#    - Parameters : [ opacity, duration ]
#
#  ~~ Show Animation
#    - Code       : 207
#    - Parameters : [ <target_event>, animation_id ]
#
#    <target_event> - (-1 : Player, 0 : Current Event, N : Event ID)
#
#  ~~ Change Transparent Flag
#    - Code       : 208
#    - Parameters : [ <boolean> ]
#
#    <boolean> - (0 : Transparent, 1 : Non-Transparent)
#
#  ~~ Set Move Route
#    - Code       : 209
#    - Parameters : [ <target_event>, RPG::MoveRoute ]
#
#    <target_event> - (-1 : Player, 0 : Current Event, N : Event ID)
#
#  ~~ Wait for Move's Completion
#    - Code       : 210
#    - Parameters : []
#
#  ~~ Prepare for Transition
#    - Code       : 221
#    - Parameters : []
#
#  ~~ Execute Transition
#    - Code       : 222
#    - Parameters : [ transition_name ]
#
#  ~~ Change Screen Color Tone
#    - Code       : 223
#    - Parameters : [ tone, duration ]
#
#  ~~ Screen Flash
#    - Code       : 224
#    - Parameters : [ color, duration ]
#
#  ~~ Screen Shake
#    - Code       : 225
#    - Parameters : [ power, speed, duration ]
#
#  ~~ Show Picture
#    - Code       : 231
#    - Parameters : [ pic_id, name orgin, <type>, <x>, <y>,
#                     zoom_x, zoom_y, opacity, blend_type ]
#
#    <type> - (0 : Constant, 1 : Variables)
#    <x> - number or variable_id
#    <y> - number or variable_id
#
#  ~~ Move Picture
#    - Code       : 232
#    - Parameters : [ pic_id, name orgin, <type>, <x>, <y>,
#                     zoom_x, zoom_y, opacity, blend_type ]
#
#    <type> - (0 : Constant, 1 : Variables)
#    <x> - number or variable_id
#    <y> - number or variable_id
#
#  ~~ Rotate Picture
#    - Code       : 233
#    - Parameters : [ pic_id, angel ]
#
#  ~~ Change Picture Color Tone
#    - Code       : 234
#    - Parameters : [ pic_id, tone, duration ]
#
#  ~~ Erase Picture
#    - Code       : 235
#    - Parameters : [ pic_id ]
#
#  ~~ Set Weather Effects
#    - Code       : 236
#    - Parameters : [ <type>, power, duration ]
#
#    <type> - (0 : None, 1 : Rain, 2: Storm; 3: Snow)
#
#  ~~ Play BGM
#    - Code       : 241
#    - Parameters : [ RPG::AudioFile ]
#
#  ~~ Fade Out BGM
#    - Code       : 242
#    - Parameters : [ time ]
#
#  ~~ Play BGS
#    - Code       : 245
#    - Parameters : [ RPG::AudioFile ]
#
#  ~~ Fade Out BGS
#    - Code       : 246
#    - Parameters : [ time ]
#
#  ~~ Memorize BGM/BGS
#    - Code       : 247
#    - Parameters : []
#
#  ~~ Restore BGM/BGS
#    - Code       : 248
#    - Parameters : []
#
#  ~~ Play ME
#    - Code       : 249
#    - Parameters : [ RPG::AudioFile ]
#
#  ~~ Play SE
#    - Code       : 250
#    - Parameters : [ RPG::AudioFile ]
#
#  ~~ Stop SE
#    - Code       : 251
#    - Parameters : []
#
#  ~~ Battle Processing
#    - Code       : 301
#    - Parameters : [ troop_id, can_escape_boolean, can_lose_boolean ]
#
#  ~~ If Win
#    - Code       : 601
#    - Parameters : []
#
#  ~~ If Escape
#    - Code       : 602
#    - Parameters : []
#
#  ~~ If Lose
#    - Code       : 603
#    - Parameters : []
#
#  ~~ Shop Processing
#    - Code       : 302 (For Additional Shop Item Setup - 605)
#    - Parameters : [ [ <item_type>, item_id] ]
#
#    <item_type> - (0 : Item, 1 : Weapon, 2 : Armor)
#
#  ~~ Name Input Processing
#    - Code       : 303
#    - Parameters : [ actor_id, max_characters ]
#
#  ~~ Change HP
#    - Code       : 311
#    - Parameters : [ <actors>, <operation>, <type>, <operand> ]
#
#    <actors> - (0 : All Party Actors, N : Actor ID)
#    <operation> - (0 : Increase, 1 : Decrease)
#    <type> - (0: Constant 1: Variable)
#    <operand> - number or variable_id
#
#  ~~ Change SP
#    - Code       : 312
#    - Parameters : [ <actors>, <operation>, <type>, <operand> ]
#
#    <actors> - (0 : All Party Actors, N : Actor ID)
#    <operation> - (0 : Increase, 1 : Decrease)
#    <type> - (0: Constant 1: Variable)
#    <operand> - number or variable_id
#
#  ~~ Change State
#    - Code       : 313
#    - Parameters : [ <actors>, <operation>, state_id ]
#
#    <actors> - (0 : All Party Actors, N : Actor ID)
#    <operation> - (0 : Add State, 1 : Remove State)
#
#  ~~ Recover All
#    - Code       : 314
#    - Parameters :[ <actors> ]
#
#    <actors> - (0 : All Party Actors, N : Actor ID)
#
#  ~~ Change EXP
#    - Code       : 315
#    - Parameters : [ <actors>, <operation>, <type>, <operand> ]
#
#    <actors> - (0 : All Party Actors, N : Actor ID)
#    <operation> - (0 : Increase, 1 : Decrease)
#    <type> - (0: Constant 1: Variable)
#    <operand> - number or variable_id
#
#  ~~ Change Level
#    - Code       : 316
#    - Parameters : [ <actors>, <operation>, <type>, <operand> ]
#
#    <actors> - (0 : All Party Actors, N : Actor ID)
#    <operation> - (0 : Increase, 1 : Decrease)
#    <type> - (0: Constant 1: Variable)
#    <operand> - number or variable_id
#
#  ~~ Change Parameters
#    - Code       : 317
#    - Parameters : [ <actors>, <parameter>, <operation>, <type>, <operand> ]
#
#    <actors> - (0 : All Party Actors, N : Actor ID)
#    <parameter> - (0 : MaxHP, 1 : MaxSP, 2 : Str, 3 : Dex, 4 : Agi, 4 : Int)
#    <operation> - (0 : Increase, 1 : Decrease)
#    <type> - (0: Constant 1: Variable)
#    <operand> - number or variable_id
#
#  ~~ Change Skills
#    - Code       : 318
#    - Parameters : [ actor_id, <operation>, skill_id ]
#
#    <operation> - (0 : Learn Skill, 1 : Forget Skill)
#
#  ~~ Change Equipment
#    - Code       : 319
#    - Parameters : [ actor_id, <equip_type>, equipment_id ]
#
#    <equip_type> : (0 : Weapon, 1 : Shield, 2 : Head, 3 : Body, 4 : Acc)
#
#  ~~ Change Actor Name
#    - Code       : 320
#    - Parameters : [ actor_id, 'name' ]
#
#  ~~ Change Actor Class
#    - Code       : 321
#    - Parameters : [ actor_id, class_id ]
#
#  ~~ Change Actor Graphic
#    - Code       : 322
#    - Parameters : [ actor_id, character_name, character_hue,
#                               battler_name, battler_hue ]
#
#  ~~ Change Enemy HP
#    - Code       : 331
#    - Parameters : [ <enemies>, <operation>, <type>, <operand> ]
#
#    <enemies> - (0 : All Enemies, N : Enemy Index)
#    <operation> - (0 : Increase, 1 : Decrease)
#    <type> - (0: Constant 1: Variable)
#    <operand> - number or variable_id
#
#  ~~ Change Enemy SP
#    - Code       : 332
#    - Parameters : [ <enemies>, <operation>, <type>, <operand> ]
#
#    <enemies> - (0 : All Enemies, N : Enemy Index)
#    <operation> - (0 : Increase, 1 : Decrease)
#    <type> - (0: Constant 1: Variable)
#    <operand> - number or variable_id
#
#  ~~ Change Enemy State
#    - Code       : 333
#    - Parameters : [ <enemies>, <operation>, state_id ]
#
#    <enemies> - (0 : All Enemies, N : Enemy Index)
#    <operation> - (0 : Add State, 1 : Remove State)
#
#  ~~ Enemy Recover All
#    - Code       : 334
#    - Parameters : [ <enemies> ]
#
#    <enemies> - (0 : All Enemies, N : Enemy Index)
#
#  ~~ Enemy Appearance
#    - Code       : 335
#    - Parameters : [ <enemies> ]
#
#    <enemies> - (0 : All Enemies, N : Enemy Index)
#
#  ~~ Enemy Transform
#    - Code       : 336
#    - Parameters : [ enemy_index, target_enemy_id ]
#
#  ~~ Show Battle Animation
#    - Code       : 337
#    - Parameters : [ <target_troop>, <battlers>, animation_id ]
#
#    <target_troop> - (0 : Enemies, 1 : Actors)
#    <battlers> - (0 : Entire Troop, N : Index)
#
#  ~~ Deal Damage
#    - Code       : 338
#    - Parameters : [ <target_troop>, <battlers>, <type>, <operand> ]
#
#    <target_troop> - (0 : Enemies, 1 : Actors)
#    <battlers> - (0 : Entire Troop, N : Index)
#    <type> - (0: Constant 1: Variable)
#    <operand> - number or variable_id]
#
#  ~~ Force Action
#    - Code       : 339
#    - Parameters : [ <target_group>, <battlers>, <kind>, <basic>,
#                     <target>, <forcing> ]
#
#    <target_troop> - (0 : Enemies, 1 : Actors)
#    <battlers> - (0 : Entire Troop, N : Index)
#    <kind> - (0 : Attack/Guard, 1: Skill)
#    <basic>
#      When Kind is 0 - (0 : Attack, 1 : Guard)
#      When Kind is 1 - skill_id
#    <target> - (-2 : Last Target, -1 : Random Target, N : Target Index)
#    <forcing> - (0 : Execute Instead Of Next Move, 1 : Force Now)
#
#  ~~ Abort Battle
#    - Code       : 340
#    - Parameters : []
#
#  ~~ Call Menu Screen
#    - Code       : 351
#    - Parameters : []
#
#  ~~ Call Save Screen
#    - Code       : 352
#    - Parameters : []
#
#  ~~ Game Over
#    - Code       : 353
#    - Parameters : []
#
#  ~~ Return to Title Screen
#    - Code       : 354
#    - Parameters : []
#
#  ~~ Script
#    - Code       : 355 (Lines After First line - 655)
#    - Parameters : [ 'script text' ]
#==============================================================================
 
#MACL::Loaded << 'Modules.Event Spawner'
 
#==============================================================================
# ** Event_Spawner
#==============================================================================
 
module Event_Spawner
  #--------------------------------------------------------------------------
  # * Event
  #--------------------------------------------------------------------------
  def self.event
    return @event
  end
  #--------------------------------------------------------------------------
  # * Create Event
  #--------------------------------------------------------------------------
  def self.create_event(x = 0, y = 0, name = '')
    # Creates New Event
    @event = RPG::Event.new(x, y)
    @event.name = name
    # Generates ID
    @event.id = $game_map.events.empty? ? 1 : $game_map.events.keys.max + 1
  end
  #--------------------------------------------------------------------------
  # * Add Event Command (See Script Heading for Event Command Details)
  #--------------------------------------------------------------------------
  def self.add_event_command(code, parameters = [], indent = 0)
    # Creates New Event Command
    event_command = RPG::EventCommand.new
    # Sets Code, Parameters & Indent
    event_command.code = code
    event_command.parameters = parameters
    event_command.indent = indent
    # Adds Event Command To Page List
    self.get_current_page.list.insert(-2, event_command)
  end
  #--------------------------------------------------------------------------
  # * Set Page Condition
  #
  #   'switch1'    => switch_id
  #   'switch2'    => switch_id
  #   'selfswitch' => 'A', 'B', 'C' or 'D'
  #   'variable'   => [variable_id, value]
  #--------------------------------------------------------------------------
  def self.set_page_condition(parameters = {})
    # Gets Last Page Condition Settings
    page_c = self.get_current_page.condition
    # If 'switch1' Found
    if parameters.has_key?('switch1')
      # Turns Switch 1 On & Sets ID
      page_c.switch1_valid = true
      page_c.switch1_id    = parameters['switch1']
    end
    # If 'switch2' Found
    if parameters.has_key?('switch2')
      # Turns Switch 2 On & Sets ID
      page_c.switch2_valid = true
      page_c.switch2_id    = parameters['switch1']
    end
    # If 'selfswitch' Found
    if parameters.has_key?('selfswitch')
      # Turns Self Switch ON & Sets Switch Variable
      page_c.self_switch_valid = true
      page_c.self_switch_ch    = parameters['selfswitch']
    end
    # If 'variable' Found
    if parameters.has_key?('variable')
      # Turns Variable On, Sets Variable ID & Sets Value
      page_c.variable_valid = true
      page_c.variable_id    = parameters['variable'][0]
      page_c.variable_value = parameters['variable'][1]
    end
  end
  #--------------------------------------------------------------------------
  # * Set Page Graphic
  #
  #   'tileid'  => id
  #   'c_name'  => 'character_filename'
  #   'c_hue'   => 0..360
  #   'dir'     => 2 : Down, 4 : Left, 6 : Right, 8 : Up
  #   'pattern' => 0..3
  #   'opacity' => 0..255
  #   'blend'   => 0 : Normal, 1 : Addition, 2 : Subtraction
  #--------------------------------------------------------------------------
  def self.set_page_graphic(parameters = {})
    # Gets Last Page Graphic Settings
    page_g = self.get_current_page.graphic
    # Tile ID
    if parameters.has_key?('tileid')
      page_g.tile_id = parameters['tileid']
    end
    # Character Name
    if parameters.has_key?('c_name')
      page_g.character_name = parameters['c_name']
    end
    # Character Hue
    if parameters.has_key?('c_hue')
      page_g.character_hue = parameters['c_hue']
    end
    # Direction
    if parameters.has_key?('dir')
      page_g.direction = parameters['dir']
    end
    # Pattern
    if parameters.has_key?('pattern')
      page_g.pattern = parameters['pattern']
    end
    # Opacity
    if parameters.has_key?('opacity')
      page_g.opacity = parameters['opacity']
    end
    # Blend Type
    if parameters.has_key?('blend')
      page_g.blend_type = parameters['blend']
    end
  end
  #--------------------------------------------------------------------------
  # * Set Page Trigger
  #
  #   0 - Action Button
  #   1 - Contact With Player
  #   2 - Contact With Event
  #   3 - Autorun
  #   4 - Parallel Processing
  #--------------------------------------------------------------------------
  def self.set_page_trigger(trigger = 0)
    # Sets Last Page Trigger
    self.get_current_page.trigger = trigger
  end
  #--------------------------------------------------------------------------
  # * Set Page Move Settings
  #
  #   'type'  => 0 : fixed, 1 : random, 2 : approach, 3 : custom).
  #   'speed' => 1 : slowest ... 6 : fastest
  #   'freq'  => 1 : lowest  ... 6 : highest
  #   'route' => RPG::MoveRoute (See Generate Move Route)
  #--------------------------------------------------------------------------
  def self.set_page_move_settings(parameters = {})
    # Gets Last Page
    page = self.get_current_page
    # Type
    if parameters.has_key?('type')
      page.move_type = parameters['type']
    end
    # Speed
    if parameters.has_key?('speed')
      page.move_speed = parameters['speed']
    end
    # Frequency
    if parameters.has_key?('freq')
      page.move_frequency = parameters['freq']
    end
    # Route
    if parameters.has_key?('route')
      if parameters['route'].is_a?(RPG::MoveRoute)
        page.move_route = parameters['route']
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Set Page Options
  #
  #   'walk_anime'    => true or false
  #   'step_anime'    => true or false
  #   'direction_fix' => true or false
  #   'through'       => true or false
  #   'always_on_top' => true or false
  #--------------------------------------------------------------------------
  def self.set_page_options(parameters = {})
    # Gets Last Page
    page = self.get_current_page
    # Walk Animation
    if parameters.has_key?('walk_anime')
      page.walk_anime = parameters['walk_anime']
    end
    # Step Animation
    if parameters.has_key?('step_anime')
      page.step_anime = parameters['step_anime']
    end
    # Direction Fix
    if parameters.has_key?('direction_fix')
      page.direction_fix = parameters['direction_fix']
    end
    # Through
    if parameters.has_key?('through')
      page.through = parameters['through']
    end
    # Always On Top
    if parameters.has_key?('always_on_top')
      page.always_on_top = parameters['always_on_top']
    end
  end
  #--------------------------------------------------------------------------
  # * Add New Page
  #--------------------------------------------------------------------------
  def self.add_page
    @event.pages << RPG::Event::Page.new
  end
  #--------------------------------------------------------------------------
  # * Generate Move Route
  #
  #   list = [ <move_command>, ... ]
  #
  #   <move_command> : [code, parameters]
  #
  #   If no parameters required :
  #
  #   <move_command> : code
  #--------------------------------------------------------------------------
  def self.generate_move_route(list = [], repeat = true, skippable = false)
    # Creates New Move Route
    move_route = RPG::MoveRoute.new
    # Sets Repeat & Skipable
    move_route.repeat    = repeat
    move_route.skippable = skippable
    # Passes Through List
    for move_command in list
      if move_command.is_a?(Array)
        code, parameters = move_command[0], move_command[1]
      else
        code, parameters = move_command, []
      end
      # Crates New MoveCommand
      move_command = RPG::MoveCommand.new
      # Adds MoveCommand to List
      move_route << move_command
      # Sets MoveCommand Properties
      move_command.parameters = parameters
      move_command.code = code
    end
    # Add Blank Move Command
    move_route << RPG::MoveCommand.new
    # Return Move Route
    return move_route
  end
  #--------------------------------------------------------------------------
  # * End Event
  #--------------------------------------------------------------------------
  def self.end_event(save_event = false)
    # Stop If nil Event Created
    return if @event.nil?
    # Fix ID
    @event.id = $game_map.events.empty? ? 1 : $game_map.events.keys.max + 1
    # Add Event to Map & Spriteset Data
    $game_map.add_event(@event)
    # If Save Event Data
    if save_event
      # Creates Map Event Data (If none Present)
      unless @saved_events.has_key?((map_id = $game_map.map_id))
        @saved_events[map_id] = []
      end
      # Saves Event Data
      @saved_events[map_id] << @event.id
    end
    # Clear Event Data
    @event = nil
  end
  #--------------------------------------------------------------------------
  # * Clone Event
  #--------------------------------------------------------------------------
  def self.clone_event(target_id, new_x, new_y, new_name, end_event = false, save_event = false)
    # Stops If Event Not Found
    return unless $game_map.events.has_key?(target_id)
    # Gets Event Data
    @event = $game_map.events[target_id].event
    # Changes X, Y & name
    @event.x    = new_x
    @event.y    = new_y
    @event.name = new_name
    # Generates New ID
    @event.id = $game_map.events.empty? ? 1 : $game_map.events.keys.max + 1
    # If End Event
    if end_event
      # Ends Event Creation
      self.end_event(save_event)
    end
  end
  #--------------------------------------------------------------------------
  # * Clone Event (From different map)
  #--------------------------------------------------------------------------
  def self.clone_event2(map_id, target_id, new_x, new_y, new_name, end_event = false, save_event = false)
    # Loads map events
    events = load_data(sprintf("Data/Map%03d.rxdata", map_id)).events
    # Add saved events
    saved_events = self.saved_events(map_id)
    saved_events.each {|event_id, event| events[event_id] = event}
    # Return if events list doesn't contain target_id
    return unless events.has_key?(target_id)
    # Gets event
    @event = events[target_id]
    # Changes X, Y & name
    @event.x    = new_x
    @event.y    = new_y
    @event.name = new_name
    # Generates New ID
    @event.id = $game_map.events.empty? ? 1 : $game_map.events.keys.max + 1
    # If End Event
    if end_event
      # Ends Event Creation
      self.end_event(save_event)
    end
  end
  #--------------------------------------------------------------------------
  # * Saved Events { map_id => { event_id => name }, ... }
  #--------------------------------------------------------------------------
  @saved_events = {}
  #--------------------------------------------------------------------------
  # * Saved Events (Read)
  #--------------------------------------------------------------------------
  def self.saved_events(map_id = nil)
    # If Map ID not Defined
    if map_id.nil?
      # Return All Saved Event Data
      return @saved_events
    end
    # If Map Data Saved
    if @saved_events.has_key?(map_id)
      # Return Map Saved Event Data
      return @saved_events[map_id]
    end
    # Return Blank Array
    return []
  end
  #--------------------------------------------------------------------------
  # * Saved Events (Write)
  #--------------------------------------------------------------------------
  def self.saved_events=(saved_events)
    @saved_events = saved_events
  end
  #--------------------------------------------------------------------------
  # * Current Page
  #--------------------------------------------------------------------------
  def self.get_current_page
    return @event.pages.last
  end
end
 
#==============================================================================
# ** Game_Map
#==============================================================================
 
class Game_Map
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  alias_method :seph_eventspawner_gmap_init,  :initialize
  alias_method :seph_eventspawner_gmap_setup, :setup
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    # Original Initialization
    seph_eventspawner_gmap_init
    # Create Saved Events
    @saved_events = {}
  end
  #--------------------------------------------------------------------------
  # * Setup
  #--------------------------------------------------------------------------
  def setup(map_id)
    # Gets Saved Events
    saved_events = Event_Spawner.saved_events(@map_id)
    # If Not Empty
    unless saved_events.empty?
      # Create List (If none exist)
      @saved_events[@map_id] = {} unless @saved_events.has_key?(@map_id)
      # Saves spawned events
      saved_events.each do |event_id|
        @saved_events[@map_id][event_id] = @events[event_id]
      end
    end
    # Original Map Setup
    seph_eventspawner_gmap_setup(map_id)
    # If Map Has Saved Events
    if @saved_events.has_key?(@map_id)
      # Add saved events to events list
      @saved_events[@map_id].each do |event_id, event|
        @events[event_id] = event
      end
    end
  end
end
 
#==============================================================================
# ** Scene_Save
#==============================================================================
 
class Scene_Save
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  alias_method :seph_eventspawner_scnsave_wsd, :write_save_data
  #--------------------------------------------------------------------------
  # * Write Save Data
  #--------------------------------------------------------------------------
  def write_save_data(file)
    # Original Write Data
    seph_eventspawner_scnsave_wsd(file)
    # Saves Saved Event Data
    Marshal.dump(Event_Spawner.saved_events, file)
  end
end
 
#==============================================================================
# ** Scene_Load
#==============================================================================
 
class Scene_Load
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  alias_method :seph_eventspawner_scnload_rsd, :read_save_data
  #--------------------------------------------------------------------------
  # * Read Save Data
  #--------------------------------------------------------------------------
  def read_save_data(file)
    # Original Write Data
    seph_eventspawner_scnload_rsd(file)
    # Load Saved Event Data
    Event_Spawner.saved_events = Marshal.load(file)
  end
end