# Todo App - Step 1

Simple web server that outputs "Server started in port NNNN" on startup.

## Features
- Uses environment variable `PORT` to configure listening port
- Default port is 8080
- Simple HTTP server

## Running locally

```bash
# Install Ruby dependencies if using Sinatra
bundle install

# Run with default port
ruby app.rb

# Or with custom port
PORT=3000 ruby app.rb