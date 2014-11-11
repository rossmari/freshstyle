class Admin::SettingsController < Admin::BaseController

  def index
  end

  def change
    Setting.meta_tags = params[:settings][:meta_tags]
    redirect_to :back, notice: 'Настройки успешно сохранены.'
  end
end
