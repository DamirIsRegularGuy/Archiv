# Используем официальный образ Oracle Linux в качестве базового
FROM oraclelinux:7-slim

# Устанавливаем необходимые пакеты и инструменты
RUN yum -y update && \
    yum -y install \
    gcc-c++ \
    postgresql-devel \
    make \
    cmake \
    && yum clean all

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем исходный код в контейнер
COPY /home/vboxdamir/cpptest/main.cpp

# Компилируем приложение
RUN g++ -std=c++11 main.cpp -o main -lpq

# Устанавливаем переменную окружения для информации о подключении к базе данных
ENV DB_CONNECTION_STRING="dbname=cometa user=mikki password=mikki host=localhost"

# Указываем команду для запуска приложения
CMD ["./main", "1"]

