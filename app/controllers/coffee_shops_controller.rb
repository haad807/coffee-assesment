class CoffeeShopsController < ApplicationController

  def index
  	@items = Item.available
  end
end
