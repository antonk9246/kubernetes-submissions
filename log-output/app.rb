#!/usr/bin/env ruby
require 'securerandom'
require 'time'

$stdout.sync = true

random_string = SecureRandom.uuid
puts "Application started. Random string: #{random_string}"

loop do
  timestamp = Time.now.utc.iso8601(3)
  puts "#{timestamp}: #{random_string}"
  sleep 5
end