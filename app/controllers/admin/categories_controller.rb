module Admin
  class CategoriesController < AdminBaseController
    include CategoriesHelper
    before_action :find_category, only: %i(edit update destroy)

    def index
      @categories = Category.sub_category params[:category_id]
    end

    def new
      @category = Category.new
      return if @parent_category = Category.find_by(id: params[:category_id])
      render "layouts/notfound"
    end

    def create
      @category = Category.new category_params
      if @category.save
        flash[:success] = t "create_success"
        redirect_to admin_categories_url
      else
        flash[:info] = t "create_failure"
        render :new
      end
    end

    def edit; end

    def update
      if @category.update category_params
        flash[:success] = t "update_success"
        redirect_to admin_categories_url
      else
        flash[:info] = t "update_failure"
        render :edit
      end
    end

    def destroy
      if @category.destroy
        flash[:success] = t "delete_success"
      else
        flash[:danger] = t "delete_failure"
      end
      redirect_to admin_categories_url
    end

    private
      def category_params
        params.require(:category).permit Category::CATEGORY_PARAMS
      end

      def find_category
        return if @category = Category.find_by id:params[:id]
        render "layouts/notfound"
      end
  end
end
