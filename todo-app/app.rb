#!/usr/bin/env ruby
require 'socket'
require 'sinatra'

$stdout.sync = true

port = ENV['PORT'] || '8080'

set :port, port
set :bind, '0.0.0.0'

puts "Server started in port #{port}"

get '/' do
  "Todo app is running on port #{port}"
end

get '/health' do
  'OK'
end