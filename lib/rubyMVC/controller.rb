require "haml"

module RubyMVC
  class RubyMVCController

    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def render(view_name, locals = {}, view_dir = RubyMVC::PROJECT_PATH_VIEW)
      filename = File.join view_dir, "#{view_name}.haml"
      template = File.read filename
      Haml::Engine.new(template).render Object.new, locals.merge(:env => env)
    end

  end
end
