module Accounts
  class ForumsController < Accounts::BaseController
    before_action :set_forum, except: [:new, :index, :create]

    def index
      @forums = current_account.forums.all.reverse_order
      authorize @forums, :index?
    end

    def new
      @forum = current_account.forums.build
      authorize @forum, :new?
    end

    def create
      @forum = current_account.forums.build(forum_params)
      authorize @forum, :create?
      @forum.user = current_user
      if @forum.save
        flash[:notice] = "Discussion added successfully to forum"
        redirect_to forums_url
      else
        flash.now[:alert] = "Discussion not added to forum"
        render :new
      end
    end

    def show
      authorize @forum, :show?
    end



    private

      def forum_params
        params.require(:forum).permit(:title, :body, :summary)
      end

      def set_forum
        @forum = Forum.friendly.find(params[:id])
      end
  end
end
