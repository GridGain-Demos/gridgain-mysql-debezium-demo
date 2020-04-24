if [ ! -d "gridgain-kafka-image/kafka" ]
then
	echo "Kafka wasn't found, downloading kafka_2.12-2.4.0"
	curl -o kafka.tgz "http://apache.mirrors.pair.com/kafka/2.4.0/kafka_2.12-2.4.0.tgz"
	mkdir ./gridgain-kafka-image/kafka
	tar -xvzf kafka.tgz --directory ./gridgain-kafka-image/kafka --strip-components 1
	rm kafka.tgz
fi
if [ ! -d "gridgain-kafka-image/debezium-connector-mysql" ]
then
	echo "Debezium connector wasn't found, downloading debezium-connector-mysql-1.1.0"
	curl -o debezium-connector-mysql.tgz -X GET -L 'https://oss.sonatype.org/service/local/artifact/maven/redirect?r=snapshots&g=io.debezium&a=debezium-connector-mysql&v=LATEST&c=plugin&e=tar.gz'
	mkdir ./gridgain-kafka-image/debezium-connector-mysql
	tar -xvzf debezium-connector-mysql.tgz --directory ./gridgain-kafka-image/debezium-connector-mysql --strip-components 1
	rm debezium-connector-mysql.tgz
fi

# Run setup
docker-compose -f gridgain-cluster-docker-compose.yml up -d
