FROM ruby:3.2-alpine

WORKDIR /app

RUN apk add --no-cache tzdata

COPY app.rb /app/

RUN chmod +x /app/app.rb

CMD ["ruby", "/app/app.rb"]