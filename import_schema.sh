#!/bin/bash

# Переменные
IMPDP_DIR='/home/oracle/data_pump_dir'  # Путь к директории
DUMPFILE='read_only_user_dump.dmp'      # Имя файла дампа
LOGFILE='read_only_user_export.log'     # Имя файла лога
USER='admin_user'              # Пользователь базы данных
PASSWORD='admin_user'             # Пароль пользователя
DB_CONNECTION='localhost:1521/cometa'        # Строка подключения к базе данных

impdp ${USER}/${PASSWORD}@${DB_CONNECTION} \
    DIRECTORY=dp_dir \
    DUMPFILE=${DUMPFILE} \
    LOGFILE=${LOGFILE} \
    REMAP_SCHEMA=source_schema:target_schema
