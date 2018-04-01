require 'test_helper'

class BookDocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_doc = book_docs(:one)
  end

  test "should get index" do
    get book_docs_url
    assert_response :success
  end

  test "should get new" do
    get new_book_doc_url
    assert_response :success
  end

  test "should create book_doc" do
    assert_difference('BookDoc.count') do
      post book_docs_url, params: { book_doc: { book_name: @book_doc.book_name, pdf_doc: @book_doc.pdf_doc } }
    end

    assert_redirected_to book_doc_url(BookDoc.last)
  end

  test "should show book_doc" do
    get book_doc_url(@book_doc)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_doc_url(@book_doc)
    assert_response :success
  end

  test "should update book_doc" do
    patch book_doc_url(@book_doc), params: { book_doc: { book_name: @book_doc.book_name, pdf_doc: @book_doc.pdf_doc } }
    assert_redirected_to book_doc_url(@book_doc)
  end

  test "should destroy book_doc" do
    assert_difference('BookDoc.count', -1) do
      delete book_doc_url(@book_doc)
    end

    assert_redirected_to book_docs_url
  end
end
