class Admin::ShowsController < AdminController
  def index
    @shows = Show.order(date: :desc).page(params[:page]).per(50)
  end

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      redirect_to admin_shows_path, notice: 'Good job! Show has been added 🤗'
    else
      render 'new', alert: "Errors! #{@show.errors.full_messages}"
    end
  end

  def edit
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])
    if @show.update(show_params)
      redirect_to admin_shows_path, notice: 'Show has been updated 🤗'
    else
      render 'new', alert: "Errors! #{@show.errors.full_messages}"
    end
  end

  def destroy
    @show = Show.find(params[:id])
    @show.destroy!
    redirect_to admin_shows_path, notice: 'Show has been deleted 🗑'
  end

  private

  def show_params
    params.require(:show).permit!
  end
end
