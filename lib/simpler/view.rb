module Simpler
  class View

    VIEW_BASE_PATH = 'app/views'.freeze

    def initialize(env)
      @env = env
    end

    def render
      File.read(template_path)
    end

    private

    def controller
      @env['simpler.controller']
    end

    def action
      @env['simpler.action']
    end

    def template_path
      path = [controller.name, action].join('/')

      Simpler.root.join(VIEW_BASE_PATH,"#{path}.html")
    end

  end
end
