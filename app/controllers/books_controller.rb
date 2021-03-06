class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index

      info = {
        page: params[:page] || 0,
        per_page: 9,
       total_pages: (Book.all.length.to_f / 9 ).round
      }
      @books = Book.all
    if !params[:filter]
      if params[:filterValue] || params[:currentSearch]
      @books =  @books.where( "name ILIKE ? OR author ILIKE ?","%#{params[:currentSearch]}%","%#{params[:currentSearch]}%").where("category ILIKE ?","%#{params[:filterValue]}")
      info[:total_pages] = ( @books.count / info[:per_page] ).round
      elsif params[:filterValue]
        @books = @books.where("category ILIKE ?","%#{params[:filterValue]}")
        info[:total_pages] = ( @books.count / info[:per_page] ).round
      else
        @books = @books.where( "name ILIKE ? OR author ILIKE ?","%#{params[:currentSearch]}%","%#{params[:currentSearch]}%")
        info[:total_pages] = ( @books.count / info[:per_page] ).round
      end
    else
      id_array = params[:filter][:id].split(',')
      @books = @books.where(id: id_array)
    end
    @books.map do |book|
      book.available_books
    end
    render json: @books.offset(info[:page].to_i * 9).limit(info[:per_page]), params: info, meta: info

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
      params.require(:book).permit(:name, :author, :summary, :description, :image_url, :price, :amount, :page, :filterValue, :currentSearch, :category, :available)
    end
end
