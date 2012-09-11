require 'test_helper'

class WordsPagesControllerTest < ActionController::TestCase
  setup do
    @words_page = words_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:words_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create words_page" do
    assert_difference('WordsPage.count') do
      post :create, words_page: { page_id: @words_page.page_id, word_id: @words_page.word_id }
    end

    assert_redirected_to words_page_path(assigns(:words_page))
  end

  test "should show words_page" do
    get :show, id: @words_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @words_page
    assert_response :success
  end

  test "should update words_page" do
    put :update, id: @words_page, words_page: { page_id: @words_page.page_id, word_id: @words_page.word_id }
    assert_redirected_to words_page_path(assigns(:words_page))
  end

  test "should destroy words_page" do
    assert_difference('WordsPage.count', -1) do
      delete :destroy, id: @words_page
    end

    assert_redirected_to words_pages_path
  end
end
