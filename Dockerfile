FROM python:3.11-slim
# Используем образ с установленным Python

# Добавляем label, используя переменную среды
LABEL author=${AUTHOR}

COPY . ./churn_app
# Копируем файлы в директорию churn_app внутри контейнера

WORKDIR churn_app
# Устанавливаем рабочую директорию

RUN pip3 install -r requirements.txt
# Устанавливаем зависимости из requirements.txt

# Инструкция для открытия порта, указанного в переменной среды
EXPOSE ${APP_PORT}

VOLUME /models
# Примонтируем том с моделями

# Изменяем команду запуска, учитывая порт из .env
CMD uvicorn app.churn_app:app --reload --port ${APP_PORT} --host 0.0.0.0