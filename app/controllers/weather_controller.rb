class WeatherController < ApplicationController
  def citis
    @citis = "524901,703448,6058560,1819729,4321929"
    @lookup = Weather.call(@citis)
    @lookupj = Weather.callj(@citis)
    @lookupc = Weather.callc(@citis)
  end
end

