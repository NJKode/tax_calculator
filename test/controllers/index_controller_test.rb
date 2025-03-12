require "test_helper"

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get index_index_url
    assert_response :success
  end

  test "should get calculate" do
    get index_calculate_url
    assert_response :success
  end

  # These tests arent great. Ideally the api would return JSON.
  # Due to time constraints, the api instead returns the partial which is rendered via turbo stream
  # As such, just do a regex match to see if the values are correct.
  # Definitely error prone, as regex could match elsewhere in string.
  test "should calculte correct values" do
    get index_calculate_url, params: { income: 10000 }
	body = response.parsed_body.to_s
	pp(body)
	assert_match(/<strong>\$1050.0<\/strong>/, body)

	get index_calculate_url, params: { income: 35000 }
	body = response.parsed_body.to_s
	assert_match(/<strong>\$5033.0<\/strong>/, body)

	get index_calculate_url, params: { income: 100000 }
	body = response.parsed_body.to_s
	assert_match(/<strong>\$22877.5<\/strong>/, body)

	get index_calculate_url, params: { income: 220000 }
	body = response.parsed_body.to_s
	assert_match(/<strong>\$64877.5<\/strong>/, body)
  end
end
