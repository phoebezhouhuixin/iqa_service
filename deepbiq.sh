# volume map to source code (ie. /app)
docker run -it \
-v /Users/phoebezhouhuixin/FastAPIServerWalkthrough/app:/app \
-p 8000:8000 \
phoebezhouhuixin/deepbiq_deploy
# then go to http://0.0.0.0:8000/




# By default, each container run by Docker has its own network namespace, with its own IPs:
# 8000 (port number of socket on docker host, to be subsequently used by clients (browsers)):8000 (port number of socket on docker container)
# ^from mumshad - port mapping

# -p 192.168.1.100:8080:80
# "Map TCP port 80 in the container, to port 8080 on the Docker host, for connections to host IP 192.168.1.100.""
# i.e. 192.168.1.100 is an IP address in the Docker host's network namespace, NOT your own computer's network namespace.
# from https://docs.docker.com/config/containers/container-networking/
# If we specify -p 127.0.0.1:3000:3000, we are binding 
# TODO not sure
# https://pythonspeed.com/articles/docker-connection-refused/ 
# https://forums.docker.com/t/using-localhost-for-to-access-running-container/3148
# (127.0.0.1 is a pseudonym for localhost which in this case means the server can only be accessed by the docker host itself.
# If your docker host is in a VM, that’s different from your 127.0.0.1 on your mac.)
# If just 8000:8000, then it means 0.0.0.0:8000:8000 -
# You need to bind a server to 0.0.0.0 so that traffic coming from outside the container is also accepted. If you don't,
# the server will not be reachable from outside the container. 