class PagesController < ApplicationController
  def home
    @shows = Show.upcoming.by_date.limit(5)
  end
end
