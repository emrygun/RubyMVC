require_relative "test_helper"

class TestApp < Rulers::Application
end

class TestController
  def test
    "Hello"
  end
end

class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "test/test"

    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end

end
