module RubyMVC
  module Exception
    BAD_PATH_MSG        = "\n<h3>\n bad Path info \n</h3>\n".freeze
    BAD_CONTROLLER_MSG  = "\n<h3>\n bad Controller info \n</h3>\n".freeze
    BAD_ACTION_MSG      = "\n<h3>\n bad Action info \n</h3>\n".freeze

    class RubyMVCException < StandardError
      def initialize(msg = nil)
        super("Unknown #{self.class} exception.") if msg.nil?
        super("Unknown #{msg} exception.") unless msg.nil?
      end
    end

    class ControllerNotFoundException < RubyMVCException
      def initialize(controller_name = nil)
        super("#{controller_name.to_s.capitalize} not found.")
      end
    end

    class ActionNotFoundException < RubyMVCException
      def initialize(action_name = nil)
        super("#{action_name.to_s} not found.")
      end
    end

  end
end
