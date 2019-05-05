class DashboardController < ApplicationController
  def index
    @flights = Flight.all
  end
end
