require_relative 'router/route'

module Simpler
  class Router

    def initialize
      @routes = []
    end

    def get(path, route_point)
      add_route(:get, path, route_point)
    end

    def post(path, route_point)
      add_route(:post, path, route_point)
    end

    def route_for(env)
      method = env['REQUEST_METHOD'].downcase.to_sym
      path = env['PATH_INFO']

      @routes.find { |route| route.match?(method, path) }
    end

    private

    def add_route(method, path, route_poin)
      route_poin = route_poin.split('#')
      controller = controller_from_string(route_poin[0])
      action = route_poin[1]
      route = Route.new(method, path, controller, action)

      @routes.push(route)
    end

    private

    def controller_from_string(controller_name)
      Object.const_get("#{controller_name.capitalize}Controller")
    end

  end
end
