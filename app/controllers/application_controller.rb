class ApplicationController < ActionController::Base
   before_action :set_time_zone, if: :user_signed_in?

  include DeviseWhiteList # code in controllers/concerns/devise_white_list.rb file
  include PunditErrorMessage
  layout :layout_by_resource
  # before_action :set_mailer_host

  # set the current account
  def current_account
    nil
  end
  helper_method :current_account


  protected

    def layout_by_resource
      if user_signed_in?
        "mimity"
      elsif devise_controller?
        "devise"
      else
        "application"
      end
    end

  private
    # sets the time zone as indicate by the user's time zone
    def set_time_zone
      Time.zone = current_user.time_zone
    end



    # def set_mailer_host
    #   authenticate_user!
    #   subdomain = current_account ? "#{current_account.subdomain}." : ""
    #     ActionMailer::Base.default_url_options = "#{subdomain}lvh.me:3000"
    # end
end
