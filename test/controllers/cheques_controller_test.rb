require 'test_helper'

class ChequesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cheque = cheques(:one)
  end

  test "should get index" do
    get cheques_url, as: :json
    assert_response :success
  end

  test "should create cheque" do
    assert_difference('Cheque.count') do
      post cheques_url, params: { cheque: { date: @cheque.date, name: @cheque.name, status: @cheque.status, value_cents: @cheque.value_cents } }, as: :json
    end

    assert_response 201
  end

  test "should show cheque" do
    get cheque_url(@cheque), as: :json
    assert_response :success
  end

  test "should update cheque" do
    patch cheque_url(@cheque), params: { cheque: { date: @cheque.date, name: @cheque.name, status: @cheque.status, value_cents: @cheque.value_cents } }, as: :json
    assert_response 200
  end

  test "should destroy cheque" do
    assert_difference('Cheque.count', -1) do
      delete cheque_url(@cheque), as: :json
    end

    assert_response 204
  end
end
