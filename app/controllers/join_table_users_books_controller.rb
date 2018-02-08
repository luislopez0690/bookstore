class JoinTableUsersBooksController < ApplicationController
  before_action :set_join_table_users_book, only: [:show, :update, :destroy]

  # GET /join_table_users_books
  def index
    @join_table_users_books = JoinTableUsersBook.all

    render json: @join_table_users_books
  end

  # GET /join_table_users_books/1
  def show
    render json: @join_table_users_book
  end

  # POST /join_table_users_books
  def create
    @join_table_users_book = JoinTableUsersBook.new(join_table_users_book_params)

    if @join_table_users_book.save
      render json: @join_table_users_book, status: :created, location: @join_table_users_book
    else
      render json: @join_table_users_book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /join_table_users_books/1
  def update
    if @join_table_users_book.update(join_table_users_book_params)
      render json: @join_table_users_book
    else
      render json: @join_table_users_book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /join_table_users_books/1
  def destroy
    @join_table_users_book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_join_table_users_book
      @join_table_users_book = JoinTableUsersBook.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def join_table_users_book_params
      params.require(:join_table_users_book).permit(:user_id, :book_id, :amount)
    end
end
