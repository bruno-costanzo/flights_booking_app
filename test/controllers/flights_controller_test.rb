# frozen_string_literal: true

require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get flights_index_url
    assert_response :success
  end

  test 'index should display a search form' do
    get flights_index_url
    assert_select 'form' do
      assert_select 'select[name=?]', 'search[from]'
      assert_select 'select[name=?]', 'search[to]'
      assert_select 'input[name=?]', 'search[date]'
      assert_select 'input[type=submit]'
    end
  end
end
