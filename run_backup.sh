#!/bin/bash

# Установите переменные окружения
export ORACLE_HOME=/home/oracle/install
export PATH=$ORACLE_HOME/bin:$PATH

# Путь к исполняемому файлу RMAN
RMAN_BIN="$ORACLE_HOME/bin/rman"

# Путь к скрипту RMAN
RMAN_SCRIPT="/home/oracle/files/backup_database.rman"

# Путь к лог-файлу
LOG_FILE="/home/oracle/data_pump_dir/backup_$(date +'%Y%m%d_%H%M%S').log"

# Запуск RMAN с использованием sysdba
$RMAN_BIN TARGET / @${RMAN_SCRIPT} > ${LOG_FILE} 2>&1

