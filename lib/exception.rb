module Rulers
  module Exception
    @@bad_path_message        = "\n<h3>\n bad Path info \n</h3>\n"
    @@bad_controller_message  = "\n<h3>\n bad Controller info \n</h3>\n"
    @@bad_action_message      = "\n<h3>\n bad Action info \n</h3>\n"

    class RulersException < StandardError
      def initialize(msg = nil)
        super("Unknown #{self.class} exception.") if msg.nil?
        super("Unknown #{msg} exception.") unless msg.nil?
      end
    end

    class ControllerNotFoundException < RulersException
      def initialize(controller_name = nil)
        super("#{controller_name.to_s.capitalize} not found.")
      end
    end

    class ActionNotFoundException < RulersException
      def initialize(action_name = nil)
        super("#{action_name.to_s} not found.")
      end
    end

  end
end
