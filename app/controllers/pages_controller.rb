class PagesController < ApplicationController
  def home
    setting = Setting.first
    @track = setting.track
    @copy = setting.copy
    @image = setting.home_image
    @video = setting.home_video
    @shows = Show.upcoming.by_date.limit(5)
  end
end
