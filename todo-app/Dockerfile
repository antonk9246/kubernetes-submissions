FROM ruby:3.2-alpine

WORKDIR /app

RUN apk add --no-cache tzdata && \
    gem install webrick

COPY app.rb ./
RUN sed -i 's/\r$//' /app/app.rb && \
    chmod +x /app/app.rb

ENV PORT=8080
EXPOSE 8080

CMD ["ruby", "app.rb"]