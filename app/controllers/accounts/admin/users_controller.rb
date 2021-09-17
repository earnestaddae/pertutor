module Accounts
  class Admin::UsersController < Admin::ApplicationController
    before_action :set_user, except: [:new, :create, :index]
    # skip_after_action :verify_authorized

    def index
      @q = current_account.users.ransack(params[:q])
      @users = @q.result(distinct: true)
      @user = current_account.users.build
      # @users = current_account.users
    end

    def new
      @user = User.new
    end

    def create
      @user = User.unscoped.new(user_params.except("role"))
      @user.password = "passme123"

      if @user.valid? && @user.invite!(current_user)
        current_account.users << @user
        @user.add_role :student, current_account if @user.roles.blank?
        flash[:notice] = "#{@user.email} has been invited."
        redirect_to root_url(subdomain: current_account.subdomain)
      else
        flash.now[:alert] = "Sorry, Invitation not sent!"
        render :new
      end
    end

    def edit
      set_choices
    end

    def update
      if @user.update(user_params.except("roles"))
        # @user.remove_role(@user.roles.any.first, current_account)
        # @user.roles.clear
        @user.add_role user_params[:roles].to_sym, current_account
        # @user.remove_role(:owner, current_account) if !@user.has_role?(:owner, current_account)
        flash[:notice] = "User successfully updated"
        redirect_to admin_users_path
      else
        flash.now[:alert] = "Sorry, user not updated"
        render :edit
      end
    end

    def destroy
      current_account.users.delete(@user)
      # current_account.invitations.where(username: @user.username).first.delete
      flash[:notice] = "#{@user.email} has been removed from this account."
      redirect_to admin_users_path
    end


    private

      def user_params
        params.require(:user).permit(:username, :email, :roles)
      end

      def set_user
        @user = User.friendly.find(params[:id])
      end

      def set_choices
        @choices = [["Owner", 'owner'],["Tutor", 'tutor'], ["Student", "student"]]
      end

  end
end
