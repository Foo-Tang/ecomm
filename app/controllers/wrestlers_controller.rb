class WrestlersController < ApplicationController
  def index
    @wrestlers = Wrestler.all
  end

  def show
  end
end
