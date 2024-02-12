pip install -r ../require.txt

chmod +x ../docker/spark/build.sh

../docker/spark/build.sh

docker-compose -f ../docker/docker-compose.yml up 

