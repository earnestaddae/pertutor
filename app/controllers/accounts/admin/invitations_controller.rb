module Accounts
  class Admin::InvitationsController < Admin::ApplicationController
    # skip_after_action :verify_authorized
    def new
      @invitation = Invitation.new
    end

    def create
      @invitation = current_account.invitations.new(invitation_params)
      if @invitation.save
        InvitationMailer.invite(@invitation).deliver
        # Invitations::InvitationMailerJob.perform_later(@invitation).provider_job_id
        # Invitations::InvitationMailerJob.perform_now(@invitation)
        flash[:notice] = "#{@invitation.email} has been invited."
        redirect_to root_url
      else
        flash.now[:alert] = "Invitation not sent!"
        render :new
      end
    end


    private

      def invitation_params
        params.require(:invitation).permit(:username, :email)
      end
  end
end
