require 'test_helper'

class DataselsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get datasels_index_url
    assert_response :success
  end

  test "should get show" do
    get datasels_show_url
    assert_response :success
  end

end
