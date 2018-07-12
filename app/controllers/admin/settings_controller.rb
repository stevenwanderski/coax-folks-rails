class Admin::SettingsController < AdminController
  def index
    @setting = Setting.first
  end

  def update
    @setting = Setting.first

    if @setting.update(setting_params)
      redirect_to admin_settings_path, notice: 'Settings have been updated 🤗'
    else
      render 'index', alert: "Errors! #{@show.errors.full_messages}"
    end
  end

  private

  def setting_params
    params.require(:setting).permit!
  end
end
