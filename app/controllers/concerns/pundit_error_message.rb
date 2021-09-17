module PunditErrorMessage
  extend ActiveSupport::Concern
  include Pundit

  included do
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    after_action :verify_authorized, unless: :devise_controller?
  end

  private

  def user_not_authorized
    flash[:alert] = "Permission to access is denied! You are not authorize"
    redirect_to(request.referrer || root_path)
  end

end
