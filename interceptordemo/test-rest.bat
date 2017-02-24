@echo off
set headers=--header "Content-Type: application/json"

echo ---- Test version ----
echo curl --insecure -s https://ud18174/interceptordemo/version
curl --insecure -s https://ud18174/interceptordemo/version
echo.

REM echo ---- Test GET ---
REM echo curl --insecure -s https://ud18174/interceptordemo/user/get/1
REM curl --insecure -s https://ud18174/interceptordemo/user/get/1
REM echo.

echo ---- Test POST ----
echo {"name":"User one (modified at %TIME%)","id":1}> user.json
echo curl --insecure -s https://ud18174/interceptordemo/user/post -X POST -d @user.json %headers%
curl --insecure -s https://ud18174/interceptordemo/user/post -X POST -d @user.json %headers%
curl --insecure -s https://ud18174/interceptordemo/user/get/1
echo.

REM echo ---- Sending blank data ----
REM echo {"name":"","id":1}> user-blank.json
REM echo curl --insecure -s https://ud18174/interceptordemo/user/post -X POST -d @user-blank.json %headers%
REM curl --insecure -s https://ud18174/interceptordemo/user/post -X POST -d @user-blank.json %headers%
REM curl --insecure -s https://ud18174/interceptordemo/user/get/1
REM echo.

echo ---- Sending invalid format data ----
echo {"namX":"User one (modified at %TIME%)","id":1}> user-invalid.json
echo curl --insecure -s https://ud18174/interceptordemo/user/post -X POST -d @user-invalid.json %headers%
curl --insecure -s https://ud18174/interceptordemo/user/post -X POST -d @user-invalid.json %headers%
curl --insecure -s https://ud18174/interceptordemo/user/get/1
echo.
