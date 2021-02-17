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

2. Установите необходимые гемы, создайте базу данных и сделайте необходимые миграции

```
$ bundle
$ yarn
$ rails db:create
$ rails db:migrate
```

2.1 Так же для работы приложения
вам необходимо добавить токены от таких сервисов, как:

Яндекс карты

Вконтакте

Facebook

Mailjet

Amazon AWS

Добавить их необходимо в credentials, при помощи команды

```
rails credentials:edit
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
