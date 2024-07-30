# Используем официальный образ Python в качестве базового
FROM python:3.11-slim

# Устанавливаем переменную окружения для отключения буферизации вывода
ENV PYTHONUNBUFFERED=1

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файл зависимостей в контейнер
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь исходный код в рабочую директорию
COPY . .

# Открываем порт 80
EXPOSE 80

# Определяем команду запуска приложения
CMD ["python", "app.py"]
