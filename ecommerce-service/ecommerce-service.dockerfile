FROM alpine:latest

RUN mkdir /app

COPY ecommerceApp /app

CMD ["/app/ecommerceApp"]