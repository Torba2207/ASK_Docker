@echo off
for /f %%i in ('powershell -Command "Get-Location | Select-Object -ExpandProperty Path"') do set PWD=%%i

docker run -d --name nginx_server --network my_network -p 8080:80 -v "%PWD%/nginx.conf:/etc/nginx/nginx.conf" --user 1001:1001 --cap-drop=ALL --cap-add=NET_BIND_SERVICE --memory="100m" --cpus="1.0" nginx_server