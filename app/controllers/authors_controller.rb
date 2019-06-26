class AuthorsController < ApplicationController
  before_action :find_author, only: %i(show)

  def index
    @authors = Author.first(Settings.number_of_books_to_show)
  end

  def show; end

  private
    def find_author
      return if @author = Author.find_by(id: params[:id])
      render "layout/notfound"
    end
end
