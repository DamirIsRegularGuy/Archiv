#!/bin/bash

#Сначала создал директорию определил ее в БД, потом создал файл скрипта
#Записал все в него, то есть все что есть ниже. Дал права на выполнение
#скрипту через chmod 744 export_schema.sh и запустил скрипт ./export_schema.sh

# Переменные
EXPDP_DIR='/home/oracle/data_pump_dir'  # Путь к директории
SCHEMA_NAME='read_only_user'            # Имя схемы (то что надо экспортировать)
DUMPFILE='read_only_user_dump.dmp'      # Имя файла дампа
LOGFILE='read_only_user_export.log'     # Имя файла лога
USER='admin_user'              # Пользователь базы данных
PASSWORD='admin_user'             # Пароль пользователя
DB_CONNECTION='localhost:1521/cometa'        # Строка подключения к базе данных

# Выполнение экспорта
expdp ${USER}/${PASSWORD}@${DB_CONNECTION} \
    DIRECTORY=dp_dir \
    DUMPFILE=${DUMPFILE} \
    LOGFILE=${LOGFILE} \
    SCHEMAS=${SCHEMA_NAME}

