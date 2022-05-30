# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    params[:search] = {} unless params[:search]
    @flights = Flight.search(params[:search])
    @airports = Airport.all
  end
end
