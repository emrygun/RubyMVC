# frozen_string_literal: true

require "rubyMVC/version"
require "rubyMVC/routing"
require "rubyMVC/util"
require "rubyMVC/controller"
require "rubyMVC/file_model"
require "exception"
require "array"

module RubyMVC

  class Application
    RubyMVC.load_project_paths
    RubyMVC.load_required_controllers

    def call(env)
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

end
