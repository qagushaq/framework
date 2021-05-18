module Simpler
  class View

    def initialize(env)
      @env = env
    end

    def render
      File.read(template_path)
    end

    private

    def template_path
      Simpler.root.join('app/views/index.html')
    end
  end
end
