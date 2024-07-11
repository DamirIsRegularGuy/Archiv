#include <iostream>
#include <libpq-fe.h> 
#include <cstdlib>
#include <string> 

//Функция для закрытия соединения с postgres при какой-то ошибке
void exit_nicely(PGconn *conn) {
    PQfinish(conn);
    std::exit(1); 
}

int main(int argc, char *argv[]) {
    const char *conninfo;
    PGconn     *conn;
    PGresult   *res;

    //моммент подключения к базе данных
    conninfo = "dbname=cometa user=mikki password=mikki host=localhost";

    //само подключение, выше это параметры подключения
    conn = PQconnectdb(conninfo);

    //проверка статуса подключения
    if (PQstatus(conn) != CONNECTION_OK) {
        std::cerr << "Connection to database failed: " << PQerrorMessage(conn) << std::endl;
        exit_nicely(conn);
    }

    //Получение аргумента из вызова кода
    int id;
    if (argc < 2) {
        std::cerr << "Usage: " << argv[0] << " <id>" << std::endl;
        exit_nicely(conn);
    } else {
        id = std::atoi(argv[1]);
    }

    //Запрос
    std::string query = "SELECT * FROM cities WHERE id = " + std::to_string(id); // Use std::to_string from <string>

    //Выполнение запроса
    res = PQexec(conn, query.c_str());

    //Проверка выполнения запроса
    if (PQresultStatus(res) != PGRES_TUPLES_OK) {
        std::cerr << "SELECT query failed: " << PQerrorMessage(conn) << std::endl;
        PQclear(res);
        exit_nicely(conn);
    }

    //Далее идет вывод данных
    int numRows = PQntuples(res);
    int numFields = PQnfields(res);

    //Вывод заголовков
    for (int i = 0; i < numFields; i++) {
        std::cout << PQfname(res, i) << "\t";
    }
    std::cout << std::endl;

    //Вывод данных
    for (int i = 0; i < numRows; i++) {
        for (int j = 0; j < numFields; j++) {
            std::cout << PQgetvalue(res, i, j) << "\t";
        }
        std::cout << std::endl;
    }

    //Идет освобожление ресурсов
    PQclear(res);

    //закрытие программы
    PQfinish(conn);

    return 0;
}

//g++ -std=c++11 main.cpp -o main -lpq
//Пример компиляции кода и 
// ./main 3 пример запуска программы и он должен вывести Хорог

