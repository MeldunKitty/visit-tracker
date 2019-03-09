# Visit Tracker

Расширение для google chrome для отслеживания посещенных пользователями страниц. Посещением расширение считает событие `chrome.tabs.onUpdated`

## Установка расширения

1. Клонируйте этот репозиторий введя в терминале команду
   
    ```sh
    git clone https://github.com/MeldunKitty/visit-tracker.git
    ```
2.  Запустите ваш браузер google chrome и перейдите в нем по адресу 
    ```sh
    chrome://extensions/
    ```
3. В верхнем правом углу переключите флажок "Режим разработчика" на позицию вкл.

4. В верхней левой части экрана нажмите кнопку "Загрузить распакованное расширение"
5. В меню выбора папки выберите папку `chrome_extension`, которая находится в папке проекта
6. После этого у вас в списке установленных расширений добавится расширение `Visit Tracker`, а в омнибаре (верхний правый угол окна браузера, место, где расположены иконки расширений) появится его значок - лупа на зелёном фоне
7. При нажатии на иконку приложения вы увидите всплывающее окно с указанием статуса доступности сервера, на котором сохраняются данные о посещениях, в данный момент сервер еще не установлен и вы увидите надпись `FAIL`, давайте это исправим

## Установка сервера

1. Для установки и запуска сервера достаточно перейти в папку `visit-tracker`, запустить терминал в данной папке и выполнить команду
   
    ```sh
    chmod +x ./init.sh && ./init.sh
    ```
2. Заглушка страницы серверной части доступна по адресу `https://localhost/`
3. `Phpmyadmin` доступен по адресу `http://localhost:8080/`. Пароль и пользователь `root`, сервер указывать не нужно

## Проверка установки

1. После установки расширения и сервера, при нажатии на иконку расширения вы увидите, что статус сервера сменился на `OK`.
2. Далее вы можете продолжить сёрфинг в интернете, а после некоторого периода времени перейти по адресу `http://localhost:8080/`, войти в панель (Пароль и пользователь `root`), выбрать в левой части экрана БД под названием `visit_tracker`, далее выборать таблицу visits и увидеть записи ваших посещений. 