class UsersBooksController < ApplicationController
  before_action :set_users_book, only: [:show, :update, :destroy]

  # GET /users_books
  def index
    @users_books = UsersBooks.all

    render json: @users_books
  end

  # GET /users_books/1
  def show
    render json: @users_books
  end

  # POST /users_books
  def create
    @users_books = UsersBooks.new(users_book_params)

    if @users_books.save
      render json: @users_books, status: :created, location: @users_books
    else
      render json: @users_books.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users_books/1
  def update
    if @users_books.update(users_book_params)
      render json: @users_books
    else
      render json: @users_books.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users_books/1
  def destroy
    @users_books.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_book
      @users_books = UsersBooks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def users_book_params
      params.require(:users_book).permit(:user_id, :book_id)
    end
end
