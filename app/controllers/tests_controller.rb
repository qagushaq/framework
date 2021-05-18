class TestsController < Simpler::Controller

  def index
    render 'tests/list'
    @time = Time.now
  end

  def create

  end

end
