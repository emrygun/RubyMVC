module Rulers
  class RulersController
    @@bad_path_message = "\n<h3>\n bad path info \n</h3>\n"

    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def render(view_name, locals = {})
      filename = File.join Rulers.@@project_path_view, "#{view_name}.html.erb"
      template = File.read filename
      eruby = Erubis::Eruby.new(template)
      eruby.result locals.merge(:env => env)
    end

    def exception
      [404, {'Content-Type' => 'text/html'}, [@@bad_path_message]]
    end

    def self.exception
      [404, {'Content-Type' => 'text/html'}, [@@bad_path_message]]
    end
  end
end
