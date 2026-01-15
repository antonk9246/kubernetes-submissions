#!/usr/bin/env ruby
require 'webrick'

$stdout.sync = true

port = ENV['PORT'] || '8080'
app_name = ENV['APP_NAME'] || 'Todo Application'
app_version = ENV['APP_VERSION'] || '1.0'

puts "Server started in port #{port}"
puts "Application: #{app_name} v#{app_version}"

server = WEBrick::HTTPServer.new(
  Port: port,
  BindAddress: '0.0.0.0',
  Logger: WEBrick::Log.new(nil, 0),
  AccessLog: []
)

server.mount_proc '/' do |req, res|
  html = <<~HTML
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>#{app_name}</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f5f5f5;
            }
            .container {
                background-color: white;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }
            h1 {
                color: #333;
                border-bottom: 2px solid #4CAF50;
                padding-bottom: 10px;
            }
            .info {
                background-color: #e8f5e9;
                padding: 15px;
                border-radius: 5px;
                margin: 20px 0;
            }
            .todo-list {
                margin-top: 20px;
            }
            .todo-item {
                padding: 10px;
                border-bottom: 1px solid #eee;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>#{app_name}</h1>
            
            <div class="info">
                <p><strong>Version:</strong> #{app_version}</p>
                <p><strong>Port:</strong> #{port}</p>
                <p><strong>Timestamp:</strong> #{Time.now.utc.iso8601}</p>
            </div>
            
            <div class="todo-list">
                <h2>Todo Items</h2>
                <div class="todo-item">✅ Set up Kubernetes deployment</div>
                <div class="todo-item">✅ Create Docker container</div>
                <div class="todo-item">🚧 Add database connection</div>
                <div class="todo-item">📋 Implement CRUD operations</div>
                <div class="todo-item">🔧 Add user authentication</div>
            </div>
            
            <p><em>This is a simple todo application for DevOps with Kubernetes course.</em></p>
        </div>
    </body>
    </html>
  HTML
  
  res.body = html
  res['Content-Type'] = 'text/html'
  res['Cache-Control'] = 'no-cache'
end

server.mount_proc '/health' do |req, res|
  res.body = 'OK'
  res['Content-Type'] = 'text/plain'
end

server.mount_proc '/api/status' do |req, res|
  status = {
    status: 'running',
    app: app_name,
    version: app_version,
    port: port.to_i,
    timestamp: Time.now.utc.iso8601,
    uptime: Process.clock_gettime(Process::CLOCK_MONOTONIC).to_i
  }
  
  res.body = JSON.generate(status)
  res['Content-Type'] = 'application/json'
end

trap('INT') do
  puts "\nShutting down server..."
  server.shutdown
end

trap('TERM') do
  puts "\nShutting down server..."
  server.shutdown
end

server.start