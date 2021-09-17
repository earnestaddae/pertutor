module Accounts
  class BaseController < ApplicationController
    set_current_tenant_by_subdomain(:account, :subdomain)
    before_action :authorize_user! #, :redirect_to_subdomain #, :set_mailer_host
    include PublicActivity::StoreController

    # finds the account by subdomain
    def current_account
      @current_account ||= Account.find_by!(subdomain: request.subdomain)
      @current_account
    end
    helper_method :current_account #helper method to current_account in all views



    private
      # ensures that the user belongs to the account
      def authorize_user!
        authenticate_user!
        unless current_account.owner == current_user || current_account.users.exists?(current_user.id)
          flash[:alert] = "You are not permitted to view that account's activities."
          redirect_to root_url(subdomain: nil)
        end
      end

      # finds account and redirect
      # def redirect_to_subdomain
      #   return unless user_signed_in? # 2.

      #   if request.subdomain.blank? # 3.
      #     if current_user.accounts.any?
      #       redirect_to root_url(subdomain: current_user.accounts.first.subdomain)
      #     end
      #   else # 4.
      #     unless current_user.accounts.pluck(:subdomain).include?(request.subdomain)
      #       redirect_to root_url(subdomain: current_user.accounts.first.subdomain)
      #     end
      #   end
      # end


      # def set_mailer_host
      #   subdomain = current_account ? "#{current_account.subdomain}." : ""
      #   ActionMailer::Base.default_url_options[:host] = "#{subdomain}lvh.me:3000"
      # end

      # ensures the only the owner or those in an account can access it's content
      def owner?
        current_account.owner == current_user
      end
      helper_method :owner?

      # # ensures the only the owner or those in an account can access it's content
      # def authorize_owner!
      #   return if owner?

      #   flash[:alert] = "Only an owner of an account can do that."
      #   redirect_to root_url(subdomain: current_account.subdomain)
      # end
  end
end
