module Admin
  class BooksController < AdminBaseController
    before_action :find_book, only: %i(edit update destroy)

    def index
      @q = Book.ransack(params[:q])
      @books = @q.result.page(params[:page]).per(Settings.items_per_page)
    end

    def new
      @book = Book.new
      @authors = Author.pluck :id, :name
      @publishers = Publisher.pluck :id, :name
      @book.build_author
      @book.build_publisher
    end

    def create
      @book = Book.new book_params
      if @book.save
        flash[:success] = t "create_success"
        redirect_to admin_books_url
      else
        flash[:info] = t "create_failure"
        render :new
      end
    end

    def edit; end

    def update
      if @book.update book_params
        flash[:success] = t "update_success"
        redirect_to admin_books_url
      else
        flash[:info] = t "update_failure"
        render :edit
      end
    end

    def destroy
      if @book.destroy
        flash[:success] = t "delete_success"
      else
        flash[:danger] = t "delete_failure"
      end
      redirect_to admin_books_url
    end

    private
      def book_params
        params.require(:book).permit Book::BOOK_PARAMS, authors_attributes: [:id], publishers_attributes: [:id]
      end

      def find_book
        return if @book = Book.find_by(id:params[:id])
        render "layouts/notfound"
      end
  end
end
