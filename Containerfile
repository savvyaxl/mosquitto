FROM alpine:3.11
RUN addgroup -g 1000 mosquitto && \
     adduser -G mosquitto -u 1000 -h /mosquitto -D mosquitto && \
     chown -R mosquitto:mosquitto /mosquitto && \
     apk --no-cache add mosquitto
WORKDIR /mosquitto
COPY files/* /mosquitto/
USER mosquitto
EXPOSE 8883
CMD ["/mosquitto/start.sh"]