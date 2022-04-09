require_relative '../test_helper'

class HamlTestController < RubyMVC::RubyMVCController
  TEST_VIEW_PATH = File.expand_path(File.join(__dir__, "view")).freeze

  def index
    test_parameters = {
      test_parameter_one:   "test1",
      test_parameter_two:   "test2",
      test_parameter_three: "test3",
    }
    render "test", test_parameters.merge({:env => env}), TEST_VIEW_PATH
  end
end

class HamlTestApp < RubyMVC::Application
  def get_controller_and_action(env)
    [HamlTestController, "index"]
  end
end

class HamlTest < Test::Unit::TestCase
  include Rack::Test::Methods

  TEST_VIEW = "<p>This is a test haml file</p>\n<p>test1</p>\n<div class='test'>test2</div>\n<div class='test' id='test_id'>test3</div>\n".freeze

  def app
    HamlTestApp.new
  end

  def test_request
    get "/test/index"
    assert last_response.ok?
    assert last_response.body == TEST_VIEW
  end

end
