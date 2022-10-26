# https://developers.redhat.com/blog/2021/04/16/deploying-the-mosquitto-mqtt-message-broker-on-red-hat-openshift-part-1#building__testing__and_publishing_the_image
FROM        ubi9/ubi:latest
LABEL       description="This is a mosquitto mqtt container image"
MAINTAINER  alex <savvyaxl@yahoo.com>
RUN         addgroup -g 1000 mosquitto && \
            adduser -G mosquitto -u 1000 -h /mosquitto -D mosquitto && \
            chown -R mosquitto:mosquitto /mosquitto && \
            yum install -y mosquitto
EXPOSE      8883
COPY        files/* /mosquitto/
USER        mosquitto
CMD         ["/mosquitto/start.sh"]