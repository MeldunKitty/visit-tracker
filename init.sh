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
		
		printf "\nШаг 2. Настройка прав в storage...\n"
		
		if chmod -R 775 storage
		then
			printf "\n*******************************************\n"	
			printf "\nПрава настроены! \n"
			
			printf "\nШаг 3. Запуск docker контейнеров...\n"
			printf "\n*******************************************\n"
			
			if cd .. && docker-compose up --build -d
			then
				printf "\n*******************************************\n"	
				printf "\nКонтейнеры собраны и запущены! \n"
			
			else
				printf "\n!! ОШИБКА !! Проверьте правильность установки docker и docker-compose, затем повторите попытку\n"
				return
			fi

		else
			printf "\n!! ОШИБКА !! Ошибка настройки прав в storage\n"
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
