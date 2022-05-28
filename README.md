# README

## Introduction

This is a flight booking application. It is a simple application that allows users to book flights. The application is written in Ruby and uses the Ruby on Rails framework.

## Data model
  * Flight:
    - id: integer
    - airline: string
    - flight_number: string
    - departure_airport: string
    - arrival_airport: string
    - departure_time: datetime
    - arrival_time: datetime
    - duration: integer
    - price: float
    - created_at: datetime
    - updated_at: datetime
  * Reservation:
    - id: integer
    - user_id: integer
    - flight_id: integer
    - created_at: datetime
    - updated_at: datetime
  * User:
    - id: integer
    - name: string
    - email: string
    - password_digest: string
    - created_at: datetime
    - updated_at: datetime
  * Passenger:
    - id: integer
    - user_id: integer
    - reservation_id: integer
    - name: string
    - email: string
    - created_at: datetime
    - updated_at: datetime
  * Admin:
    - id: integer
    - name: string
    - email: string
    - password_digest: string
    - created_at: datetime
    - updated_at: datetime