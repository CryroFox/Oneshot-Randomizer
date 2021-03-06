#==============================================================================
# ** Main
#------------------------------------------------------------------------------
#  After defining each class, actual processing begins here.
#==============================================================================

at_exit do
  Wallpaper.reset
  save unless $game_switches[99] || ($game_system.map_interpreter.running? || !$scene.is_a?(Scene_Map))
end

SCRIPTS_DIR = "Scripts/"
$randomizer = Randomizer.new


def reload_all_scripts
  IO.foreach(SCRIPTS_DIR + "_scripts.txt") do |name|
    name.strip!
    next if name.empty? || name.start_with?("#") || name == "Main" || name == "_ModGameSDK"
    Kernel::load SCRIPTS_DIR + name + ".rb"
  end
  $randomizer.loadconfig
  $randomizer.newsplash
  $randomizer.init
end

def load_plugins
  Dir["#{File.dirname(__FILE__)}/__Randomizer/Plugins/*.rb"].each {|file| Kernel::load file }
end

load_plugins
reload_all_scripts
begin
  $console = Graphics.fullscreen
  Graphics.frame_rate = 60
  Font.default_size = 20

  # Load persistent data
  Persistent.load

  # Prepare for transition
  Graphics.freeze
  $demo = false
  $debug = true
  $GDC = false
  # Make scene object (title screen)
  $scene = Scene_Title.new
  Oneshot.allow_exit false
  Oneshot.exiting false
  $randomizer.loadconfig
  $randomizer.newsplash
  $randomizer.init
  
  

#  x = Oneshot.textinput("Foo Bar")
#  print("#{x}")

  # Call main method as long as $scene is effective
  while $scene != nil
    $scene.main
  end
  # Fade out
  Oneshot.exiting true
  Graphics.transition(20)

  if Journal.active?
    Journal.set ''
  end

  Oneshot.allow_exit true
rescue Errno::ENOENT
  # Supplement Errno::ENOENT exception
  # If unable to open file, display message and end
  filename = $!.message.sub("No such file or directory - ", "")
  print("Unable to find file #{filename}.")
end
