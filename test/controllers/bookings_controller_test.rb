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
end
