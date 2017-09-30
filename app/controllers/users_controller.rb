require 'json'

class UsersController < ApplicationController
  # GET /users
  def index
    result = HTTParty.get(
      ENV['SECOND_SERVICE_URL'] + '/users',
      headers: {
        'API-SECRET-KEY' => ENV['API_SECRET_KEY']
      }
    )
    json_response(result.body, result.code)
  end

  # POST /users
  def create
    result = HTTParty.post(
      ENV['SECOND_SERVICE_URL'] + '/users',
      body: {
        email: params['email'],
        image: params['image']
      }.to_json,
      headers: {
        'Content-Type' => 'application/json',
        'API-SECRET-KEY' => ENV['API_SECRET_KEY']
      }
    )
    json_response(result.body, result.code)
  end

  # GET /users/:id
  def show
    result = HTTParty.get(
      ENV['SECOND_SERVICE_URL'] + '/users/' + params['id'],
      headers: {
        'API-SECRET-KEY' => ENV['API_SECRET_KEY']
      }
    )
    json_response(result.body, result.code)
  end

  # PUT /users/:id
  def update
    result = HTTParty.put(
      ENV['SECOND_SERVICE_URL'] + '/users/' + params['id'],
      body: {
        email: params['email'],
        image: params['image']
      }.to_json,
      headers: {
        'Content-Type' => 'application/json',
        'API-SECRET-KEY' => ENV['API_SECRET_KEY']
      }
    )
    json_response(result.body, result.code)
  end

  # DELETE /users/:id
  def destroy
    result = HTTParty.delete(
      ENV['SECOND_SERVICE_URL'] + '/users/' + params['id'],
      headers: {
        'API-SECRET-KEY' => ENV['API_SECRET_KEY']
      }
    )
    json_response(result.body, result.code)
  end

  # POST /rest/verify_user/:email
  def login
    result = HTTParty.post(ENV['SECOND_SERVICE_URL'] + '/rest/verify_user/' + params['email'],
      body: {
        image: params['image'],
        useragent: request.user_agent,
        }.to_json,
      headers: {
        'Content-Type' => 'application/json',
        'API-SECRET-KEY' => ENV['API_SECRET_KEY']
      }
    )
    json_response(result.body, result.code)
  end
end
