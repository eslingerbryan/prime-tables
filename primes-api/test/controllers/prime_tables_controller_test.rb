require "test_helper"

class PrimeTablesControllerTest < ActionDispatch::IntegrationTest
  test "can fetch prime multiplcation table for an integer >= 1" do
    get "/prime_tables/3"

    expected_json = { "data" => [
      [nil, 2, 3, 5],
      [2, 4, 6, 10],
      [3, 6, 9, 15],
      [5, 10, 15, 25]
    ]}
    
    assert_response :success
    response_json = JSON.parse(response.body)
    assert_equal expected_json, response_json
  end
end
