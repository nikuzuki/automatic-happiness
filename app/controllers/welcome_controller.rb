class WelcomeController < ApplicationController
  def index
    @events = Event.where('start_time > ?', Time.zone.now).oder(:start_time)
  end
end
