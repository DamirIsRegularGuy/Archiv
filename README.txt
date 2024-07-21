1) В файле hosts прописаны все хосты
2) "Доступ серверов" -> это скрин правильного подключения
3) 3.1 -> nginx_install.yml; 3.2 -> www_html.yml; 3.3 -> postgres_install.yml;
4) ...
5) ...
6) Dockerfile -> файл докера, где описан образ контейнера, 
сборка происходит следующим образом:
 docker build -f /home/vboxdamir/cometaserver/Dockerfile -t mycppapp:latest /home/vboxdamir/cpptest/
тут идет местоположение докерфайла и местоположение приложения и наконец запуск
контейнера, в моем случае:
docker run -d --name mycppapp-container -e DB_CONNECTION_STRING="dbname=cometa user=mikki password=mikki host=localhost" mycppapp:latest
 
