class PagesController < ApplicationController
  def home
    setting = Setting.first
    @track = setting.track
    @copy = setting.copy
    @image = setting.home_image
    @video = setting.home_video
    @shows = Show.upcoming.by_date.limit(5)
  end

  def calendar
  end

  def shows
    shows = Show.where('date >= ? AND date <= ?', params[:start], params[:end])
    shows_json = shows.map do |show|
      {
        title: "<div class=\"cal-band-title\">#{show.band_name}<\/div>#{show.venue_name} - #{show.time}",
        start: show.date
      }
    end
    render json: shows_json
  end
end
