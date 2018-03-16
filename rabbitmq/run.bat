@echo off
docker run -d --name rabbitmaster --hostname rabbitmaster -e RABBITMQ_USER=guest -e RABBITMQ_PASS=guest lyonwang/rabbitmq:centos7
ping 127.0.0.1 -n 11 > nul
docker run -d --name rabbitslave --hostname rabbitslave -e RABBITMQ_USER=guest -e RABBITMQ_PASS=guest -e CLUSTER_WITH=rabbitmaster -p 15672:15672 -p 5672:5672 --link rabbitmaster lyonwang/rabbitmq:centos7