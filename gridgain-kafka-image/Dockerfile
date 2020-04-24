FROM openjdk:8-jdk

RUN mkdir -p /kafka
RUN mkdir -p /plugin
RUN mkdir -p /scripts

COPY ./gridgain-kafka-connect /plugin/gridgain-kafka-connect
COPY ./debezium-connector-mysql /plugin/debezium-connector-mysql
COPY ./kafka /kafka

COPY kafka-init.sh /usr/local/bin/
RUN ln -s /usr/local/bin/kafka-init.sh /
RUN chmod +x /kafka-init.sh

COPY conf/connect-standalone.properties /
COPY conf/gridgain-sink.properties /
COPY conf/mysql-source.properties /
COPY conf/kafka-gridgain-client.xml /

ENTRYPOINT ["/kafka-init.sh"]
