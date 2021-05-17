module Simpler
  class Controller

    def initialize(env)
      @request = Rack::Request.new(env)
      @response = Rack::Response.new
    end

    def make_response(action)
      [
        200,
        { 'Content-Type' => 'text/plain',
          'X-Simpler-Controller' => self.class.name,
          'X-Simpler-action' => action
        },
        ["Simpler framework in action!\n"]
      ]
    end

  end
end
