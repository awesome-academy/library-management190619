module Admin
  class AuthorsController < AdminBaseController
    before_action :find_author, only: %i(edit update destroy)

    def index
      @q = Author.ransack(params[:q])
      @authors = @q.result.page(params[:page]).per(Settings.items_per_page)
    end

    def new
      @author = Author.new
      @genders = Author.genders
    end

    def create
      @author = Author.new author_params
      if @author.save
        flash[:success] = t "create_success"
        redirect_to admin_authors_url
      else
        flash[:info] = t "create_failure"
        render :new
      end
    end

    def edit; end

    def update
      if @author.update author_params
        flash[:success] = t "update_success"
        redirect_to admin_authors_url
      else
        flash[:info] = t "update_failure"
        render :edit
      end
    end

    def destroy
      if @author.destroy
        flash[:success] = t "delete_success"
      else
        flash[:danger] = t "delete_failure"
      end
      redirect_to admin_authors_url
    end

    private
      def author_params
        params.require(:author).permit Author::AUTHOR_PARAMS
      end

      def find_author
        return if @author = Author.find_by(id:params[:id])
        render "layouts/notfound"
      end
  end
end
