class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
      info = {
        page: params[:page] || 1,
        per_page: 9
      }
      if !params[:filter]

      if params[:name]

      @books = Book.where("name ILIKE ?", "%#{params[:name]}%").limit(info[:per_page]).offset(info[:page] * 9)
      else
      @books = Book.where("author ILIKE ?", "%#{params[:author]}%").limit(info[:per_page]).offset(info[:page] * 1)
      end
    else
      id_array = params[:filter][:id].split(',')
      @books = Book.where(id: id_array)
    end
    render json: @books, params: info

  end

  # GET /books/1
  def show
    @books = Book.find(params[:id])
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:name, :author, :summary, :description, :image_url, :price, :amount)
    end
end
