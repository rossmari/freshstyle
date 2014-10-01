class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!, :check_role

  def check_role
    if user_signed_in?
      redirect_to root_path unless current_user.is_admin?
    end
  end
end
