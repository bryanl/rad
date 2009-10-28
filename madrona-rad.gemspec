# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{madrona-rad}
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["JD Barnhart", "Greg Borenstein"]
  s.date = %q{2009-10-28}
  s.default_executable = %q{rad}
  s.description = %q{Ruby Arduino Development: a framework for programming the Arduino physcial computing platform using Ruby}
  s.email = %q{jd@jdbarnhart.com}
  s.executables = ["rad"]
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "History.txt",
     "License.txt",
     "Manifest.txt",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/rad",
     "lib/examples/add_hysteresis.rb",
     "lib/examples/basic_blink.rb",
     "lib/examples/blink_m_address_assignment.rb",
     "lib/examples/blink_m_hello.rb",
     "lib/examples/blink_m_multi.rb",
     "lib/examples/blink_with_serial.rb",
     "lib/examples/configure_pa_lcd_boot.rb",
     "lib/examples/debounce_methods.rb",
     "lib/examples/external_variable_fu.rb",
     "lib/examples/external_variables.rb",
     "lib/examples/first_sound.rb",
     "lib/examples/frequency_generator.rb",
     "lib/examples/hello_array.rb",
     "lib/examples/hello_array2.rb",
     "lib/examples/hello_array_eeprom.rb",
     "lib/examples/hello_clock.rb",
     "lib/examples/hello_eeprom.rb",
     "lib/examples/hello_eeprom_lcdpa.rb",
     "lib/examples/hello_format_print.rb",
     "lib/examples/hello_lcd_charset.rb",
     "lib/examples/hello_maxbotix.rb",
     "lib/examples/hello_pa_lcd.rb",
     "lib/examples/hello_servos.rb",
     "lib/examples/hello_spectra_sound.rb",
     "lib/examples/hello_world.rb",
     "lib/examples/hello_xbee.rb",
     "lib/examples/hysteresis_duel.rb",
     "lib/examples/i2c_with_clock_chip.rb",
     "lib/examples/midi_beat_box.rb",
     "lib/examples/midi_scales.rb",
     "lib/examples/motor_knob.rb",
     "lib/examples/servo_buttons.rb",
     "lib/examples/servo_calibrate_continuous.rb",
     "lib/examples/servo_throttle.rb",
     "lib/examples/software_serial.rb",
     "lib/examples/sparkfun_lcd.rb",
     "lib/examples/spectra_soft_pot.rb",
     "lib/examples/times_method.rb",
     "lib/examples/toggle.rb",
     "lib/examples/twitter.rb",
     "lib/examples/two_wire.rb",
     "lib/libraries/AFSoftSerial/AFSoftSerial.cpp",
     "lib/libraries/AFSoftSerial/AFSoftSerial.h",
     "lib/libraries/AFSoftSerial/keywords.txt",
     "lib/libraries/AF_XPort/AF_XPort.cpp",
     "lib/libraries/AF_XPort/AF_XPort.h",
     "lib/libraries/DS1307/DS1307.cpp",
     "lib/libraries/DS1307/DS1307.h",
     "lib/libraries/DS1307/keywords.txt",
     "lib/libraries/FrequencyTimer2/FrequencyTimer2.cpp",
     "lib/libraries/FrequencyTimer2/FrequencyTimer2.h",
     "lib/libraries/FrequencyTimer2/keywords.txt",
     "lib/libraries/I2CEEPROM/I2CEEPROM.cpp",
     "lib/libraries/I2CEEPROM/I2CEEPROM.h",
     "lib/libraries/I2CEEPROM/keywords.txt",
     "lib/libraries/LoopTimer/LoopTimer.cpp",
     "lib/libraries/LoopTimer/LoopTimer.h",
     "lib/libraries/LoopTimer/keywords.txt",
     "lib/libraries/OneWire/OneWire.cpp",
     "lib/libraries/OneWire/OneWire.h",
     "lib/libraries/OneWire/keywords.txt",
     "lib/libraries/OneWire/readme.txt",
     "lib/libraries/SWSerLCDpa/SWSerLCDpa.cpp",
     "lib/libraries/SWSerLCDpa/SWSerLCDpa.h",
     "lib/libraries/SWSerLCDsf/SWSerLCDsf.cpp",
     "lib/libraries/SWSerLCDsf/SWSerLCDsf.h",
     "lib/libraries/Servo/Servo.cpp",
     "lib/libraries/Servo/Servo.h",
     "lib/libraries/Stepper/Stepper.cpp",
     "lib/libraries/Stepper/Stepper.h",
     "lib/libraries/Stepper/keywords.txt",
     "lib/libraries/Wire/Wire.cpp",
     "lib/libraries/Wire/Wire.h",
     "lib/libraries/Wire/keywords.txt",
     "lib/libraries/Wire/twi.h",
     "lib/libraries/Wire/utility/twi.c",
     "lib/libraries/Wire/utility/twi.h",
     "lib/plugins/basics.rb",
     "lib/plugins/bitwise_ops.rb",
     "lib/plugins/blink.rb",
     "lib/plugins/blink_m.rb",
     "lib/plugins/debounce.rb",
     "lib/plugins/debug_output_to_lcd.rb",
     "lib/plugins/hysteresis.rb",
     "lib/plugins/input_output_state.rb",
     "lib/plugins/lcd_padding.rb",
     "lib/plugins/mem_test.rb",
     "lib/plugins/midi.rb",
     "lib/plugins/parallax_ping.rb",
     "lib/plugins/servo_pulse.rb",
     "lib/plugins/servo_setup.rb",
     "lib/plugins/smoother.rb",
     "lib/plugins/spark_fun_serial_lcd.rb",
     "lib/plugins/spectra_symbol.rb",
     "lib/plugins/twitter_connect.rb",
     "lib/rad.rb",
     "lib/rad/README.rdoc",
     "lib/rad/antiquated_todo.txt",
     "lib/rad/arduino_plugin.rb",
     "lib/rad/arduino_sketch.rb",
     "lib/rad/darwin_installer.rb",
     "lib/rad/generators/makefile/makefile.erb",
     "lib/rad/generators/makefile/makefile.rb",
     "lib/rad/hardware_library.rb",
     "lib/rad/init.rb",
     "lib/rad/linux_installer.rb",
     "lib/rad/progressbar.rb",
     "lib/rad/rad_processor.rb",
     "lib/rad/rad_rewriter.rb",
     "lib/rad/rad_type_checker.rb",
     "lib/rad/sim/arduino_sketch.rb",
     "lib/rad/sketch_compiler.rb",
     "lib/rad/tasks/build_and_make.rake",
     "lib/rad/tasks/rad.rb",
     "lib/rad/todo.txt",
     "lib/rad/variable_processing.rb",
     "lib/rad/version.rb",
     "project_dev.rake",
     "rad.gemspec",
     "setup.rb",
     "spec/examples/hello_world.rb",
     "spec/examples/serial_motor.rb",
     "spec/models/arduino_sketch_spec.rb",
     "spec/models/sketch_compiler_spec.rb",
     "spec/models/spec_helper.rb",
     "spec/sim/hello_world_spec.rb",
     "spec/spec.opts",
     "test/fixture.rb",
     "test/hello_world_test/Makefile",
     "test/hello_world_test/hello_world.cpp",
     "test/test_array_processing.rb",
     "test/test_plugin_loading.rb",
     "test/test_translation_post_processing.rb",
     "test/test_variable_processing.rb"
  ]
  s.homepage = %q{http://github.com/madrona/madrona-rad}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{RAD: Ruby Arduino Development - 0.4.1 -- 1.9 Ready!}
  s.test_files = [
    "spec/examples/hello_world.rb",
     "spec/examples/serial_motor.rb",
     "spec/models/arduino_sketch_spec.rb",
     "spec/models/sketch_compiler_spec.rb",
     "spec/models/spec_helper.rb",
     "spec/sim/hello_world_spec.rb",
     "test/fixture.rb",
     "test/test_array_processing.rb",
     "test/test_plugin_loading.rb",
     "test/test_translation_post_processing.rb",
     "test/test_variable_processing.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby2c>, [">= 1.0.0.7"])
      s.add_runtime_dependency(%q<sexp_processor>, [">= 3.0.2"])
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<ruby2c>, [">= 1.0.0.7"])
      s.add_dependency(%q<sexp_processor>, [">= 3.0.2"])
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<ruby2c>, [">= 1.0.0.7"])
    s.add_dependency(%q<sexp_processor>, [">= 3.0.2"])
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end

