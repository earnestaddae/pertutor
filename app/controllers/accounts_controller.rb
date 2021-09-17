class AccountsController < ApplicationController

  def new
    @account = Account.new
    @account.build_owner
    authorize @account, :new?
  end

  def create
    if user_signed_in?
      @account = Account.new(account_params)
      @account.owner = current_user
      current_user.add_role :owner, @account
      current_user.save
    else
      @account = Account.new(account_params)
    end
    authorize @account, :create?

    if @account.save
      sign_in(@account.owner)
      @account.owner = current_user
      current_user.add_role :owner, @account
      current_user.save
      WelcomeEmailMailer.welcome_email(current_user, @account).deliver
      # Welcome::WelcomeEmailMailerJob.perform_later(current_user, @account).provider_job_id
      # Welcome::WelcomeEmailMailerJob.perform_now(current_user, @account) #.provider_job_id
      flash[:notice] = "Your channel has been created successfully! 😇"
      redirect_to root_url(subdomain: @account.subdomain)
    else
      flash.now[:alert] = "Sorry, your channel wasn't created."
      render :new
    end
  end



  private

    def account_params
      params.require(:account).permit(:name, :subdomain,
        { owner_attributes:
          [:username, :email, :password, :password_confirmation]
        }
      )
    end
end
