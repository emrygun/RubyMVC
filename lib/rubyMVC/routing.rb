module RubyMVC
  class Application

    def get_controller_and_action(env)
      _, cont, act, after = env["PATH_INFO"].split('/', 4)

      controller_klass = get_controller(cont)
      action_method = get_action(controller_klass, act)

      [controller_klass, action_method]
    end

    def get_controller(controller_path)
      controller = controller_path.to_s.capitalize + "Controller"
      RubyMVC.resolve_const(controller)
    end

    def get_action(controller_klass, action_path)
      if controller_klass.method_defined?(action_path)
        action_path
      else
        ""
      end
    end

  end
end
