docker stop gridgain-kafka gridgain-node-1 gridgain-node-2 sql gridgain-webconsole-backend gridgain-webconsole-frontend myadmin
docker rm gridgain-kafka gridgain-node-1 gridgain-node-2 sql gridgain-webconsole-backend gridgain-webconsole-frontend myadmin
docker system prune -f
docker volume prune -f
docker network prune -f