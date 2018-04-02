require 'test_helper'

class JoinTableUsersBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @join_table_users_book = join_table_users_books(:one)
  end

  test "should get index" do
    get join_table_users_books_url, as: :json
    assert_response :success
  end

  test "should create join_table_users_book" do
    assert_difference('JoinTableUsersBook.count') do
      post join_table_users_books_url, params: { join_table_users_book: { amount: @join_table_users_book.amount, book_id: @join_table_users_book.book_id, user_id: @join_table_users_book.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show join_table_users_book" do
    get join_table_users_book_url(@join_table_users_book), as: :json
    assert_response :success
  end

  test "should update join_table_users_book" do
    patch join_table_users_book_url(@join_table_users_book), params: { join_table_users_book: { amount: @join_table_users_book.amount, book_id: @join_table_users_book.book_id, user_id: @join_table_users_book.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy join_table_users_book" do
    assert_difference('JoinTableUsersBook.count', -1) do
      delete join_table_users_book_url(@join_table_users_book), as: :json
    end

    assert_response 204
  end
end
