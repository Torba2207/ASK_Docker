@echo off
for /f %%i in ('powershell -Command "pwd"') do set PWD=%%i

docker run -d --name apache_server --network my_network -v "%PWD%/sample/index.html:/usr/local/apache2/htdocs/index.html" --user 1000:1000 --cap-drop=ALL --cap-add=NET_BIND_SERVICE --memory="100m" --cpus="1.0" apache_server

