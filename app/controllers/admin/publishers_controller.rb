module Admin
  class PublishersController < AdminBaseController
    before_action :find_publisher, only: %i(edit update destroy)

    def index
      @q = Publisher.ransack(params[:q])
      @publishers = @q.result.page(params[:page]).per(Settings.items_per_page)
    end

    def new
      @publisher = Publisher.new
    end

    def create
      @publisher = Publisher.new publisher_params
      if @publisher.save
        flash[:success] = t "create_success"
        redirect_to admin_publishers_url
      else
        flash[:info] = t "create_failure"
        render :new
      end
    end

    def edit; end

    def update
      if @publisher.update publisher_params
        flash[:success] = t "update_success"
        redirect_to admin_publishers_url
      else
        flash[:info] = t "update_failure"
        render :edit
      end
    end

    def destroy
      if @publisher.destroy
        flash[:success] = t "delete_success"
      else
        flash[:danger] = t "delete_failure"
      end
      redirect_to admin_publishers_url
    end

    private
      def publisher_params
        params.require(:publisher).permit Publisher::PUBLISHER_PARAMS
      end

      def find_publisher
        return if @publisher = Publisher.find_by(id:params[:id])
        render "layouts/notfound"
      end
  end
end
