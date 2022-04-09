# frozen_string_literal: true

require "rulers/version"
require "rulers/routing"
require "rulers/util"
require "rulers/controller"
require "exception"
require "array"

module Rulers

  class Application
    Rulers.load_project_paths
    Rulers.load_required_controllers

    def call(env)
      klass, act = get_controller_and_action(env)
      begin
        controller = klass.new(env)
        text = controller.send(act)
        [200, {'Content-Type' => 'text/html'}, [text]]

      rescue Rulers::Exception::ControllerNotFoundException => e
        RulersController.exception(e)
      rescue Rulers::Exception::ActionNotFoundException => e
        controller.exception(e)
      rescue
        RulersController.exception()
      end

    end
  end

end
