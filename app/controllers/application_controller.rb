class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: 'You are not authorized to perform this action.') }
      # format.turbo_stream { turbo_stream.replace "flash", partial: "layouts/flash" }
    end
  end
end
