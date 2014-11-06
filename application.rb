require 'sinatra'
require 'json'
require 'net/http'

require_relative 'params_parser'

get '/' do
  ParamsParser.transform_and_send_request(params.fetch(:properties, {}))
end

post '/api/v1/room' do
  puts " #{ request.env['HTTP_AUTHORIZATION'] } "
  puts " Params : #{ params } "
  redirect to('/hi'), 301
end