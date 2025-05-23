# https://developers.redhat.com/blog/2021/04/16/deploying-the-mosquitto-mqtt-message-broker-on-red-hat-openshift-part-1#building__testing__and_publishing_the_image
FROM docker.io/alpine:latest
RUN addgroup -g 1000 mosquitto && \
     adduser -G mosquitto -u 1000 -h /mosquitto -D mosquitto && \
     apk --no-cache add mosquitto
WORKDIR /mosquitto
COPY files/* /mosquitto/
RUN chown -R mosquitto:mosquitto /mosquitto && \
     chmod 0600 /mosquitto/passwd && \
     chmod 0700 /mosquitto/start.sh
USER mosquitto
EXPOSE 1883
EXPOSE 8883
CMD ["/mosquitto/start.sh"]
