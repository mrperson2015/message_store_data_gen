FROM airdock/oraclejdk:1.8

WORKDIR /root

RUN curl -k -o json-data-generator-bin.tar -L https://github.com/everwatchsolutions/json-data-generator/releases/download/json-data-generator-1.4.0/json-data-generator-1.4.0-bin.tar; tar -xf json-data-generator-bin.tar -C / ; mv /json-data-generator-1.4.0 /json-data-generator

WORKDIR /json-data-generator

RUN cp conf/exampleSimConfig.json conf/SimConfig.json; mkdir logs
COPY conf/* conf/

VOLUME ["/json-data-generator/logs", "/json-data-generator/conf"]

CMD ["java", "-jar", "json-data-generator-1.4.0.jar", "exampleSimConfig.json" ]