module Accounts
  class UsersController < Accounts::BaseController
    skip_before_action :authorize_user!, only: [:new, :create]
    skip_after_action :verify_authorized
    def index
      @users = current_account.users
    end

    def new
      @user = current_account.users.build
    end


    def create
      @user = current_account.users.build(user_params)
      if @user.save #&& verify_recaptcha(model: @user)
        sign_in(@user)
        @user.add_role :student, current_account
        current_account.users << @user
        flash[:notice] = "You've successfully joined #{current_account.name}"
        redirect_to root_url(subdomain: current_account.subdomain)
      else
        flash.now[:alert] = "Sorry, joining #{current_account.name} isn't successful"
        render :new
      end
    end



    private

      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end
  end
end
