#!/bin/bash
printf "\n---------------------------------\n"
printf " Установка сервера Visit Tracker"
printf "\n---------------------------------\n"
if cd web
then
	printf "\nШаг 1. Запуск установки пакетов composer...\n"
	printf "\n*******************************************\n"

	if composer install
	then
		printf "\n*******************************************\n"	
		printf "\nПакеты проекта установлены! \n"
		

			printf "\nШаг 3. Запуск docker контейнеров...\n"
			printf "\n*******************************************\n"
			
			if cd .. && docker-compose up --build -d
			then

			    docker-compose exec php sh -c 'chmod -R 777 storage && php artisan migrate:fresh'

				printf "\n*******************************************\n"	
				printf "\nКонтейнеры собраны и запущены! \n"
			
			else
				printf "\n!! ОШИБКА !! Ошибка сборки контейнеров, проверьте правильность установки docker и docker-compose, затем повторите попытку\n"
				return
			fi
	else
		printf "\n!! ОШИБКА !! Проверьте правильность установки composer или наличие подключения к интернету\n"
		return
	fi

else
	printf "\n!! ОШИБКА !! Не найдена папка web, для исправления склонируйте репозиторий повторно и повторите попытку установки\n"
	return
fi
