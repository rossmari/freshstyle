class Admin::BaseController < ApplicationController

  layout 'administrator'

  before_action :authenticate_user!

  before_filter :check_role

  def check_role
    if user_signed_in?
      redirect_to root_path unless current_user.is_admin?
    end
  end

end
