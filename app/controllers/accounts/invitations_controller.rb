module Accounts
  class InvitationsController < Accounts::BaseController
    skip_before_action :authorize_user!, only: [:accept, :accepted]
    skip_after_action :verify_authorized

    def accept
      store_location_for(:user, request.fullpath)
      @invitation = Invitation.find_by!(token: params[:id])
    end

    def accepted
      @invitation = Invitation.find_by!(token: params[:id])

      if user_signed_in?
        user = current_user
      else
        user = User.new(user_params)
      end

      if user.save
        sign_in(user)
        user.add_role :student, current_account
        user.save
        current_account.users << user
        flash[:notice] = "You have joined the #{current_account.name} account."
        redirect_to root_url(subdomain: current_account.subdomain)
      else
        flash.now[:alert] = "Sorry, check your password"
        render :accept
      end
    end



    private
      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end
  end
end
