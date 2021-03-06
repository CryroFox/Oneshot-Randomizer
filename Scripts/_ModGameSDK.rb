class Discord
  require "ruby_discord_game_sdk"
  @id = 817684934256885781
  
  DiscordGameSDK::init(817684934256885781, DiscordGameSDK::CreateFlags::Default)
  attr_accessor :Timestamp 
  attr_accessor :LargeImage
  attr_accessor :LargeImageText
  attr_accessor :SmallImage
  attr_accessor :SmallImageText
  attr_accessor :Details   
  attr_accessor :State     
  attr_accessor :PartySize
  attr_accessor :id
  
  def initialize
    timestampstarttimelmaoo = Time.now.to_i
    @Timestamp      = timestampstarttimelmaoo
    @LargeImage     = 'bookbot'
    @LargeImageText = ''
    @SmallImage     = ''
    @SmallImageText = ''
    @Details        = ''
    @State          = ''
    @PartySize      = 0
  end

  def UpdateRichPresence
     activity = DiscordGameSDK::Activity.new
      #! Set the timestamp to the time in which the game was booted
          activity.timestamp_start         = @Timestamp 
        # ? Icons ? #   
          activity.assets_large_image         = @LargeImage
          activity.assets_small_image         = @SmallImage
        # ? Text ? #        
          activity.assets_large_text          = @LargeImageText
          activity.assets_small_text          = @SmallImageText
          activity.details                    = @Details
          activity.state                      = @State
          activity.party_max_size             = 4
          activity.party_current_size         = @PartySize
        # ? State ? #
          activity.type = DiscordGameSDK::ActivityType::Playing

      # * Update the Activity
        DiscordGameSDK::ActivityManager.update_activity(activity) do |result|
          if result != DiscordGameSDK::Result::Ok
            puts "Set activity failed: " + result.to_s
      end
    end
  end
end