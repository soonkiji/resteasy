REM clean up leftover from previous test
del /q server.log > NUL 2>&1
docker stop interceptordemo_jboss_1 > NUL 2>&1
docker rm interceptordemo_jboss_1 > NUL 2>&1

REM build
echo call mvnw -DskipTests clean package
call mvnw -DskipTests clean package

REM deploy
call docker-env.bat
echo docker-compose up
start docker-compose up
mysleep 20

REM test
echo curl http://192.168.99.100:8080/interceptordemo/users/1
curl http://192.168.99.100:8080/interceptordemo/users/1

echo curl http://192.168.99.100:8080/interceptordemo/users -X POST --header "Content-Type: application/json" -d "{\"name\":\"User (modified at %TIME%)\",\"id\":1}"
curl http://192.168.99.100:8080/interceptordemo/users -X POST --header "Content-Type: application/json" -d "{\"name\":\"User (modified at %TIME%)\",\"id\":1}"

REM cleanup
echo docker cp interceptordemo_jboss_1:/jboss-as-7.1.1.Final/standalone/log/server.log .
docker cp interceptordemo_jboss_1:/jboss-as-7.1.1.Final/standalone/log/server.log .
echo docker stop interceptordemo_jboss_1
docker stop interceptordemo_jboss_1

REM verify
code server.log
