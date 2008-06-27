require File.expand_path(File.dirname(__FILE__) + "/../init.rb")
require 'ruby_to_ansi_c'

C_VAR_TYPES = "unsigned|int|long|double|str|char"

namespace :make do
  
  desc "compile the sketch and then upload it to your Arduino board"
  task :upload => :compile do
    if Makefile.hardware_params['physical_reset']
      puts "Reset the Arduino and hit enter.\n==If your board doesn't need it, you can turn off this prompt in config/software.yml=="
      STDIN.gets.chomp
    end
    sh %{cd #{RAD_ROOT}/#{@sketch_name}; make upload}
  end
  
  desc "generate a makefile and use it to compile the .cpp"
  task :compile => [:clean_sketch_dir, "build:sketch"] do # should also depend on "build:sketch"
    Makefile.compose_for_sketch( @sketch_name )
    # not allowed? sh %{export PATH=#{Makefile.software_params[:arduino_root]}/tools/avr/bin:$PATH}
    sh %{cd #{RAD_ROOT}/#{@sketch_name}; make depend; make}
  end
  
  task :clean_sketch_dir => ["build:file_list", "build:sketch_dir"] do
    @sketch_name = @file_names.first.split(".").first
    
    FileList.new(Dir.entries("#{RAD_ROOT}/#{@sketch_name}")).exclude("#{@sketch_name}.cpp").exclude(/^\./).each do |f|
      sh %{rm #{RAD_ROOT}/#{@sketch_name}/#{f}}
    end
  end
end

namespace :build do

  desc "actually build the sketch"
  task :sketch => [:file_list, :sketch_dir, :plugin_setup, :setup] do
    klass = @file_names.first.split(".").first.split("_").collect{|c| c.capitalize}.join("")    
    eval ArduinoSketch.pre_process(File.read(@file_names.first))
    c_methods = []
    sketch_signatures = []
    $sketch_methods.each {|m| c_methods << RubyToAnsiC.translate(constantize(klass), m) }
    c_methods.each {|meth| sketch_signatures << "#{meth.scan(/^\w*\n.*\)/)[0].gsub("\n", " ")};" }
    @clean_c_methods = []
    c_methods.join("\n").each_with_index do |e,i|
      if e !~ /^\s*(#{C_VAR_TYPES})(\W{1,6}|\(unsigned\()(#{$external_var_identifiers.join("|")})/ || $external_var_identifiers.empty?
        # use the list of identifers the external_vars method of the sketch and remove the parens the ruby2c sometime adds to variables
        e.gsub(/((#{$external_var_identifiers.join("|")})\(\))/, '\2')  unless $external_var_identifiers.empty? 
      end
    end
    @setup.gsub!("// sketch signatures", "// sketch signatures\n#{ sketch_signatures.join("\n")}") unless sketch_signatures.empty?
    result = "#{@setup}\n#{c_methods.join}\n"
    name = @file_names.first.split(".").first
    File.open("#{name}/#{name}.cpp", "w"){|f| f << result}
  end

  # needs to write the library include and the method signatures
  desc "build setup function"
  task :setup do
    klass = @file_names.first.split(".").first.split("_").collect{|c| c.capitalize}.join("")
    eval "class #{klass} < ArduinoSketch; end;"
    
    @@as = ArduinoSketch.new
    
    delegate_methods = @@as.methods - Object.new.methods
    delegate_methods.reject!{|m| m == "compose_setup"}
        
    delegate_methods.each do |meth|
       constantize(klass).module_eval <<-CODE
       def self.#{meth}(*args)
       @@as.#{meth}(*args)
       end
       CODE
    end
    eval File.read(@file_names.first)
    @setup = @@as.compose_setup
  end
  
  desc "add plugin methods"
  task :plugin_setup do
    @plugin_names.each do |name|
       klass = name.split(".").first.split("_").collect{|c| c.capitalize}.join("")
       eval "class #{klass} < ArduinoPlugin; end;"
    
       @@ps = ArduinoPlugin.new
       plugin_delegate_methods = @@ps.methods - Object.new.methods
       plugin_delegate_methods.reject!{|m| m == "compose_setup"}
    
       plugin_delegate_methods.each do |meth|
         constantize(klass).module_eval <<-CODE
         def self.#{meth}(*args)
           @@ps.#{meth}(*args)
         end
         CODE
       end

      eval ArduinoPlugin.process(File.read("vendor/plugins/#{name}"))
      
    end
    @@no_plugins = ArduinoPlugin.new if @plugin_names.empty?
  end
  
  desc "setup target directory named after your sketch class"
  task :sketch_dir => [:file_list] do
    mkdir_p "#{@file_names.first.split(".").first}"
  end

  task :file_list do
    @file_names = []
    @plugin_names = []
    Dir.entries( File.expand_path(RAD_ROOT) ).each do |f|
      if (f =~ /\.rb$/)
        @file_names << f
      end
    end
    Dir.entries( File.expand_path("#{RAD_ROOT}/vendor/plugins/") ).each do |f|
      if (f =~ /\.rb$/)
        @plugin_names << f
      end
    end
  end
end

#yoinked from Rails
def constantize(camel_cased_word)
  unless /\A(?:::)?([A-Z]\w*(?:::[A-Z]\w*)*)\z/ =~ camel_cased_word
    raise NameError, "#{camel_cased_word.inspect} is not a valid constant name!"
  end

  Object.module_eval("::#{$1}", __FILE__, __LINE__)
end