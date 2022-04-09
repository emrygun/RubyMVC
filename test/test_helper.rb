require "rack/test"
require "test/unit"

# Always use local RubyMVC first
gem_dir = File.join(File.dirname(__FILE__), "..")
lib_dir = File.join(gem_dir, "/lib")

$:.unshift File.expand_path(lib_dir)

require "rulers"
