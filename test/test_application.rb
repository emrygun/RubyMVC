require_relative "test_helper"

class TestController < RubyMVC::RubyMVCController
  def index
    "Hello"
  end
end

class TestApp < RubyMVC::Application
  def get_controller_and_action(env)
    [TestController, "index"]
  end
end

class RubyMVCAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get("/test/index")
    assert last_response.ok?

    body = last_response.body
    assert body["Hello"]
  end
end
