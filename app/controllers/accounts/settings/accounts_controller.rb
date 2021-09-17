module Accounts
  class Settings::AccountsController < Admin::ApplicationController
    def show
      @account = current_account
    end

    def update
      @account = current_account
      # @account.account_logo.attach(params[:account][:account_logo])
      # @account.background_image.attach(params[:account][:background_image])
      respond_to do |format|
        if @account.update(account_params)
          format.html { redirect_to root_url(subdomain: @account.subdomain), notice: 'Account successfully updated.' }
          format.json { render :show, status: :ok, location: @account }
        else
          format.html { render :show }
          format.json { render json: @account.errors, status: :unprocessable_entity }
        end
      end
    end


    private

    def account_params
      params.require(:account).permit(:name, :subdomain, :bio, :tagline, :home_color, :footer_color, :address, :phone_number, :city, :country, :background_image, :account_logo, :sidebar_header_color, :sidebar_body_color)
    end
  end
end
