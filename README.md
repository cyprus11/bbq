# Приложение "Шашлыки".

В данном приложении вы можете создавать "События", на которые могут подписываться как 
ваши друзья, так и другие, желающие поучавстовать люди.

Если же вы хотите, чтобы доступ имели только друзья, то можете защитить доступ к событию при 
помощи пин-кода.

Данное приложение реализовано на языке Ruby 2.7.2 и RoR 6.0.

### Запуск приложения

1. Скопируйте приложение:

```
$ git clone git@github.com:cyprus11/bbq.git
```

Или просто скачайте его на свой компьютер.

2. Установите необходимые гемы, создайте базу данных и сделайте необходимые миграции, создайте файл ```config/database.yml``` - 
в данном файле необходимо прописать настройки для подключения к вашей БД, [тут можно прочитать как это сделать](https://edgeguides.rubyonrails.org/configuring.html#configuring-a-database)
После настройки параметров подключения к БД, выполните следующие действия в консоли:

```
$ bundle
$ yarn
$ rails db:create
$ rails db:migrate
```

2.1 Так же для работы приложения
вам необходимо добавить токены от таких сервисов, как:

Для отображения точки на Яндекс картах - ```app/views/layous/application.html.erb```

Для OmniAuth аутентификации Вконтакте - ```config/initializers/devise.rb```

Для OmniAuth аутентификации Facebook - ```config/initializers/devise.rb```

Для отправки уведомлений и писем Mailjet - ```config/initializers/mailjet.rb```

Для хранения файлов изображений Amazon AWS - ```config/initializers/carrierwave.rb```

Для деплоя на ваш удаленный сервер Capistrano - ```config/deploy.rb```

Если вы планируете хранить код приложения в открытых источниках, то лучше добавить необходимые токены в credentials, 
при помощи команды

```
rails credentials:edit
```

Структура файла с credentials:

```
 aws:
   s3_access_key: <token>
   s3_secret_key: <token>
   s3_bucket_name: <token>
   s3_region_name: <token>
 mailjet:
   mailjet_default_from: <token>
   mailjet_password: <token>
   mailjet_smtp_login: <token>
   mailjet_smtp_port: <token>
   mailjet_smtp_server: <token>
 capistrano:
   application: <token>
   repo_url: <token>
 yandex_maps:
   api_key: <token>
 vkontakte:
   app_id: <token>
   app_secret_key: <token>
 facebook:
   app_id: <token>
   app_secret_key: <token>

```

3. Запустите приложение:

3.1 Выполните в двух отдельных окнах терминала

```
$ bin/webpack-dev-server
```
```
$ rails s
```

3.2 Либо при помощие гема foreman

```
$ foreman start
```

Так же можете посмотреть рабочий вариант по ссылке: [https://tav-dev.tk](https://tav-dev.tk)
