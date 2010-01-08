class DarwinInstaller

  CURRENT_VERSION="0017"

  def self.install!
    puts "Downloading arduino-0017 for Mac from Arduino.cc"
    File.open("/Applications/arduino-#{CURRENT_VERSION}.zip", "w") do |file|
      pbar = nil
      file << open("http://arduino.googlecode.com/files/arduino-#{CURRENT_VERSION}-mac.zip",
      :content_length_proc => lambda {|t|
        if t && 0 < t
          pbar = ProgressBar.new(" Progress", t)
          pbar.file_transfer_mode
        end
      },
      :progress_proc => lambda {|s|
        pbar.set s if pbar
      }).read
      pbar.finish
    end
    puts "Unzipping..."
    `cd /Applications; unzip arduino-#{CURRENT_VERSION}.zip`
    `rm /Applications/arduino-#{CURRENT_VERSION}.zip`
    puts "installed Arduino here: /Applications/arduino-#{CURRENT_VERSION}"
  end
end
