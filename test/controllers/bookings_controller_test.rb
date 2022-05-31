# frozen_string_literal: true

require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    flight = FactoryBot.create(:flight)
    params = { booking: { passengers: 2, flight: flight.id } }
    get bookings_new_url, params: params
    assert_response :success
  end

  test 'new view renders a form' do
    flight = FactoryBot.create(:flight)
    params = { booking: { passengers: 2, flight: flight.id } }
    get bookings_new_url, params: params
    assert_select 'form' do
    end
  end

  test 'new view render form with fields_for two bookings if passenger = 2' do
    flight = FactoryBot.create(:flight)
    params = { booking: { passengers: 2, flight: flight.id } }
    get bookings_new_url, params: params
    assert_select 'form' do
      assert_select 'input[name=?]', 'bookings[booking_0][passenger][name]', count: 1
      assert_select 'input[name=?]', 'bookings[booking_1][passenger][name]', count: 1
    end
  end

  test 'new view render form with fields_for one booking if passenger = 1' do
    flight = FactoryBot.create(:flight)
    params = { booking: { passengers: 1, flight: flight.id } }
    get bookings_new_url, params: params
    assert_select 'form' do
      assert_select 'input[name=?]', 'bookings[booking_0][passenger][name]', count: 1
    end
  end
end
