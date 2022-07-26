# TestGuru - Rails-приложение для создания и прохождения тестов

### Атрибуты пользователя:
 - имя
 - уникальный email
 - пароль

### Возможности пользователей
##### Неавторизованный пользователь
 - регистрация
 - авторизация
##### Авторизованный пользователь
 - просмотр списка тестов
 - прохождение теста
 - создание Gist с вопросом теста на gist.github.com
 - получение результата теста (пройден / не пройден, количество верных ответов)
##### Администратор
 - просмотр списка тестов
 - панель администратора http://localhost:3000/admin/tests
    - просмотр, создание, изменение, удаление тестов
    - просмотр, создание, изменение, удаление вопросов для теста  
 - Gist-панель http://localhost:3000/admin/gists
    - порсмотр созданных пользователями gist с почтой пользователя и ссылкой на gist
    
    
##### Логин администратора  admin@mail.ru пароль 111111
##### Логин пользователя just_user@mail.ru пароль 111111
    
    
## Локализация
- Русский http://localhost:3000/
- Английский http://localhost:3000/?lang=en

***
# Запуск
Склонируйте репозиторий на свой компьютер.
Установите нужные гемы
```
bundle install
```
Сделайте миграцию:
```
bundle exec rake db:migrate
```
Заполните БД тестовыми данными:
```
bundle exec rake db:seed
```
Выполните команду из корневого каталога проекта 
```
rails s
```
Затем откройте страницу localhost:3000 в браузере.

## Список сущностей для проекта TestGuru:

* Пользователи
* Администратор
* Вопросы теста
* Ответы теста
* Тесты
* Результаты теста

ER-диаграмма 
https://github.com/Manziuchka/test-guru/wiki

