# resteasy rest logging
* call mvnw -DskipTests clean package
* call docker-env.bat
* docker build -t interceptordemo:1.0 .
* start docker run -it --rm --name interceptordemo -p 8080:8080 interceptordemo:1.0
* mysleep 20
* curl http://192.168.99.100:8080/interceptordemo/users/1
* docker cp interceptordemo:/jboss-as-7.1.1.Final/standalone/log/server.log .
* docker stop interceptordemo
* notepad server.log
