@echo off
echo set %PATH% | findstr Docker.Toolbox > NUL 2>&1 || set "PATH=C:\Program Files\Docker Toolbox;e:\dev\Docker Toolbox;%PATH%"
FOR /f "tokens=*" %%i IN ('docker-machine env %1') DO @%%i
set DOCKER_VOLUMES_DOS=%USERPROFILE%\dockervolumes
set DOCKER_VOLUMES=%DOCKER_VOLUMES_DOS:C:\=/c/%
set DOCKER_VOLUMES=%DOCKER_VOLUMES:\=/%
docker-machine env | findstr /i set
echo SET MACHINE_STORAGE_PATH=%MACHINE_STORAGE_PATH%
echo SET DOCKER_VOLUMES_DOS=%DOCKER_VOLUMES_DOS%
echo SET DOCKER_VOLUMES=%DOCKER_VOLUMES%
