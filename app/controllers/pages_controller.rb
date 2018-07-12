class PagesController < ApplicationController
  def home
    setting = Setting.first
    @track = setting.track
    @copy = setting.copy
    @shows = Show.upcoming.by_date.limit(5)
  end
end
