class PagesController < ApplicationController
  # GET /
  def home
    setting = Setting.first
    @track = setting.track
    @copy = setting.copy
    @image = setting.home_image
    @video = setting.home_video
    @shows = Show.upcoming.by_date.limit(5)
  end

  # GET /calendar
  def calendar
  end

  # GET /shows.json
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

  # GET /contact
  def contact
    @contact_form = ContactForm.new
  end

  # POST /contact
  def contact_deliver
    @contact_form = ContactForm.new(contact_params)

    if @contact_form.deliver
      redirect_to contact_path, notice: 'Contact message has been sent!'
    else
      flash[:alert] = "Errors! #{@contact_form.errors.full_messages.join(', ')}"
      render 'contact'
    end
  end

  private

  def contact_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end
